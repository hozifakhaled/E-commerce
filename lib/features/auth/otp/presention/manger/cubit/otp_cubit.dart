import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final FirebaseAuth _firebaseAuth;

  PhoneAuthCubit()
      : _firebaseAuth = FirebaseAuth.instance,
        super(PhoneAuthState());
  TextEditingController controllerpincode = TextEditingController();
    TextEditingController controllerphone = TextEditingController();
      String code = '';
      String? phone;
      
  GlobalKey<FormState> fromkeycode = GlobalKey();
   GlobalKey<FormState> fromkeyphone = GlobalKey();
  void verifyPhone(String phoneNumber) {
    emit(state.copyWith(loading: true));

    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
        emit(state.copyWith(loading: false));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(state.copyWith(loading: false, error: e.message));
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(state.copyWith(loading: false, verificationId: verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(state.copyWith(verificationId: verificationId));
      },
    );
  }

  void signInWithSmsCode(String verificationId, String smsCode) async {
    try {
      emit(state.copyWith(loading: true));
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
      emit(state.copyWith(loading: false));

      /// print('تم تسجيل الدخول بنجاح');
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
