import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key, required this.text, required this.color,
   
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
                        decoration: BoxDecoration(
     color:color,
     borderRadius: BorderRadius.circular(40.r),
                        ),
                        height: 50.h,
                        width: 50.h,
                        child: Center(
     child: Text(
    text,
       style: Textstyles.textfeatruecategory
           .copyWith(color: Colors.black, fontSize: 20.sp,fontWeight: FontWeight.bold),
     ),
                        ),
                      );
  }
}
