import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/add_user_entitiey.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/repository/sinup_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SinupRepositoryImpl implements SinupRepository {
  final FirebaseConsumer credential;

  SinupRepositoryImpl({required this.credential});
  @override
  Future<void> createUserWithEmailAndPassword(
      SinupEntites user) async {
    try {
      await credential.createUserWithEmailAndPassword(user.email,user.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<void> adduser(AddUserEntitiey user) async {
    try {
      await credential.adddatadoc('user', user.email, {
        'image': '',
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'age': user.age,
        });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
