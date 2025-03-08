import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/stripe/payment_function.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void showPaymentSheet(BuildContext context, double totalPrice,void Function() onTap) {
  showModalBottomSheet(
    context: context,
    backgroundColor: maincolor2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPaymentOption(
                icon: Icons.attach_money,
                label: "Cash",
                onTap:onTap),
            _buildPaymentOption(
                icon: Icons.credit_card,
                label: "Stripe",
                onTap: () {
                  PaymentFunction.managepayment(totalPrice.toInt(), 'USD');
                  GoRouter.of(context).go(AppRoutes.home);
                }),
          ],
        ),
      );
    },
  );
}

Widget _buildPaymentOption(
    {required IconData icon,
    required String label,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 120.h,
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: maincolor, width: 2)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: maincolor,
              ),
              width: 50.h,
              height: 50.h,
              child: Icon(icon, size: 35.sp, color: maincolor2),
            ),
            SizedBox(height: 8),
            Text(label, style: Textstyles.text18),
          ],
        ),
      ),
    ),
  );
}
