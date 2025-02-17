import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/detailes_cubit/detaile_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/button_add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowPriceAndButton extends StatelessWidget {
  const RowPriceAndButton({
    super.key,
    required this.productEntitiy, required this.size,
  });

  final ProductEntitiy productEntitiy;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: context.width * .3,
            child: Text(
              '\$${context.read<DetaileCubit>().totalprice.toStringAsFixed(2)} ',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BlocProvider(
            create: (context) => CartCubit(),
            child: ButtonAddToCart(
              id: productEntitiy.id,
              reamaining:productEntitiy.reamaining, 
                sold: productEntitiy.sold,
                size: size,
                image: productEntitiy.image,
                name: productEntitiy.name,
                totalprice: context.read<DetaileCubit>().totalprice,
                quantitynumber: context.read<DetaileCubit>().quantity),
          )
        ]);
  }
}
