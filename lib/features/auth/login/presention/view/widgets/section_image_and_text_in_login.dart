import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/row_login_or_sinup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionImageAndTextInLogin extends StatelessWidget {
  const SectionImageAndTextInLogin({
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
                width: context.width * .6, // عرض الصورة كنسبة من عرض الشاشة
                height: context.height * .25, // ارتفاع الصورة كنسبة من ارتفاع الشاشة
              ),),
               const SizedBox(
                  height: 20, // مساحة فارغة بين العناصر
                ),
          Text(
            'Login', // نص تسجيل الدخول
            style: Textstyles.text1otp, // نمط النص
          ),
          RowSinupOrLogin(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.signup); // الانتقال إلى صفحة التسجيل
            },
            text: 'Don\'t have an account? ', // نص السؤال
            button: 'Sign up', // نص زر التسجيل
          ),
          const SizedBox(
            height: 20, // مساحة فارغة بين العناصر
          ),
      ],
    );
  }
}
