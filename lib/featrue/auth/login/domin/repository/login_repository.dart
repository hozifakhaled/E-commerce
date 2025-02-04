import 'package:ecommercefirebase/featrue/auth/login/domin/entities/login_entites.dart';
abstract class LoginRepository {
  Future< void> signInWithEmailAndPassword(LoginEntites  email, LoginEntites password);
}
