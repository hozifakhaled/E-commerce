import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.text,
    required this.image, required this.color,
  });
  final String text;
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: color,
      //  elevation: 5,
      child: SizedBox(
        height: 50.h,
        //  width: 120.w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 20,
            children: [
              Image.asset(
                image,
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 18.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
