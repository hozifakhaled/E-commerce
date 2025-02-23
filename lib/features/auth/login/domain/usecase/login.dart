import 'package:ecommercefirebase/features/auth/login/domain/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/login/domain/repository/login_repository.dart';

/// فئة تسجيل الدخول
class Login {
  final LoginRepository loginRepository;

  /// منشئ الفئة يأخذ مستودع تسجيل الدخول كمعامل مطلوب
  Login({required this.loginRepository});

  /// استدعاء دالة تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> call(LoginEntites user) async {
    return await loginRepository.signInWithEmailAndPassword(user);
  }
}