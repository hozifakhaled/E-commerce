import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/product_detailes_body.dart';
import 'package:flutter/material.dart';

class ProductDetales extends StatelessWidget {
  const ProductDetales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
body:ProductDetailesBody() ,

    )
    ;
  }
}