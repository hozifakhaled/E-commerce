import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/catgories_list_items.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_gridview_item.dart';
import 'package:flutter/material.dart';

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
      child: CustomScrollView(
        
        slivers:
        [
          SliverToBoxAdapter(

            child: CustomTextFromFiled(
              hinttext: 'Search',
              suffixIcon: Icon(Icons.search),
              controller: _searchController,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' Categories',
                style: Textstyles.textfeatruecategory
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CatgoriesListItems(controller: _searchController)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' Products',
                style: Textstyles.textfeatruecategory
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
           ProductGridviewItems(searchText: searchText)
        ],
      ),
    );
  }
}
