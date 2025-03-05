import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/home/presention/cubit/cubit/arrvail_cubit.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/arrviel_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProductsView extends StatelessWidget {
  const CustomProductsView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (index == 0) {
          return ArrvailCubit()..getArrvail();
        } else {
          return ArrvailCubit()..getDiscount();
        }
      },
      child: Scaffold(
        backgroundColor: maincolor2,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: maincolor,
          title: CustomTitleLogo(
            textcolor1: maincolor2,
            textcolor2: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ArrvielBodyView(text: index == 0 ? 'New Arrvail' : ' Discount Product',),
        ),
      ),
    );
  }
}
