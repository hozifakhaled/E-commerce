import 'dart:convert';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/error/expentions.dart';
import 'package:ecommercefirebase/featrue/profile/data/models/profile_model.dart';

class ProfileDataSourseLocal {
  final CacheHelper cache;
  final String key = "CachedUse";
  ProfileDataSourseLocal({required this.cache});

  cacheUser(ProfileModel? profileToCache) {
    if (profileToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          profileToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<ProfileModel> getLastproduct() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
     
      return Future.value(ProfileModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}