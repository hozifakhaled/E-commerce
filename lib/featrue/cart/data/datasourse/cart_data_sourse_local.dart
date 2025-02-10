import 'dart:convert';

import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/error/expentions.dart';
import 'package:ecommercefirebase/featrue/cart/data/models/cart_model.dart';

class CartDataSourseLocal {
  final CacheHelper cache;
  final String key = "CachedUse";
  CartDataSourseLocal({required this.cache});

  cacheUser(List<CartModel>? userToCache) {
    if (userToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          userToCache.map((product) => product.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<CartModel>> getLastproduct() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      final List<CartModel> productList = decodedJson.map((jsonItem) => CartModel.fromJson(jsonItem)).toList();
      return Future.value(productList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}