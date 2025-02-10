import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/view/widgets/list_products_items_in_cart.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/view/widgets/list_row_summery_in_cart.dart';
import 'package:flutter/material.dart';

@override
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
           const ListProductsItemsInCart(),
           const ListRowSummeryInCart(),
           buttonApp(text: 'Checkout', color: maincolor, colortext: maincolor2)
          ],
        ),
      ),
    );
  }
}

