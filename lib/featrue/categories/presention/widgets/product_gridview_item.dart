import 'package:ecommercefirebase/featrue/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridviewItems extends StatelessWidget {
  const ProductGridviewItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductLoaded) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 300 / 400,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  desc: state.data[index].dosc,
                  price: state.data[index].price.toString(),
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
