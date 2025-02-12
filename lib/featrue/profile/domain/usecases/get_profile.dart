import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/featrue/profile/domain/repositories/profile_repositry.dart';

class GetProfile {
  final ProfileRepository profileRepositry;

  GetProfile({required this.profileRepositry}); 
  Future<ProfileEntitiey> call(ProfileParams profile) async {
    return await profileRepositry.getProfile(profile);
  }
}