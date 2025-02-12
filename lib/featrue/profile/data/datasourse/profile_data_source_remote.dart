import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/core/parms/parms.dart';
import 'package:ecommercefirebase/featrue/profile/data/models/profile_model.dart';

class ProFileDataSourceRemote {
  final FirebaseConsumer firebaseConsumer;
  ProFileDataSourceRemote(this.firebaseConsumer);
  Future<ProfileModel> getdata(ProfileParams category) async {
    try {
 
  final snapshot = await firebaseConsumer.getdatadoc('user',category.id);
 return ProfileModel.fromJson(snapshot.data());
 
} on Exception catch (e) {
  throw Exception(e);
}
  }
}
