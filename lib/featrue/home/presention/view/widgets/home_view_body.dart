import 'package:ecommercefirebase/featrue/home/presention/view/widgets/frist_section_in_home.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(spacing: 20.h, children: [
       const FristSectionInHome(),
       const ProductListItem(),
      ]),
    );
  }
}

