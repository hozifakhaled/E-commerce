// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/profile/data/repository/profile_repository_impli.dart';
import 'package:ecommercefirebase/features/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/features/profile/domain/usecases/get_profile.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  String? imageid;

  getProfile(String id) async {
    emit(ProfileLoading());
    try {
      final data = await GetProfile(
              profileRepositry: getIt.get<ProfileRepositoryImpli>())
          .call(ProfileParams(id: id));
      emit(ProfileLoaded(data));
    } catch (error) {
      emit(ProfileError(error.toString()));
    }
  }

  File? image;
  String? imagePath ='';
  final ImagePicker _picker = ImagePicker();
  addimage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source:source);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        CacheHelper().saveData(key: 'image', value: (pickedFile.path));
       //    emit(ImageLoaded(image!));
      }
    } catch (e) {
       //  emit(ImageError("حدث خطأ أثناء اختيار الصورة"));
    }
  
    imagePath = await CacheHelper().getData(key: 'image');
    
  }
  

  logout(context) {
    CacheHelper().removeData(key: 'id');
    GoRouter.of(context).go('/onb');
  }
}
