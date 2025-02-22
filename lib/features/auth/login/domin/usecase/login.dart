import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/login/domin/repository/login_repository.dart';

class Login {
  final LoginRepository loginRepository;

  Login({required this.loginRepository});

  Future< void> call(LoginEntites  user,) async {
    return await loginRepository.signInWithEmailAndPassword(user);
  }
}