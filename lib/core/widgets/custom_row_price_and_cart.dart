import 'package:ecommercefirebase/core/widgets/custom_icon_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowPriceAndCart extends StatelessWidget {
  const RowPriceAndCart({
    super.key,
    required this.price,
    required this.oldprice,
    required this.color,
    required this.name,
    required this.image,
    required this.size,
  });

  final String price;
  final String oldprice;
  final String color;
  final String name;
  final String image;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              '\$' + price,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  color: Colors.black, fontSize: 15.sp),
            ),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              oldprice.isEmpty ? '' : '\$' + oldprice,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
    
              style: GoogleFonts.montserrat(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black,
                  fontSize: 15.sp),
            ),
          ],
        ),
        CustomIconCart(color: color, name: name, price: price, image: image, size: size)
      ],
    );
  }
}

