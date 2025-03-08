import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseConsumer {
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> sendPasswordResetEmail(
    String email,
  );
  Future<dynamic> getdata(String idcollection);
  Future<dynamic> getdatafilter(
      String idcollection, String filter, String value);
  Future<dynamic> getdatasorted(String idcollection, String filter);
  Future<dynamic> getdatadoc(String idcollection, String iddoc);
  Stream<QuerySnapshot> getdatadoccollection(String idcollection, String iddoc);
  Future<void> adddata(String category, Map<String, dynamic> json);
  Future<void> updatedata(
      String category, String id, Map<String, dynamic> json);
  Future<void> updatedatadoccollection(
      String category, String id, String id2, Map<String, dynamic> json);
  Future<dynamic> getDataFilterNotequal(
      String idcollection, String filter, String value);
  Future<dynamic> getDataInCollectionFilterNotequal(
      String idcollection,
      String filter,
      String value,
      String filter2,
      String value2,
      String filter3,
      String value3,
      String docid);

  Future<void> adddatadoc(
      String category, String id, Map<String, dynamic> json);
  Future<void> adddatadoccollection(
      String category, String id, Map<String, dynamic> json);

  Future<void> adddatadoccollection2(
      String category, String id, Map<String, dynamic> json);
  Future<void> adddatadoccollectionnamdoc(
      String category, String id, String id2, Map<String, dynamic> json);
  Future<void> deletedocincollection(
      String idCollection, String idDoc, String id);
  Future<dynamic> getdatacollectionincollection(
      String idcollection, String iddoc);
  Future<void> delete(String idDoc);
  Future<String> adddimage(File file);
}
