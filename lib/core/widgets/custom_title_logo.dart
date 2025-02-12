import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleLogo extends StatelessWidget {
  const CustomTitleLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Click ',
          style: Textstyles.textlogo,
        ),
        Text(
          '&',
          style: TextStyle(
              color: maincolor, fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          ' Go ',
          style: Textstyles.textlogo,
        ),
      ],
    );
  }
}
