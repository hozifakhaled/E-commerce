import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/auth/forget%20password/presention/view/widgets/body_forget_password_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: maincolor2,
        title: CustomTitleLogo(textcolor1: Colors.black, textcolor2: maincolor),),
      backgroundColor: maincolor2, // تعيين لون الخلفية للأبيض
      body: BodyForgetPasswordView(),
    );
  }
}
