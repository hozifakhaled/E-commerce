import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/comments/data/models/comments_model.dart';

class CommentsDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  CommentsDataSourceRemote(this.firebaseConsumer);
  Future<List<CommentsModel>> fatchlistcomments() async {
    try {
  List<CommentsModel> list = [];
  QuerySnapshot snapshot = await firebaseConsumer.getdata('comment');
  for (var doc in snapshot.docs) {
  
   list.add(CommentsModel.fromJson(doc.data() as Map<String, dynamic>));  //; طباعة بيانات كل مستند
  }
  return list;
} on Exception catch (e) {
  throw Exception(e);
}
  }
}
