
import 'package:ecommercefirebase/features/auth/forget%20password/domain/entitiy/forget_password_entitiey.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/domain/repositroy/forget_password_repositroy.dart';

class ForgetPassword {
  final ForgetPasswordRepositroy repositroy;

  ForgetPassword({required this.repositroy});

  Future<void> call(ForgetPasswordEntitiey email) => repositroy.forgetPassword(email);
}