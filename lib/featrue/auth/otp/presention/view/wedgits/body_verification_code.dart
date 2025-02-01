import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/featrue/auth/otp/presention/manger/cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/button_app.dart';
import '../../../../../../core/styles/textstyles.dart';
import 'pin_code.dart';

class BodyVerifcationCode extends StatelessWidget {
  const BodyVerifcationCode({
    super.key,
    required this.verificationId,
  });

  final String verificationId;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        context.read<PhoneAuthCubit>().controllerpincode;
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
        listener: (context, state) {
          if (state.error != null) {
            Helpers()
                .alertDone(context, 'Error', state.error.toString(), null, null,
                    DialogType.error)
                .show();
          }
        },
        child: Form(
          key: context.read<PhoneAuthCubit>().fromkeycode,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text('Verification Code',
                      style: Textstyles.text1otp), // نص التحقق من OTP
                  const SizedBox(height: 5), // إضافة مساحة فارغة
                  Text(
                    'We have sent the verification \n code to your email address',
                    style: Textstyles.text2otp,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 30),
                  PinCodeTextFieldInOtp(
                    controller: controller,
                    onCompleted: (p0) {
                      context.read<PhoneAuthCubit>().code = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  buttonApp(
                    text: 'Continue',
                    onPressed: () {
                      if (context
                          .read<PhoneAuthCubit>()
                          .fromkeycode
                          .currentState!
                          .validate()) {
                        context.read<PhoneAuthCubit>().signInWithSmsCode(
                            verificationId,
                            context.read<PhoneAuthCubit>().code);
                        controller.clear();
                        Helpers().alertDone(context, 'Done',
                            'Verification code sent successfully', null, () {
                          GoRouter.of(context).go('/home');
                        }, DialogType.success).show();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
