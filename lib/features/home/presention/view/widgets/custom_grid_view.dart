import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/core/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.data});
  final List<ProductEntitiy> data;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = data[index];

          return ProductItem(
            onTap: () {
              GoRouter.of(context).push('/details',
                  extra: {'productEntitiy': product, 'index': index});
            },
           index: index,
                  productEntitiy: product,
          );
        },
        childCount: data.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 250 / 360,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
