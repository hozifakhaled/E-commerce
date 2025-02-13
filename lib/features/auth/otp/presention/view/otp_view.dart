import 'package:ecommercefirebase/features/auth/otp/presention/manger/cubit/otp_cubit.dart';
import 'package:ecommercefirebase/features/auth/otp/presention/view/widgets/body_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تعيين لون الخلفية للأبيض
      body: BlocProvider(
        create: (context) => PhoneAuthCubit(),
        child: BodyInOtp(),
      ),
    );
  }
}
