import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/login/domin/repository/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseConsumer credential;

  LoginRepositoryImpl({required this.credential});

  @override
  Future<void> signInWithEmailAndPassword(
      LoginEntites email, LoginEntites password) async {
    try {
      await credential.signInWithEmailAndPassword(email, password);
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
}
