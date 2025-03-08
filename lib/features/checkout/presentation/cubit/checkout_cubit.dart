// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/features/checkout/data/repositories/checkout_repositry_impli.dart';
import 'package:ecommercefirebase/features/checkout/domain/entities/checkout_entitiey.dart';
import 'package:ecommercefirebase/features/checkout/domain/usecases/add_form_checkout.dart';
import 'package:ecommercefirebase/features/checkout/domain/usecases/update_iscash.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/database/firebase/firebase_consumer.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
 String? statee;
  String? city;
  String? postalCode;
  String? street;
 
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final streetController = TextEditingController();
  String id = CacheHelper().getData(key: 'id') ?? '';
  validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a filed'; // the error message
    }
     return null;
  }

  void addFormCheckout(
      {
      required String state,
      required String city,
      required String price,
      required String postalCode,
      required String street,
      required bool iscach,
      }) async {
    emit(CheckoutLoading());
    try {
      await AddFormCheckout(
              CheckoutRepositryImpli(firebaseConsumer: FirebaseConsumer()))
          .call(
              CheckoutEntitiey( 
              false,
                  email: id,
                  state: state,
                  city: city,
                  price: price,
                  postalCode: postalCode,
                  street: street),
              id,postalCode
              );
      emit(CheckoutLoaded());
    } catch (error) {
      emit(CheckoutError(error.toString()));
    }
  }


   void updateIncash(
      {
    
      required String postalCode,
      
      required bool iscach,
      }) async {
    emit(CheckoutLoading());
    try {
      await UpdateIscash(
              CheckoutRepositryImpli(firebaseConsumer: FirebaseConsumer()))
          .call(
            iscach,
             id,postalCode
              );
      emit(UpdateLoaded());
    } catch (error) {
      emit(CheckoutError(error.toString()));
    }
  }
}
