import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/scetion_container_in_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAddToCart extends StatelessWidget {
  const ButtonAddToCart({
    super.key,
    required this.widget,
    required this.totalprice,
    required this.quantitynumber,
    required this.size,
  });
  final String size;
  final SectionContinerInHome widget;
  final double totalprice;
  final int quantitynumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          Helpers()
              .alertDone(context, 'Done', 'Added to cart', null, null,
                  DialogType.success)
              .show();
        //  GoRouter.of(context).pop();
        }
      },
      child: SizedBox(
          width: context.width * .6,
          child: buttonApp(
              onPressed: () {
                if (totalprice > 0) {
                  context.read<CartCubit>().addtocart(
                        name: widget.name,
                        price: totalprice.toStringAsFixed(2),
                        quantity: quantitynumber.toString(),
                        image: widget.image,
                        size: size,
                      );
                }
              },
              text: 'Add to cart',
              color: maincolor,
              colortext: maincolor2)),
    );
  }
}
