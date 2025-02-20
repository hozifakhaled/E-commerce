import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/categories/data/datasourse/product_data_source_remote.dart';
import 'package:ecommercefirebase/features/categories/data/datasourse/product_data_sourse_local.dart';

import 'package:ecommercefirebase/features/categories/domein/repository/product_repository.dart';
import 'package:ecommercefirebase/features/home/data/models/product_model.dart';

class ProductRepositoryImpli implements ProductRepository {
  final FirebaseConsumer firebaseConsumer;
  final ProductDataSourceRemote remote;
  final NetworkInfo networkInfo;
  final ProductDataSourseLocal local;

  ProductRepositoryImpli(this.firebaseConsumer, 
      {required this.remote, required this.networkInfo, required this.local});
  @override
  Future<List<ProductModel>> getdata(CategoryParams category) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remote.getdata(category  );

        local.cacheUser(remoteUser);
        return remoteUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastproduct();
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<void> updateReminingandSold(SoldParams category) async {
    try {
      await firebaseConsumer.updatedata(
          'product', category.id, {'sold': category.sold, 'Reamaining': category.remaining});
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getCategories(CategoryParams categoryParams)async {
  if (await networkInfo.isConnected!) {
    try {
      final List<ProductModel> data = [];
  final remoteUser = await firebaseConsumer.getdatafilter(categoryParams.id, 'category', categoryParams.category);
 for (var doc in remoteUser.docs) {
  
   data.add(ProductModel.fromFirestore(doc));  //; طباعة بيانات كل مستند
  }
      return data;} on Exception catch (e) {
        throw Exception(e.toString());
      }
}else{
   try {
        final localUser = await local.getLastproduct();
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
}
  }
  }

