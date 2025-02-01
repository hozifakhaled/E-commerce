import 'package:ecommercefirebase/featrue/auth/otp/presention/manger/cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wedgits/body_verification_code.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key, required this.verificationId});
  final String verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.grey,
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => PhoneAuthCubit(),
        child: BodyVerifcationCode(
          verificationId: verificationId,
        ),
      ),
    );
  }
}
