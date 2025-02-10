import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/database_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConsumer implements DatabaseConsumer {
  final credential = FirebaseAuth.instance;
  final data = FirebaseFirestore.instance;
  @override
  Future<void> createUserWithEmailAndPassword(
      SinupEntites email, SinupEntites password) async {
    await credential.createUserWithEmailAndPassword(
        email: email.email, password: password.password);
  }

  @override
  Future<void> signInWithEmailAndPassword(
      LoginEntites email, LoginEntites password) async {
    await credential.signInWithEmailAndPassword(
        email: email.email, password: password.password);
  }

  @override
  Future<dynamic> getdata(CategoryParams category) async {
    return data.collection(category.id).get();
  }
  
  @override
  Future<void> adddata(String category, Map <String, dynamic> json) async {
   final store = data.collection(category).add(json);
  }
 
}

