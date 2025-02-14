import 'dart:io';

import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/features/profile/domain/repositories/profile_repositry.dart';

class GetProfile {
  final ProfileRepository profileRepositry;

  GetProfile({required this.profileRepositry}); 
  Future<ProfileEntitiey> call(ProfileParams profile) async {
    return await profileRepositry.getProfile(profile);

  }

  Future<String> callimage(File file) async => profileRepositry.adddimage(file);

  Future<void> callupdateimage(ProfileEntitiey profile) async => profileRepositry.updateimage(profile);

}