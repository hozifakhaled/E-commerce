import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/cart/domain/entities/entitey_cart.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemInCart extends StatelessWidget {
  const ProductItemInCart({
    super.key,
    required this.cart,
  });
  final EntiteyCart cart;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart, // ✅ سحب لليسار فقط
      onDismissed: (direction) {
        context
            .read<CartCubit>()
            .deletedata(cart.id); // ✅ حذف العنصر عند السحب
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red, // ✅ خلفية حمراء عند السحب
        child: const Icon(
          CupertinoIcons.delete,
          color: Colors.white,
        ),
      ),
      child: Container(
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
                          height: 70.h, width: 70.w, imageUrl: cart.image)),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: context.width * .2,
                        child: Text(cart.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ),
                      Text('Quntity : ${cart.quantity}',
                          style: GoogleFonts.poppins(fontSize: 14.sp)),
                      Text("\$${cart.price}",
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
                  Text('Size : ${cart.size}', style: Textstyles.text16),
                  Text('Color : ${cart.color}', style: Textstyles.text16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
