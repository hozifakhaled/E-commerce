import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/login/domain/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/login/domain/repository/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

// تنفيذ مستودع تسجيل الدخول
class LoginRepositoryImpl implements LoginRepository {
  // مستهلك Firebase
  final FirebaseConsumer credential;

  // مُنشئ المستودع
  LoginRepositoryImpl({required this.credential});

  // تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  @override
  Future<void> signInWithEmailAndPassword(LoginEntites user) async {
    try {
      // محاولة تسجيل الدخول باستخدام بيانات الاعتماد المقدمة
      await credential.signInWithEmailAndPassword(user.email, user.password);
    } on FirebaseAuthException catch (e) {
      // التعامل مع استثناءات FirebaseAuth
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      // التعامل مع أي استثناءات أخرى
      throw Exception('Registration failed: $e');
    }
  }
}
