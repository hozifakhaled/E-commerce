import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_loading.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBodyView extends StatelessWidget {
  const CategoryBodyView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Text(
         name,
          style: Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
        )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              return CustomGridView(data: state.data);
            } else if (state is ProductFailure) {
              return Text(state.errorMessage.toString());
            } else {
              return const SliverToBoxAdapter(child: ProductLoadingShimmer());
            }
          },
        )
      ],
    );
  }
}
