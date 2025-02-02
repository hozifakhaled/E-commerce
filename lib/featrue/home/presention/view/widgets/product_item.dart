import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 300 / 400,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
       color: Colors.white,
        ),
          margin: const EdgeInsets.only(right: 8),
          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: context.height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.imagesHoodies,
                  width: 150.w,
                  height: 130.h,
                  fit: BoxFit.fill,
                ),
                Text(
                  'Regular Fit Slogan',
                  style: Textstyles.textfeatruecategory
                      .copyWith(color: Colors.black, fontSize: 16.sp),
                ),Text('\$20',style: Textstyles.textfeatruecategory.copyWith(color: textcoloroto2, fontSize: 14.sp),),
              ],
            ),
          )),
    );
  }
}
