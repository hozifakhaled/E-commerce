
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/detailes_cubit/detaile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAddToCart extends StatelessWidget {
  const ButtonAddToCart({
    super.key,
    required this.totalprice,
    required this.quantitynumber,
    required this.size,
    required this.name,
    required this.image,
    required this.reamaining,
    required this.sold,
    required this.id,
    required this.color,
  });
  final String color;
  final String size;
  final String name;
  final String image;
  final double totalprice;
  final int quantitynumber;
  final int reamaining;
  final int sold;
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
         
        //  context.read<CartCubit>().getData();
          Helpers()
              .alertDone(context, 'Done', 'Added to cart', null, null,
                  DialogType.success)
              .show();

          context.read<DetaileCubit>().update(id,
              sold: sold + quantitynumber,
              reamaining: reamaining - quantitynumber);
          //  GoRouter.of(context).pop();
        }else if(state is CartError){
          Helpers()
              .alertDone(context, 'Error', 'you must login', null, null,
                  DialogType.error)
              .show();
        }
      },
      child: SizedBox(
          width: context.width * .6,
          child: ButtonApp(
              onPressed: () {
                if (totalprice > 0) {
                  context.read<CartCubit>().addToCart(
                   
                        color: color,
                        name: name,
                        price: totalprice.toStringAsFixed(2),
                        quantity: quantitynumber.toString(),
                        image: image,
                        size: size,
                      );
                } else {
                  Helpers()
                      .alertDone(context, "Error", "Enter quantity", null, null,
                          DialogType.error)
                      .show();
                }
              },
              text: 'Add to cart',
              color: maincolor,
              colortext: maincolor2)),
    );
  }
}
