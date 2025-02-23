import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SectionTextfiledAndButton extends StatefulWidget {
  const SectionTextfiledAndButton({
    super.key,
  });

  @override
  State<SectionTextfiledAndButton> createState() =>
      _SectionTextfiledAndButtonState();
}

class _SectionTextfiledAndButtonState extends State<SectionTextfiledAndButton> {
  bool isheddin = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // نص البريد الإلكتروني
        Text(
          'email',
          style: Textstyles.text16
        ),
        // حقل إدخال البريد الإلكتروني
        CustomTextFromFiled(
          hinttext: 'example@gmail.com',
          controller: context.read<LoginCubit>().emailController,
          validator: (value) =>
              context.read<LoginCubit>().validatoremail(value),
          onChanged: (p0) {
            context.read<LoginCubit>().email = p0;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        // نص كلمة المرور
        Text(
          'password',
          style: Textstyles.text16
              
        ),
        // حقل إدخال كلمة المرور
        CustomTextFromFiled(
          obscureText: isheddin,
          hinttext: 'Enter your password',
          controller: context.read<LoginCubit>().passwordController,
          onChanged: (p0) {
            context.read<LoginCubit>().password = p0;
          },
          validator: (p0) => context.read<LoginCubit>().validatorpassword(p0),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isheddin = !isheddin;
                });
              },
              icon: isheddin
                  ? Icon(Icons.visibility_off_outlined)
                  : Icon(Icons.remove_red_eye_outlined)),
        ),
        // رابط نسيان كلمة المرور
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.forgetpassword);
            },
            child: Text(
              'forget password?',
              style: Textstyles.text1otp.copyWith(
                  fontSize: 16.sp,
                  color: maincolor,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // زر تسجيل الدخول
        ButtonApp(
          text: 'Login',
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(
                  context.read<LoginCubit>().email!,
                  context.read<LoginCubit>().password!);
              context.read<LoginCubit>().passwordController.clear();
              context.read<LoginCubit>().emailController.clear();
              context
                  .read<LoginCubit>()
                  .cacheid(context.read<LoginCubit>().email!);
            }
          },
          colortext: Colors.white,
          color: maincolor,
        ),
      ],
    );
  }
}
