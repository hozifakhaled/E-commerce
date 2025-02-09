import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemInCart extends StatelessWidget {
  const ProductItemInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * .15,
      decoration: BoxDecoration(
       color: maincolor2,
       border: Border(
         bottom: BorderSide(width: .5, color: Colors.grey),)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  height:70.h,
                  width: 70.w,
                 imageUrl:
                'https://qymunmwtahpiautlqlaw.supabase.co/storage/v1/object/public/mainimage//photo_2025-02-08_09-23-24-removebg-preview.png'
                         ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('name', style:GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                    Text("\$150",
                        style:GoogleFonts.(fontSize: 20.sp,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
                  