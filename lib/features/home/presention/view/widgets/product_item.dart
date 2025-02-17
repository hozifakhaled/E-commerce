import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.price,
    required this.name,
    required this.image, this.onTap, required this.index,
  });
  final String price;
  final String name;
  final String image;
  final Function()? onTap;
  final int index ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 250 / 400,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(right: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: context.height * 0.004,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      
                      tag: image+index.toString(),
                      child: CachedNetworkImage(
                        height: context.height * 0.18,
                        fit: BoxFit.cover,
                        imageUrl: image,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    name,
                    style: Textstyles.textfeatruecategory.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        '\$' + price,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 15.sp),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.cart_fill,
                            color: maincolor,
                            size: 22.sp,
                          ))
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
