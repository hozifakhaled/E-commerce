import 'package:ecommercefirebase/constants/images.dart';
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
                width: context.width * .6,
                height: context.height * .25,
              ),),
               const SizedBox(
                  height: 20,
                ),
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
      ],
    );
  }
}
