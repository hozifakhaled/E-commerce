// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/login/data/repository/login_repository_impl.dart';
import 'package:ecommercefirebase/features/auth/login/domin/entities/login_entites.dart';
import 'package:ecommercefirebase/features/auth/login/domin/usecase/login.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import, 
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

 
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? email;
  String? password;
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  validatoremail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }
   validatorpassword (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters, include uppercase, lowercase, number, and special character';
    }
    return null;
  }
login(String email, String password) async {
    emit(LoginLoading());

    try {
      await Login(loginRepository: LoginRepositoryImpl(credential: FirebaseConsumer())).call(
        LoginEntites(email: email, password: password),
       LoginEntites(email: email, password: password),
      );
      emit(LoginLoaded());
    } catch (error) {
      emit(LoginError(massge:  error.toString()));
    }


  }

   cacheid(String value) {
    CacheHelper().saveData(key: 'id',value:value );
  }
}
