import 'dart:convert';

import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/error/expentions.dart';
import 'package:ecommercefirebase/features/categories/data/models/product_model.dart';

class ProductDataSourseLocal {
  final CacheHelper cache;
  final String key = "Cachedproduct";
  ProductDataSourseLocal({required this.cache});

  cacheUser(List<ProductModel>? userToCache) {
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

  Future<List<ProductModel>> getLastproduct() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      final List<ProductModel> productList = decodedJson.map((jsonItem) => ProductModel.fromFirestore(jsonItem)).toList();
      return Future.value(productList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}