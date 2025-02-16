import 'dart:convert';

import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/error/expentions.dart';
import 'package:ecommercefirebase/features/comments/data/models/comments_model.dart';

class CommentDataSourseLocal {
  final CacheHelper cache;
  final String key = "Cachedcomments";
  CommentDataSourseLocal({required this.cache});

  cacheComments(List<CommentsModel>? userToCache) {
    if (userToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          userToCache.map((comment) => comment.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<CommentsModel>> getLastCommment() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      final List<CommentsModel> productList = decodedJson.map((jsonItem) => CommentsModel.fromJson(jsonItem)).toList();
      return Future.value(productList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}