import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/widgets/body_cart_view.dart';
import 'package:flutter/material.dart';

@override
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
      body: BodyCartview(),
    );
  }
}

