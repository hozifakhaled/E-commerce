import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/profile/data/datasourse/profile_data_source_remote.dart';
import 'package:ecommercefirebase/featrue/profile/data/datasourse/profile_data_sourse_local.dart';
import 'package:ecommercefirebase/featrue/profile/domain/entities/profile_entitiey.dart';
import 'package:ecommercefirebase/featrue/profile/domain/repositories/profile_repositry.dart';

class ProfileRepositoryImpli implements ProfileRepository {
  final ProFileDataSourceRemote remote;
  final NetworkInfo networkInfo;
  final ProfileDataSourseLocal local;

  ProfileRepositoryImpli({required this.remote, required this.networkInfo, required this.local});

 
 
  @override
  Future<ProfileEntitiey> getProfile(ProfileParams profile)async {
   if (await networkInfo.isConnected!) {
        try {
  final remoteProfile = await remote.getdata(profile  );
  
  local.cacheUser(remoteProfile);
  return remoteProfile;
} on Exception catch (e) {
        throw Exception(e.toString());
      }
   }else{
     try {
  final localProfile = await local.getLastproduct();
     return localProfile;
}on Exception catch (e) {
        throw Exception(e.toString());
      }
   }
  }
}
