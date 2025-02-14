import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowNameAndQuantity extends StatelessWidget {
  const RowNameAndQuantity({
    super.key,
    required this.name,
    required this.price,
    required this.quantitynumber,
    this.onPressedincrement,
    this.onPresseddecrement,
  });
  final String name;
  final double price;
  final int quantitynumber;
  final void Function()? onPressedincrement;
  final void Function()? onPresseddecrement;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        name,
        style: Textstyles.textfeatruecategory
            .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      Container(
        decoration: BoxDecoration(
            color: maincolor2, borderRadius: BorderRadius.circular(40.r)),
        height: 40.h,
        width: 110.w,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            IconButton(
              onPressed: onPresseddecrement,
              icon: Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
            Text(
              quantitynumber.toString(),
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            IconButton(
              onPressed: onPressedincrement,
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      )
    ]);
  }
}
