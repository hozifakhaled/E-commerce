import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowUser extends StatelessWidget {
  const RowUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
      spacing: 10.h,
      children: [
        
        SizedBox(
          height: 50.h,
          width: 50.h,
          child: ClipRRect(
            
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(Assets.imagesTrangs,fit: BoxFit.fill,),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hozifa khaild',style: Textstyles.text16,),
            Text('whats The new?',style: Textstyles.text12.copyWith(color: Colors.grey.shade700),)
          ],
        )
      ],
    ));
  }
}