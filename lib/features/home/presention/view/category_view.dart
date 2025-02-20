import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/features/home/data/models/categeries_model.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/category_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final CategeriesModel category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getCategory(category.id!),
      child: Scaffold(
        backgroundColor: maincolor2,
      
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: maincolor,
          title:  CustomTitleLogo(textcolor1:maincolor2 ,textcolor2: Colors.black,),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:  CategoryBodyView(name: category.name!,),
        ),
      ),
    );
  }
}
