import 'package:ecommercefirebase/featrue/home/presention/view/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductGridviewItems extends StatelessWidget {
  const ProductGridviewItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
    
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 300 / 400 ,
          crossAxisCount: 2,
          crossAxisSpacing: 10,mainAxisSpacing: 10
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem() ;
        },
      ),
    );
  }
}
