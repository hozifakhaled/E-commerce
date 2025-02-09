import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/catgories_list_items.dart';
import 'package:ecommercefirebase/featrue/categories/presention/view/widgets/product_gridview_item.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/search_textfiled_in_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBodyView extends StatefulWidget {
  const ProductBodyView({super.key});

  @override
  State<ProductBodyView> createState() => _ProductBodyViewState();
}

class _ProductBodyViewState extends State<ProductBodyView> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchText = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10.h,
        children: [
          CustomTextFromFiled(
            hinttext: 'Search',
            suffixIcon: Icon(Icons.search),
            controller: _searchController,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Categories',
              style: Textstyles.textfeatruecategory
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          CatgoriesListItems(controller: _searchController),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Products',
              style: Textstyles.textfeatruecategory
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ProductGridviewItems(searchText: searchText),
        ],
      ),
    );
  }
}
