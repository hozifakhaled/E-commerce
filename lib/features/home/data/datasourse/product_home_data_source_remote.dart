import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/home/data/models/product_model.dart';

class ProductHomeDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  ProductHomeDataSourceRemote(this.firebaseConsumer);
  Future<List<ProductModel>> getBestSelling() async {
    try {
      List<ProductModel> list = [];
      QuerySnapshot snapshot =
          await firebaseConsumer.getdatasorted('product', 'sold');
      for (var doc in snapshot.docs) {
        list.add(ProductModel.fromFirestore(doc)); //; طباعة بيانات كل مستند
      }
      return list;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getArrival() async {
    try {
      List<ProductModel> list = [];
      QuerySnapshot snapshot = await firebaseConsumer.getdatasorted(
        'product',
        'dateadd',
      );
      for (var doc in snapshot.docs) {
        list.add(ProductModel.fromFirestore(doc)); //; طباعة بيانات كل مستند
      }
      return list;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getdiscont() async {
    try {
      List<ProductModel> list = [];
      QuerySnapshot snapshot = await firebaseConsumer.getDataFilterNotequal(
          'product', 'oldprice', '');
      for (var doc in snapshot.docs) {
        list.add(ProductModel.fromFirestore(doc)); //; طباعة بيانات كل مستند
      }
      return list;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
