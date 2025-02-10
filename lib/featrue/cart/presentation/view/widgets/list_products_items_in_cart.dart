import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/featrue/cart/presentation/view/widgets/product_item_in_cart.dart';
import 'package:flutter/cupertino.dart';

class ListProductsItemsInCart extends StatelessWidget {
  const ListProductsItemsInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: context.height * .3,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ProductItemInCart();},
      ),
    );
  }
}

