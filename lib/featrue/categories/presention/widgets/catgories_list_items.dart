import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/featrue/categories/presention/widgets/category_item.dart';
import 'package:ecommercefirebase/featrue/home/data/models/categeries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatgoriesListItems extends StatefulWidget {
  const CatgoriesListItems({super.key});

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
              setState(() {
                currentindex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoriesItems(
                image: data[index].image!,
                text: data[index].name!,
                color:currentindex == index ? maincolor :Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
