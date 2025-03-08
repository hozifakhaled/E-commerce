import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/detailes_cubit/detaile_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/list_color_in_detailes.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/list_size.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/row_salles.dart';
import 'package:ecommercefirebase/features/home/domein/entities/product_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionColorsAndSizeAndSalles extends StatelessWidget {
  const SectionColorsAndSizeAndSalles({
    super.key,
    required this.productEntitiy,
  });

  final ProductEntitiy productEntitiy;

  @override
  Widget build(BuildContext context) {
    context.read<DetaileCubit>().size = productEntitiy.sizes[0];
    context.read<DetaileCubit>().color=productEntitiy.color.keys.elementAt(0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width * .8,
          height: context.height * .20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowSalles(
                reamaining: productEntitiy.reamaining,
                sold: productEntitiy.sold,
              ),
                SizedBox(
                    height: context.height * 0.002,
                  ),
              ListSize(
                list: productEntitiy.sizes,
                onSizeSelected: (p0) {
                  context.read<DetaileCubit>().size = p0;
                },
              ),
            ],
          ),
        ),
        ListColorInDetailes(
          productEntitiy: productEntitiy,
          onSizeSelected: (p0) {
            context.read<DetaileCubit>().color = p0;
           },
        ),
      ],
    );
  }
}
