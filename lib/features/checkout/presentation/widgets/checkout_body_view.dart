import 'package:ecommercefirebase/core/stripe/payment_function.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:flutter/material.dart';

class CheckoutBodyView extends StatelessWidget {
  const CheckoutBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
     //   spacing: 20,
        children: [
          Text(
            'Name',
            style: Textstyles.text20,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Phone',
            style: Textstyles.text20,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Total price \$150',
            style: Textstyles.text20,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Select City*',
            style: Textstyles.text14,
          ),
          CustomTextFromFiled(hinttext: 'Your City'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Street Address*',
            style: Textstyles.text14,
          ),
          CustomTextFromFiled(hinttext: 'Enter street address'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Postal Code*',
            style: Textstyles.text14,
          ),
          CustomTextFromFiled(hinttext: 'Enter postal code'),
          const SizedBox(
            height: 20,
          ),
          ButtonApp(
            text: 'Place Order',
            color: maincolor,
            colortext: maincolor2,
            onPressed: () {
              PaymentFunction.managepayment(120, 'USD');
            },
          ),
        ],
      ),
    );
  }
}
