import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowRating extends StatelessWidget {
  const RowRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 17.sp,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 17.sp,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 17.sp,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 17.sp,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 17.sp,
      ),
      Text(
        ' ( 320 Reviews )',
        style: Textstyles.text2otp.copyWith(color: Colors.black,fontSize: 14.sp),
      ),
    ]);
  }
}
