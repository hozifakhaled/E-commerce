import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/featrue/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTextfiledAndButton extends StatefulWidget {
  const SectionTextfiledAndButton({super.key, });
 
  @override
  State<SectionTextfiledAndButton> createState() =>
      _SectionTextfiledAndButtonState();
}

class _SectionTextfiledAndButtonState extends State<SectionTextfiledAndButton> {
  String email = '';
  String password = '';  @override

  Widget build(BuildContext context) {
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            context.read<LoginCubit>().email = p0;
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
            context.read<LoginCubit>().password = p0;
          },
          validator: (p0) => context.read<LoginCubit>().validatorpassword(p0),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            'forget password?',
            style: Textstyles.text1otp.copyWith(
                fontSize: 16.sp, color: maincolor, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buttonApp(
          text: 'Login',
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(context.read<LoginCubit>().email!, context.read<LoginCubit>().password!);
              context.read<LoginCubit>().passwordController.clear();
              context.read<LoginCubit>().emailController.clear();
              context.read<LoginCubit>().cacheid(context.read<LoginCubit>().email! );
            }
          },
          colortext: Colors.white,
          color: maincolor,
        ),
      ],
    );

    
  }
}
