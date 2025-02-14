import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SammaryRowInCart extends StatelessWidget {
  const SammaryRowInCart({super.key, required this.label, required this.value, required this.bold});
  final String label;
  final String value;
  final bool bold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
         
            style:GoogleFonts.poppins(fontSize: 18.sp,fontWeight: bold? FontWeight.bold:FontWeight.normal),
        ),
        Text(
          value,
          style:
                 GoogleFonts.montserrat(fontSize: 18.sp,fontWeight: bold? FontWeight.bold:FontWeight.normal)
        ),
      ],
    );
    
  }
}
