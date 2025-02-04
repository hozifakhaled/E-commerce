import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/core/widgets/row_login_or_sinup.dart';
import 'package:ecommercefirebase/featrue/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodySinupView extends StatelessWidget {
  const BodySinupView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = context.read<SinupCubit>().email;
    String? password = context.read<SinupCubit>().password;

    return BlocListener<SinupCubit, SinupState>(
      listener: (context, state) {
        if (state is SinupLoaded) {
          Helpers()
              .alertDone(context, 'Done', 'Sign up successfully', null,
                  () => GoRouter.of(context).push('/home'), DialogType.success)
              .show();
        }
        if (state is SinupError) {
          Helpers()
              .alertDone(context, 'Error', state.message.toString(), null, null,
                  DialogType.error)
              .show();
        }
      },
      child: Form(
        key: context.read<SinupCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Signup',
                    style: Textstyles.text1otp,
                  ),
                  RowSinupOrLogin(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    text: 'Already have an account? ',
                    button: 'Login',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'email',
                    style: Textstyles.text2otp.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  CustomTextFromFiled(
                    hinttext: 'example@gmail.com',
                    controller: context.read<SinupCubit>().emailController,
                    validator: (value) =>
                        context.read<SinupCubit>().validatoremail(value),
                    onChanged: (p0) {
                      email = p0;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'password',
                    style: Textstyles.text2otp.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  CustomTextFromFiled(
                    hinttext: 'Enter your password',
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    controller: context.read<SinupCubit>().passwordController,
                    onChanged: (p0) {
                      password = p0;
                    },
                    validator: (p0) =>
                        context.read<SinupCubit>().validatorpassword(p0),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  buttonApp(
                    text: 'Signup',
                    onPressed: () {
                      if (context
                          .read<SinupCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context
                            .read<SinupCubit>()
                            .createUserWithEmailAndPassword(email!, password!);
                        context.read<SinupCubit>().passwordController.clear();
                        context.read<SinupCubit>().emailController.clear();
                      }
                    },
                    colortext: Colors.white,
                    color: maincolor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
