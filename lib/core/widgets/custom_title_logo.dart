import 'package:ecommercefirebase/core/styles/colors.dart';
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
              style: TextStyle(color: Colors.black, fontSize: 26.sp,fontWeight: FontWeight.bold),
            ),
             Text(
              '&',
              style: TextStyle(color: maincolor, fontSize: 30.sp,fontWeight: FontWeight.bold),
            ),
             Text(
              ' Go ',
              style: TextStyle(color: Colors.black, fontSize: 26.sp,fontWeight: FontWeight.bold),
            ),
      ],
    );
  }
}