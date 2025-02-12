
import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/row_login_or_sinup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextAndImage extends StatelessWidget {
  const TextAndImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
