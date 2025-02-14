import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_detailes_body.dart';
import 'package:flutter/material.dart';

class ProductDetales extends StatelessWidget {
  const ProductDetales({super.key, required this.productEntitiy});
final ProductEntitiy productEntitiy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
body:ProductDetailesBody(
  image: productEntitiy.image,
  name: productEntitiy.name,
  price: productEntitiy.price,
  description: productEntitiy.description,
  category: productEntitiy.category
) ,

    )
    ;
  }
}