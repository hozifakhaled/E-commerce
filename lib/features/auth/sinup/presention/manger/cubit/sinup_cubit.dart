// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/sinup/data/repository/sinup_repository_impl.dart';
import 'package:ecommercefirebase/features/auth/sinup/domain/entities/add_user_entitiey.dart';
import 'package:ecommercefirebase/features/auth/sinup/domain/entities/sinup_entites.dart';
import 'package:ecommercefirebase/features/auth/sinup/domain/usecase/add_user.dart';
import 'package:ecommercefirebase/features/auth/sinup/domain/usecase/sinup.dart';
import 'package:flutter/material.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  SinupCubit() : super(SinupInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
 
  String? email;
  String? password;
  String? name;
  String? phone;
  String? age;

  // دالة للتحقق من صحة البريد الإلكتروني
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // دالة لمسح محتويات الحقول
  clear() {
    nameController.clear();
    passwordController.clear();
    ageController.clear();
    phoneController.clear();
    emailController.clear();
  }

  // دالة للتحقق من صحة البريد الإلكتروني
  validatoremail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email'; // الرجاء إدخال بريد إلكتروني
    } else if (!isValidEmail(value)) {
      return 'Invalid email format'; // صيغة البريد الإلكتروني غير صحيحة
    }
    return null;
  }

  // دالة للتحقق من صحة كلمة المرور
  validatorpassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password'; // الرجاء إدخال كلمة مرور
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters, include uppercase, lowercase, number, and special character'; // يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل، وتشمل حرف كبير، حرف صغير، رقم، وحرف خاص
    }
    return null;
  }

  // دالة للتحقق من صحة الاسم والعمر
  validatornameandageand(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value'; // الرجاء إدخال قيمة
    } 
    return null;
  }

  // دالة للتحقق من صحة رقم الهاتف
  validatorphone(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number'; // الرجاء إدخال رقم هاتف
    } else if (value.length < 11) {
      return 'Phone number must be at least 11 characters'; // يجب أن يكون رقم الهاتف مكون من 11 رقم على الأقل
    }
    return null;
  }

  // دالة لإنشاء مستخدم جديد باستخدام البريد الإلكتروني وكلمة المرور
  createUserWithEmailAndPassword(String email, String password) async {
    emit(SinupLoading());

    try {
      await Sinup(
              sinupRepository:
                  SinupRepositoryImpl(credential: FirebaseConsumer()))
          .call(
        SinupEntites(email: email, password: password),
      );
      emit(SinupLoaded());
    } catch (error) {
      emit(SinupError(error.toString()));
    }
  }

  // دالة لإضافة مستخدم جديد
  adduser({required String email, required String name, required String phone, required String age}) async {
    try {
      await AddUsers(SinupRepositoryImpl(credential: FirebaseConsumer())).call(
        AddUserEntitiey(
            phone: phone, name: name, email: email, age: age),
      );
    } catch (error) {
      emit(SinupError(error.toString()));
    }
  }

  // دالة لحفظ البيانات في الكاش
  saveData(key, String value) {
    CacheHelper().saveData(key: key, value: value);
  }
}
