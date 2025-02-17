import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_detailes_body.dart';
import 'package:flutter/material.dart';

class ProductDetales extends StatelessWidget {
  const ProductDetales({super.key, required this.data});
final Map<String,dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
body:ProductDetailesBody(productEntitiy: data['productEntitiy'],index: data['index'],
) ,

    )
    ;
  }
}