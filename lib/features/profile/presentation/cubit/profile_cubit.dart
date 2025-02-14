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

  getProfile(String id) async {
    emit(ProfileLoading());
    try {
      GetProfile(profileRepositry: getIt.get<ProfileRepositoryImpli>())
          .call(ProfileParams(id: id))
          .then((value) => emit(ProfileLoaded(value)));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  File? imagee;

  addimage(String email, ProfileEntitiey profile) async {
    try {
      emit(ProfileLoading());
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemp = File(image.path);

        imagee = imageTemp;
        //emit(Adminpickimage(image: imagee!));
        var stringimage = await GetProfile(
                profileRepositry: getIt.get<ProfileRepositoryImpli>())
            .callimage(imageTemp);
        GetProfile(profileRepositry: getIt.get<ProfileRepositoryImpli>())
            .callupdateimage(ProfileEntitiey(
                email: email,
                image: stringimage,
                name: '',
                phone: '',
                age: ''));
        emit(ProfileLoaded(profile));
      }
    } on Exception catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  logout(context) {
    CacheHelper().removeData(key: 'id');
    GoRouter.of(context).push('/onb');
  }
}
