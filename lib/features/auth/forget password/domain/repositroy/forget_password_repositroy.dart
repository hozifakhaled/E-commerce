import 'package:ecommercefirebase/features/auth/forget%20password/domain/entitiy/forget_password_entitiey.dart';

abstract class ForgetPasswordRepositroy {
  Future<void> forgetPassword(ForgetPasswordEntitiey email);
}