import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/featrue/categories/presention/widgets/catgories_list_items.dart';
import 'package:ecommercefirebase/featrue/categories/presention/widgets/product_gridview_item.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/search_textfiled_in_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBodyView extends StatelessWidget {
  const ProductBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10.h,
        children: [
          searchTextFiledInHome(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Categories',
              style: Textstyles.textfeatruecategory
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          CatgoriesListItems(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Products',
              style: Textstyles.textfeatruecategory
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ProductGridviewItems(),
        ],
      ),
    );
  }
}
