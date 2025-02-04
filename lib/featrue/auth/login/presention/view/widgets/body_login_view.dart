import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/core/widgets/row_login_or_sinup.dart';
import 'package:ecommercefirebase/featrue/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BodyLoginView extends StatelessWidget {
  const BodyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = context.read<LoginCubit>().email;
    String? password = context.read<LoginCubit>().password;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Helpers()
              .alertDone(context, 'Done', 'Sign up successfully', null,
                  () => GoRouter.of(context).push('/home'), DialogType.success)
              .show();
        }
        if (state is LoginError) {
          Helpers()
              .alertDone(context, 'Error', state.massge.toString(), null, null,
                  DialogType.error)
              .show();
        }
      },
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Login',
                style: Textstyles.text1otp,
              ),
              RowSinupOrLogin(
                onTap: () {
                  GoRouter.of(context).push('/sinup');
                },
                text: 'Don\'t have an account? ',
                button: 'Sign up',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'email',
                style: Textstyles.text2otp
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              CustomTextFromFiled(
                hinttext: 'example@gmail.com',
                controller: context.read<LoginCubit>().emailController,
                validator: (value) =>
                    context.read<LoginCubit>().validatoremail(value),
                onChanged: (p0) {
                  email = p0;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'password',
                style: Textstyles.text2otp
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              CustomTextFromFiled(
                hinttext: 'Enter your password',
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                controller: context.read<LoginCubit>().passwordController,
                onChanged: (p0) {
                  password = p0;
                },
                validator: (p0) =>
                    context.read<LoginCubit>().validatorpassword(p0),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'forget password?',
                  style: Textstyles.text1otp.copyWith(
                      fontSize: 16.sp,
                      color: maincolor,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buttonApp(
                text: 'Login',
                onPressed: () {
                  if (context
                      .read<LoginCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<LoginCubit>().login(email!, password!);
                    context.read<LoginCubit>().passwordController.clear();
                    context.read<LoginCubit>().emailController.clear();
                  }
                },
                colortext: Colors.white,
                color: maincolor,
              ),
              const SizedBox(
                height: 20,
              ),
              buttonApp(
                text: 'Login with Google',
                onPressed: () {},
                colortext: maincolor,
                color: Colors.white,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
