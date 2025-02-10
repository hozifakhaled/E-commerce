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
      width: context.width,
      height: context.height * .15,
      decoration: BoxDecoration(
          color: maincolor2,
          border: Border(
            bottom: BorderSide(width: .5, color: Colors.grey),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: CachedNetworkImage(
                      height: 70.h,
                      width: 70.w,
                      imageUrl:
                          'https://qymunmwtahpiautlqlaw.supabase.co/storage/v1/object/public/mainimage//photo_2025-02-08_09-23-24-removebg-preview.png'),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('name',
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    Text('Quntity : 3',
                        style: GoogleFonts.poppins(fontSize: 14.sp)),
                    Text("\$150",
                        style: GoogleFonts.montserrat(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  width: context.width * .25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Size : XL',
                        style: GoogleFonts.poppins(fontSize: 16.sp)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      ),
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
