import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/repository/sinup_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SinupRepositoryImpl implements SinupRepository {
  
  final FirebaseConsumer credential;

  SinupRepositoryImpl({required this.credential});
  @override
  Future< void> createUserWithEmailAndPassword (
      SinupEntites email, SinupEntites password) async{
        try {
 await credential.createUserWithEmailAndPassword(email, password);
 
  
}on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  
      }
}
