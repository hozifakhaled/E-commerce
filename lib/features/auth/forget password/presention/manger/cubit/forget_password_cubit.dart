// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/data/repositorys/forget_password_repository_ipli.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/domain/entitiy/forget_password_entitiey.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/domain/usecase/forget_password.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  // مفتاح النموذج للتحقق من صحة النموذج
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // وحدة التحكم في النص للبريد الإلكتروني
  final emailController = TextEditingController();
  
  String? email;

  // دالة للتحقق من صحة البريد الإلكتروني
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // دالة للتحقق من صحة البريد الإلكتروني في النموذج
  validatoremail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email'; // الرجاء إدخال بريد إلكتروني
    } else if (!isValidEmail(value)) {
      return 'Invalid email format'; // تنسيق البريد الإلكتروني غير صالح
    }
    return null;
  }
   
  // دالة لإعادة تعيين كلمة المرور
  forgetPassword(String email) async {
    emit(ForgetPasswordLoading()); // بدء تحميل إعادة تعيين كلمة المرور

    try {
      await ForgetPassword(repositroy: ForgetPasswordRepositoryIpli(FirebaseConsumer())).call(
        ForgetPasswordEntitiey(email: email),
      );
      emit(ForgetPasswordloaded()); // تم تحميل إعادة تعيين كلمة المرور بنجاح
    } catch (error) {
      emit(ForgetPasswordError(message: error.toString())); // حدث خطأ أثناء إعادة تعيين كلمة المرور
    }
  }
}
