import 'dart:convert';

import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/error/expentions.dart';
import 'package:ecommercefirebase/features/cart/data/models/cart_model.dart';

class CartDataSourseLocal {
  final CacheHelper cache;
  //final String key = "CachedCart";
  CartDataSourseLocal({required this.cache});

  cacheUser(List<CartModel>? userToCache, String key) {
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

  Future<List<CartModel>> getLastproduct( String key) {
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