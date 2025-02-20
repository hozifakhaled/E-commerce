import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/home/data/models/product_model.dart';

class ProductDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  ProductDataSourceRemote(this.firebaseConsumer);
  Future<List<ProductModel>> getdata(CategoryParams category) async {
    try {
  List<ProductModel> list = [];
  QuerySnapshot snapshot = await firebaseConsumer.getdata(category.id);
  for (var doc in snapshot.docs) {
  
   list.add(ProductModel.fromFirestore(doc));  //; طباعة بيانات كل مستند
  }
  return list;
} on Exception catch (e) {
  throw Exception(e);
}
  }
}
