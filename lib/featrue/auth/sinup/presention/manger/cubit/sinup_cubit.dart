// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/data/repository/sinup_repository_impl.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/domin/usecase/sinup.dart';
import 'package:flutter/material.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  SinupCubit() : super(SinupInitial());
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
  createUserWithEmailAndPassword(String email, String password) async {
    emit(SinupLoading());

    try {
         await Sinup(sinupRepository: SinupRepositoryImpl(credential: FirebaseConsumer())).call(
        SinupEntites(email: email, password: password),
       SinupEntites(email: email, password: password),
      );
      emit(SinupLoaded());
    } catch (error) {
      emit(SinupError(error.toString()));
    }
  }
}
