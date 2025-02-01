import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDay extends StatelessWidget {
  const ItemDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20.r),
      color: Colors.white,
      child: SizedBox(
        width: context.width*.45,
        height:  context.height*.15,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.today_outlined,size: 35.sp,color: maincolor,),
            Text('Daily Deals',style: Textstyles.text2otp.copyWith(color: Colors.black),)
          ],
        ),
      ),
    );
  }
}

