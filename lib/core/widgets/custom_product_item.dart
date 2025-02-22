import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/custom_row_Price_and_cart.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
   
    this.onTap,
    required this.index, required this.productEntitiy,
   
  });
  final ProductEntitiy productEntitiy;
  
  final Function()? onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 250 / 400,
        child: Stack(
          children: [
           Container(
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
                          tag: productEntitiy.image + index.toString(),
                          child: Container(
                            width: context.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
                              color: maincolor2
                            ),
                            child: CachedNetworkImage(
                              height: context.height * 0.18,
                              fit: BoxFit.contain,
                              imageUrl:productEntitiy. image,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                      productEntitiy.  name,
                        style: Textstyles.text14
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      RowPriceAndCart(
                          price:productEntitiy. price,
                          oldprice:productEntitiy. oldprice,
                          color:productEntitiy. color.keys.first,
                          name:productEntitiy. name,
                          image:productEntitiy. image,
                          size:productEntitiy. sizes[0]),
                    ],
                  ),
                )),
            Positioned(
              top:15,
              right: 15,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined))),
         
        
          ],
        ),
      ),
    );
  }
}
