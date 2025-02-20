import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemInHome extends StatelessWidget {
  const ItemInHome({
    super.key, required this.height, required this.width, required this.icon, required this.text,
  });
 final double height ;
 final double width ;
 final Icon icon ;
 final String text ;
  @override
  Widget build(BuildContext context) {
    return Material(
     
      borderRadius: BorderRadius.circular(20.r),
      color: Colors.white,
      child: SizedBox(
        width: width,
        height:  height,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(text,style: Textstyles.text16),
          ],
        ),
      ),
    );
  }
}

