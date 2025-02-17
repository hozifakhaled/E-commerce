import 'dart:io';

import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/sinup_entites.dart';

abstract class DatabaseConsumer {
  Future<void> createUserWithEmailAndPassword(
      SinupEntites email, SinupEntites password);
  Future<void> signInWithEmailAndPassword(
      LoginEntites email, LoginEntites password);
  Future<dynamic> getdata(String idcollection);
   Future<dynamic> getdatafilter(String idcollection,String filter , String value);
  Future<dynamic> getdatadoc(String idcollection, String iddoc);
    Future<dynamic> getdatadoccollection(String idcollection, String iddoc);
  Future<void> adddata(String category, Map<String, dynamic> json);
  Future<void> updatedata(
      String category, String id, Map<String, dynamic> json);

  Future<void> adddatadoc(
      String category, String id, Map<String, dynamic> json);
   Future<void> adddatadoccollection(
      String category, String id, Map<String, dynamic> json);   
  Future<String> adddimage(File file);
}
