import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/body_cart_view.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/list_row_summery_in_cart.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/product_item_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@override
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>()..getData(),
      child: Scaffold(
        backgroundColor: maincolor2,
        body: BodyCartview(),
      ),
    );
  }
}

