import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleLogo extends StatelessWidget {
  const CustomTitleLogo({
    super.key, required this.textcolor1, required this.textcolor2,
  });
final Color textcolor1 ;
final Color textcolor2 ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Click',
          style: Textstyles.textlogo.copyWith(color: textcolor1),
        ),
        Text(
          '&',
          style: Textstyles.textlogo.copyWith(
              color: textcolor2, fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          'Go ',
          style: Textstyles.textlogo.copyWith(color: textcolor1),
        ),
      ],
    );
  }
}
