import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/database_consumer.dart';
import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirebaseConsumer implements DatabaseConsumer {
  final credential = FirebaseAuth.instance;
  final storage = Supabase.instance.client.storage.from('mainimage');

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
}
