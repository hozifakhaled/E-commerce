import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowTextAndIconInSetting extends StatelessWidget {
  const RowTextAndIconInSetting({
    super.key, required this.icon1, required this.text, required this.icon2,
  });
final Widget icon1;
final String text;
final Widget icon2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey.shade300),
            child: icon1),
            SizedBox(width: 8.w,),
        Text(
          text,
          style: Textstyles.text16,
        ),
        Spacer(),IconButton(onPressed: (){}, icon: icon2)
      ],
    );
  }
}
