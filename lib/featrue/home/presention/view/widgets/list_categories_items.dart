import 'package:ecommercefirebase/featrue/home/data/models/categeries_model.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListCategoriesItems extends StatelessWidget {
  const ListCategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 140.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: MasonryGridView.count(
          scrollDirection: Axis.horizontal,
          //  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // childAspectRatio: 50/120,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          // mainAxisExtent: 135,

          // ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCategory(image: data[index].image!, text: data[index].name!,);
          },
        ),
      ),
    );
  }
}
