import 'package:ecommercefirebase/featrue/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/product_loading.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductGridviewItems extends StatelessWidget {
  const ProductGridviewItems({
    super.key, required this.searchText,
  });
  final String searchText;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductLoaded) {
          final searchdata = state.data.where((element) => element.name.toLowerCase().contains(searchText.toLowerCase())).toList();
       if (searchText.isEmpty) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 250 / 360,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                   onTap: () {
        GoRouter.of(context).push('/details',extra:state.data[index] );
      },
                  name: state.data[index].name,
                  price: state.data[index].price.toString(),
                  image: state.data[index].image,
                );
              },
            ),
          );
        }
        else {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 250 / 360,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: searchdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  onTap: () {
        GoRouter.of(context).push('/details',extra:searchdata[index] );
      },
                  name: searchdata[index].name,
                  price: searchdata[index].price.toString(),
                  image: searchdata[index].image,
                );
              },
            ),
          );
        }
       }   else {
          return ProductLoadingShimmer();
        }
      },
    );
  }
}
