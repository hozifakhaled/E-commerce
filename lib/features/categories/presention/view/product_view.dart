import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_body_view.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: maincolor2,
          body: const ProductBodyView(),
        );
  }
}
