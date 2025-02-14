import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/login/domin/repository/login_repository.dart';

class Login {
  final LoginRepository loginRepository;

  Login({required this.loginRepository});

  Future< void> call(LoginEntites  email, LoginEntites password) async {
    return await loginRepository.signInWithEmailAndPassword(email, password);
  }
}