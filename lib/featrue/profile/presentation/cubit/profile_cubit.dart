// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/profile/data/repository/profile_repository_impli.dart';
import 'package:ecommercefirebase/featrue/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/featrue/profile/domain/usecases/get_profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfile(String id) async {
    emit(ProfileLoading());
    try {
  GetProfile(profileRepositry: getIt.get<ProfileRepositoryImpli>())
      .call(ProfileParams(id: id))
      .then((value) => emit(ProfileLoaded(value)));
}  catch (e) {
  emit(ProfileError(e.toString()));
}
  }
}
