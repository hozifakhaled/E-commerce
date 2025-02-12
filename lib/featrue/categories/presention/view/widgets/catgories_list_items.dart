import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/featrue/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/category_item.dart';
import 'package:ecommercefirebase/featrue/home/data/models/categeries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatgoriesListItems extends StatefulWidget {
  const CatgoriesListItems({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<CatgoriesListItems> createState() => _CatgoriesListItemsState();
}

class _CatgoriesListItemsState extends State<CatgoriesListItems> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              widget.controller.clear();
              context.read<ProductCubit>().getdata(data[index].id!);
              setState(() {
                currentindex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoriesItems(
                image: data[index].image!,
                text: data[index].name!,
                color: currentindex == index ? maincolor : Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
