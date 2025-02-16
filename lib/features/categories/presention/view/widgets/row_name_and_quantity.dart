import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/cubit/detaile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowNameAndQuantity extends StatelessWidget {
  const RowNameAndQuantity({
    super.key,
    required this.name,
    required this.price,
  });
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        name,
        style: Textstyles.text18.copyWith(fontWeight: FontWeight.bold),
      ),
      Container(
        decoration: BoxDecoration(
            color: maincolor2, borderRadius: BorderRadius.circular(40.r)),
        height: 40.h,
        width: 110.w,
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () =>
                  context.read<DetaileCubit>().decrementQuantity(price),
              icon: Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
            Text(context.read<DetaileCubit>().quantity.toString(),
                style: Textstyles.text12),
            IconButton(
              onPressed: () =>
                  context.read<DetaileCubit>().incrementQuantity(price),
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      )
    ]);
  }
}
