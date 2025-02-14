import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/features/cart/data/models/cart_model.dart';

class CartDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  CartDataSourceRemote(this.firebaseConsumer);
  Future<List<CartModel>> getdata(CategoryParams category,String id) async {
    try {
  List<CartModel> list = [];
  QuerySnapshot snapshot = await firebaseConsumer.getdatadoccollection(category.id,id);
  for (var doc in snapshot.docs) {
  
   list.add(CartModel.fromJson(doc.data() as Map<String, dynamic>));  //; طباعة بيانات كل مستند
  }
  return list;
} on Exception catch (e) {
  throw Exception(e);
}
  }
}
