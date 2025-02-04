import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class RowSinupOrLogin extends StatelessWidget {
  const RowSinupOrLogin({
    super.key,
    this.onTap, required this.text, required this.button,
  });
  final void Function()? onTap;
  final String text ;
  final String button;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Textstyles.text1otp
              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            button,
            style: Textstyles.text1otp.copyWith(
                fontSize: 18.sp, color: maincolor, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
