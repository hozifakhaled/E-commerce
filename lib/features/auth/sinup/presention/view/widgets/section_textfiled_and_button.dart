import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/auth/sinup/presention/manger/cubit/sinup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionTextfiledAndButton extends StatefulWidget {
  const SectionTextfiledAndButton({super.key});

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
        // نص لاسم المستخدم
        TextInSinup(
          text: 'Name',
        ),
        // حقل إدخال لاسم المستخدم
        CustomTextFromFiled(
          hinttext: 'example',
          controller: context.read<SinupCubit>().nameController,
          validator: (value) =>
              context.read<SinupCubit>().validatornameandageand(value),
          onChanged: (p0) {
            context.read<SinupCubit>().name = p0;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        // نص للبريد الإلكتروني
        TextInSinup(
          text: 'email',
        ),
        // حقل إدخال للبريد الإلكتروني
        CustomTextFromFiled(
          hinttext: 'example@gmail.com',
          controller: context.read<SinupCubit>().emailController,
          validator: (value) =>
              context.read<SinupCubit>().validatoremail(value),
          onChanged: (p0) {
            context.read<SinupCubit>().email = p0;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        // نص للعمر
        TextInSinup(
          text: 'Age',
        ),
        // حقل إدخال للعمر
        CustomTextFromFiled(
          hinttext: 'yaers old',
          controller: context.read<SinupCubit>().ageController,
          validator: (value) =>
              context.read<SinupCubit>().validatornameandageand(value),
          onChanged: (p0) {
            context.read<SinupCubit>().age = p0;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        // نص للهاتف
        TextInSinup(
          text: 'phone',
        ),
        // حقل إدخال للهاتف
        CustomTextFromFiled(
          hinttext: '+02 01123456789',
          controller: context.read<SinupCubit>().phoneController,
          validator: (value) =>
              context.read<SinupCubit>().validatorphone(value),
          onChanged: (p0) {
            context.read<SinupCubit>().phone = p0;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        // نص لكلمة المرور
        TextInSinup(
          text: 'password',
        ),
        // حقل إدخال لكلمة المرور
        CustomTextFromFiled(
          obscureText: isheddin,
          hinttext: 'Enter your password',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (isheddin == false) {
                    isheddin = true;
                  } else {
                    isheddin = false;
                  }
                });
              },
              icon: isheddin? Icon(Icons.visibility_off_outlined): Icon(Icons.remove_red_eye_outlined)),
          controller: context.read<SinupCubit>().passwordController,
          onChanged: (p0) {
            context.read<SinupCubit>().password = p0;
          },
          validator: (p0) => context.read<SinupCubit>().validatorpassword(p0),
        ),
        const SizedBox(
          height: 50,
        ),
        // زر التسجيل
        ButtonApp(
          text: 'Signup',
          onPressed: () {
            if (context.read<SinupCubit>().formKey.currentState!.validate()) {
              context.read<SinupCubit>().createUserWithEmailAndPassword(
                  context.read<SinupCubit>().email!,
                  context.read<SinupCubit>().password!);
              context.read<SinupCubit>().saveData('id', context.read<SinupCubit>().email!,);
              context.read<SinupCubit>().clear();
            }
          },
          colortext: Colors.white,
          color: maincolor,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class TextInSinup extends StatelessWidget {
  const TextInSinup({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Textstyles.text2otp
          .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}
