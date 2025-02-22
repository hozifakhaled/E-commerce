import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class SectionTextAndImageInForgetPassword extends StatelessWidget {
  const SectionTextAndImageInForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center, // محاذاة الصورة في المنتصف
          child: Image.asset(
            Assets.imagesImageotp,
            width: context.width * .6,
            height: context.height * .25,
          ),
        ),
        const SizedBox(height: 40), // إضافة مساحة فارغة
        Text('Forget Password',
            style: Textstyles.text1otp), // نص التحقق من OTP
        const SizedBox(height: 10), // إضافة مساحة فارغة
        Text('Enter the password sent to your Email',
            style: Textstyles.text2otp), // نص تعليمات OTP
        const SizedBox(height: 40),
      ],
    );
  }
}
