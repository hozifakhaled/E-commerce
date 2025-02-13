import 'dart:io';

import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/profile/domain/entities/profile_entitiey.dart';

abstract class ProfileRepository {
Future<void> updateimage(ProfileEntitiey profile, );
  Future<ProfileEntitiey> getProfile(ProfileParams profile);
    Future<String> adddimage(File file);

}