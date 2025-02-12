import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemInCart extends StatelessWidget {
  const ProductItemInCart({
    super.key, required this.name, required this.size, required this.quntity, required this.image, required this.price,
  });
final String name;
final String size;
final String quntity;
final String image;
final String price;
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
                      imageUrl:image
                  )  ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: context.width * .2,
                      child: Text(name,
                      overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    ),
                    Text('Quntity : $quntity',
                        style: GoogleFonts.poppins(fontSize: 14.sp)),
                    Text("\$$price",
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
                           
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Size : $size',
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
      ),
    );
  }
}
