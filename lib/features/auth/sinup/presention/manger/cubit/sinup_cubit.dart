// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/auth/sinup/data/repository/sinup_repository_impl.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/add_user_entitiey.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/entities/sinup_entites.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/usecase/add_user.dart';
import 'package:ecommercefirebase/features/auth/sinup/domin/usecase/sinup.dart';
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


  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
clear(){nameController.clear();
             passwordController.clear();
              ageController.clear();
             phoneController.clear();
             emailController.clear();
             }
  validatoremail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  validatorpassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters, include uppercase, lowercase, number, and special character';
    }
    return null;
  }

  validatornameandageand(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } 
    return null;
  }
  validatorphone(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 11) {
      return 'Password must be at least 8 characters, include uppercase, lowercase, number, and special character';
    }
    return null;
  }

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

  adduser({required String email,required String name,required String phone,required String age,}) async {
    try {
      await AddUsers(SinupRepositoryImpl(credential: FirebaseConsumer())).call(
        AddUserEntitiey(
            phone: phone, name: name, email: email, age:age, ),
      );
    } catch (error) {
      emit(SinupError(error.toString()));
    }
  }


   saveData(key,String value) {
    CacheHelper().saveData(key: key,value:value );
  }
}
