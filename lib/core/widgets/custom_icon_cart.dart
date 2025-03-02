import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconCart extends StatelessWidget {
  const CustomIconCart({
    super.key,
    required this.color,
    required this.name,
    required this.price,
    required this.image,
    required this.size,
  });

  final String color;
  final String name;
  final String price;
  final String image;
  final String size;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartSuccess) {
            Helpers()
                .alertDone(context, 'Done', 'Added to cart',
                    null, null, DialogType.success)
                .show();
          }
        },
        child: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  context.read<CartCubit>().addtocart(
                  
                      color: color,
                      name: name,
                      price: price,
                      quantity: '1',
                      image: image,
                      size: size);
                },
                icon: Icon(
                  CupertinoIcons.cart_fill,
                  color: maincolor,
                  size: 22.sp,
                ));
          }
        ),
      ),
    );
  }
}
