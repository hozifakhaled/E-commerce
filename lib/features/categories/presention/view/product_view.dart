import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/widgets/product_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getdata('product'),
        ),
       
      
      ],
      child: Scaffold(
        backgroundColor: maincolor2,
        body: const ProductBodyView(),
      ),
    );
  }
}
