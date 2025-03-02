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
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await credential.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
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
     final timestamp = DateTime.now().millisecondsSinceEpoch; // الوقت الحالي بوحدة الميللي ثانية
final fileExtension = file.path.split('.').last; // استخراج الامتداد
final fileName = "$timestamp.$fileExtension";
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
     Future<void> updatedatadoccollection(
      String category, String id,String id2, Map<String, dynamic> json) async {
    await data.collection(category).doc(id).collection(category).doc(id2).update(json);
  }

  @override
  Future<void> adddatadoccollection(
      String category, String id, Map<String, dynamic> json) async {
    await data.collection(category).doc(id).collection(category).add(json);
  }

  @override
  Stream<QuerySnapshot> getdatadoccollection(
      String idCollection, String idDoc) {
    return data
        .collection(idCollection)
        .doc(idDoc)
        .collection(idCollection)
        .snapshots();
  }

  @override
  Future<dynamic> getdatafilter(
      String idcollection, String filter, String value) async {
    return data.collection(idcollection).where(filter, isEqualTo: value).get();
  }

  @override
  Future<dynamic> getDataFilterNotequal(
      String idcollection, String filter, String value) async {
    return data.collection(idcollection).where(filter, isEqualTo: value).get();
  }
  @override
  Future<dynamic> getDataInCollectionFilterNotequal(
      String idcollection, String filter, String value,String filter2, String value2,String filter3, String value3,String docid) async {
    return data.collection(idcollection).doc(docid).collection(idcollection).where(filter, isEqualTo: value).where(filter2, isEqualTo: value2).where(filter3, isEqualTo: value3).get();
  }

  @override
  Future getdatasorted(String idcollection, String filter) {
    return data
        .collection(idcollection) // استبدل باسم الكولكشن
        .orderBy(filter, descending: true) // ترتيب تنازلي
        .limit(10) // جلب أعلى 10 قيم
        .get();
  }

  @override
  Future<void> deletedocincollection(String idCollection, String idDoc,String id ) async{
    await data
        .collection(idCollection)
        .doc(idDoc)
        .collection(idCollection)
        .doc(id)
        .delete();
  }
}
