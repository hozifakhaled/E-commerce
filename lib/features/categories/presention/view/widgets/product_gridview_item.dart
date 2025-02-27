import 'package:ecommercefirebase/features/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_loading.dart';
import 'package:ecommercefirebase/core/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductGridviewItems extends StatelessWidget {
  const ProductGridviewItems({super.key, required this.searchText});

  final String searchText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is ProductLoaded) {
          final searchdata = state.data
              .where((element) =>
                  element.name.toLowerCase().contains(searchText.toLowerCase()))
              .toList();

          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product =
                    searchText.isEmpty ? state.data[index] : searchdata[index];

                return ProductItem(
                  
                  onTap: () {
                    GoRouter.of(context).push('/details', extra: {
                      'productEntitiy':product,
                      'index':index
                    });
                  },
                  index: index,
                  productEntitiy: product,
                );
              },
              childCount:
                  searchText.isEmpty ? state.data.length : searchdata.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 250 / 360,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
        } else {
          return SliverToBoxAdapter(child: ProductLoadingShimmer());
        }
      },
    );
  }
}
