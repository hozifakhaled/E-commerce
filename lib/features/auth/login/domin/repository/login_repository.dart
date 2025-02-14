import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
abstract class LoginRepository {
  Future< void> signInWithEmailAndPassword(LoginEntites  email, LoginEntites password);
}
