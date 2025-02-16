import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowRating extends StatelessWidget {
  const RowRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        'Sold: 5 items ',
        style: Textstyles.text16.copyWith(color: Colors.black, fontSize: 14.sp),
      ),
      Text(
        '(Reamaining : 5 )',
        style: Textstyles.text16.copyWith(color: Colors.black, fontSize: 14.sp),
      ),
    
    ]);
  }
}
