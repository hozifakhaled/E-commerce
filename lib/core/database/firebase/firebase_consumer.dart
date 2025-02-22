import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/database_consumer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirebaseConsumer implements DatabaseConsumer {
  final credential = FirebaseAuth.instance;
  final storage = Supabase.instance.client.storage.from('mainimage');

  final data = FirebaseFirestore.instance;
  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await credential.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    await credential.signInWithEmailAndPassword(
        email: email, password: password);
  }
  @override
  Future<void> sendPasswordResetEmail(String email) async{
    await credential.sendPasswordResetEmail(email: email);
  }

  @override
  Future<dynamic> getdata(String idcollection) async {
    return data.collection(idcollection).get();
  }

  @override
  Future<dynamic> getdatadoc(String idcollection, String iddoc) async {
    return data.collection(idcollection).doc(iddoc).get();
  }

  @override
  Future<void> adddata(String category, Map<String, dynamic> json) async {
    await data.collection(category).add(json);
  }

  @override
  Future<void> adddatadoc(
      String category, String id, Map<String, dynamic> json) async {
    await data.collection(category).doc(id).set(json);
  }

  @override
  Future<String> adddimage(File file) async {
    try {
      final fileName = file.path.split('/').last;
      await storage.upload(fileName, file,
          fileOptions: FileOptions(
            cacheControl: '3600',
            upsert: false,
          ));
      //print(response);

      final storagee = storage.getPublicUrl(fileName);

      return storagee;
    } catch (e) {
      // print("Exception: $e");
      return "Exception: $e";
    }
  }

  @override
  Future<void> updatedata(
      String category, String id, Map<String, dynamic> json) async {
    await data.collection(category).doc(id).update(json);
  }

  @override
  Future<void> adddatadoccollection(
      String category, String id, Map<String, dynamic> json) async {
    await data.collection(category).doc(id).collection(category).add(json);
  }

  @override
  Future<dynamic> getdatadoccollection(
      String idcollection, String iddoc) async {
    return data
        .collection(idcollection)
        .doc(iddoc)
        .collection(idcollection)
        .get();
  }

  @override
  Future<dynamic> getdatafilter(String idcollection,String filter , String value) async {
    return data
        .collection(idcollection)
        .where(filter, isEqualTo: value)
        .get();
  }
  @override
  Future<dynamic> getDataFilterNotequal(String idcollection,String filter , String value) async {
    return data
        .collection(idcollection)
        .where(filter, isEqualTo: value)
        .get();
  }
  
  @override
  Future getdatasorted(String idcollection, String filter) {
       return data
   .collection(idcollection) // استبدل باسم الكولكشن
      .orderBy(filter, descending: true) // ترتيب تنازلي
      .limit(10) // جلب أعلى 10 قيم
      .get();
  }
  
  
}
