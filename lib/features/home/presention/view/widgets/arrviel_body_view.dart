import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_loading.dart';
import 'package:ecommercefirebase/features/home/presention/cubit/cubit/arrvail_cubit.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArrvielBodyView extends StatelessWidget {
  const ArrvielBodyView({super.key, required this.text});
final String text ;
  @override
  Widget build(BuildContext context) {
     return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Text(
        text,
          style: Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
        )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        BlocBuilder<ArrvailCubit, ArrvailState>(
          builder: (context, state) {
            if (state is ArrvailSuccess) {
              return CustomGridView(data: state.productModelList);
            } else if (state is ArrvailError) {
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