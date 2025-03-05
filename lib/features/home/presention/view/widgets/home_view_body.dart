import 'package:ecommercefirebase/features/home/presention/cubit/cubit/arrvail_cubit.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/frist_section_in_home.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: BlocProvider(
        create: (context) => ArrvailCubit(),
        child: FristSectionInHome(),
      )),
      SliverToBoxAdapter(
          child: SizedBox(
        height: 20.h,
      )),
      SliverToBoxAdapter(
        child:  ProductListItem(),
      
      ),
    ]);
  }
}
