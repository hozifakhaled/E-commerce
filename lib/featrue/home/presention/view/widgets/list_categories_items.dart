import 'package:ecommercefirebase/constants/images.dart';
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
    List<CategeriesModel> data = [
  CategeriesModel(name: 'Hoodie', image: Assets.imagesHoodies),
  CategeriesModel(name: 'T-shirt', image:Assets.imagesTeshartpng ),
  CategeriesModel(name: 'Shoes', image: Assets.imagesShoes),
  CategeriesModel(name: 'Accessories', image: Assets.imagesAccessorise),
  CategeriesModel(name: 'Tracksuit', image: Assets.imagesTrangs),
  CategeriesModel(name: 'Shorts', image: Assets.imagesShortspng),
  CategeriesModel(name: 'Pants', image: Assets.imagesPantalon),
  CategeriesModel(name: 'Shirt', image: Assets.imagesShmes),
  CategeriesModel(name: 'Bags', image: Assets.imagesBag),
];
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
