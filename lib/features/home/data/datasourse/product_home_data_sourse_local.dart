import 'dart:convert';

import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/error/expentions.dart';
import 'package:ecommercefirebase/features/home/data/models/product_model.dart';

class ProductHomeDataSourseLocal {
  final CacheHelper cache;
 // final String key = "Cachedproducthome";
  ProductHomeDataSourseLocal({required this.cache});

  cacheBestSelling(List<ProductModel>? userToCache,String key) {
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

  Future<List<ProductModel>> getLastBestSelling(String key) {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);

      final List<ProductModel> productList = decodedJson.map((jsonItem ) => ProductModel.fromjson(jsonItem  )).toList();
      return Future.value(productList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}