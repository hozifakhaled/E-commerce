import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/domain/entitiy/forget_password_entitiey.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/domain/repositroy/forget_password_repositroy.dart';

class ForgetPasswordRepositoryIpli implements ForgetPasswordRepositroy{
  final FirebaseConsumer instance;
  ForgetPasswordRepositoryIpli(this.instance);
  @override
  Future<void> forgetPassword(ForgetPasswordEntitiey email)async {
   try {
     await instance.sendPasswordResetEmail(email.email);
     
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}