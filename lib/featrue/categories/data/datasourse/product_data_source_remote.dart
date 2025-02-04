import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/categories/data/models/product_model.dart';

class ProductDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  ProductDataSourceRemote(this.firebaseConsumer);
  Future<List<ProductModel>> getdata() async {
    try {
  List<ProductModel> list = [];
  QuerySnapshot snapshot = await firebaseConsumer.getdata();
  for (var doc in snapshot.docs) {
  
   list.add(ProductModel.fromJson(doc.data() as Map<String, dynamic>));  //; طباعة بيانات كل مستند
  }
  return list;
} on Exception catch (e) {
  throw Exception(e);
}
  }
}
