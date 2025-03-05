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
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Row(
                children: [
                  Text(
                    name,
                    style:
                        Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " (${state.data.length.toString()})",
                    style:
                        Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              CustomGridView(data: state.data)
            ],
          );
        } else if (state is ProductFailure) {
          return Text(state.errorMessage.toString());
        } else {
          return const  ProductLoadingShimmer();
        }
      },
    );
  }
}
