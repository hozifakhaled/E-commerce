import 'package:ecommercefirebase/features/auth/login/domain/entities/login_entites.dart';

// Abstract class representing the login repository
abstract class LoginRepository {
  // Method to sign in with email and password
  // Takes a LoginEntites object as a parameter
  Future<void> signInWithEmailAndPassword(LoginEntites user);
}
