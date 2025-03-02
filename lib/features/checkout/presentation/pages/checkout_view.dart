import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/checkout/presentation/widgets/checkout_body_view.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: CustomTitleLogo(textcolor1: maincolor2, textcolor2: Colors.black),

      ),
      backgroundColor: maincolor2,
      body:CheckoutBodyView(),
    );
  }
}