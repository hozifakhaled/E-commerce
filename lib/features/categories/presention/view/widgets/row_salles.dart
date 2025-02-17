import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSalles extends StatelessWidget {
  const RowSalles({
    super.key, required this.reamaining, required this.sold,
  });
final int reamaining ;
final int sold;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        'Sold: $sold items ',
        style: Textstyles.text16.copyWith(color: Colors.black, fontSize: 14.sp),
      ),
      Text(
        '(Reamaining : $reamaining )',
        style: Textstyles.text16.copyWith(color: Colors.black, fontSize: 14.sp),
      ),
    
    ]);
  }
}
