import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/detailes_cubit/detaile_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/row_name_and_quantity.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/row_price_and_button.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/section_color_and_size_and_selles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionContinerInDetailes extends StatelessWidget {
  const SectionContinerInDetailes({
    super.key,
    required this.productEntitiy,
  });

  final ProductEntitiy productEntitiy;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetaileCubit, DetaileState>(
      builder: (context, state) {
        return Container(
            width: double.infinity,
            height: context.height * 0.53,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  RowNameAndQuantity(
                    remaining: productEntitiy.reamaining,
                    sold: productEntitiy.sold,
                    name: productEntitiy.name,
                    price: double.parse(productEntitiy.price),
                  ),
                  SectionColorsAndSizeAndSalles(productEntitiy: productEntitiy),
                  Text(
                    'Description ',
                    style:
                        Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    productEntitiy.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Textstyles.text12,
                  ),
                  //   Spacer(),
                  RowPriceAndButton(
                      size: context.read<DetaileCubit>().size,
                      productEntitiy: productEntitiy)
                ],
              ),
            ));
      },
    );
  }
}

