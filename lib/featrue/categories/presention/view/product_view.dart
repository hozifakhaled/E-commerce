import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/featrue/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/featrue/categories/presention/widgets/product_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getdata(),
      child: Scaffold(
        backgroundColor: maincolor2,
        body: ProductBodyView(),
      ),
    );
  }
}
