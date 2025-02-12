import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/profile/domain/entities/profile_entitiey.dart';

abstract class ProfileRepository {

  Future<ProfileEntitiey> getProfile(ProfileParams profile);
}