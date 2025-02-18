import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/categories/domein/entities/product_entitiy.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/detailes_cubit/detaile_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/list_size.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/row_salles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionColorsAndSizeAndSalles extends StatelessWidget {
  const SectionColorsAndSizeAndSalles({
    super.key,
    required this.productEntitiy,
  });

  final ProductEntitiy productEntitiy;

  @override
  Widget build(BuildContext context) {
  

    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width * .8,
          height: context.height * .18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowSalles(
                reamaining: productEntitiy.reamaining,
                sold: productEntitiy.sold,
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
        Container(
         // height: context.height * .18,
          decoration: BoxDecoration(
              color: maincolor2, borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            children: List.generate(productEntitiy.color.length, (index) {
              String colorName = productEntitiy.color.keys.elementAt(index); 
              
    String colorHex = productEntitiy.color[colorName]; 
          return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: Color(int.parse(colorHex)), // ✅ تحويل Hex إلى لون
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
              );
            },),
          )
         
        ),
      ],
    );
  }
}
