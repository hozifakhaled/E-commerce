import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    super.key, required this.image, required this.text, required this.color,
  });
  final String image ;
  final String text ;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container (
          width: 60.h,
          height: 60.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
          color: color,),
          
          child: Image.asset(image,width: 50.h,height: 50.h,)),
          Text(text,style: Textstyles.textfeatruecategory.copyWith(fontSize: 14.sp),)
      ],
    );
  }
}

