import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/category_item.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/frist_section_in_home.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/item_in_home.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/list_categories_items.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/search_textfiled_in_home.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/swiper_in_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20.h,
        children: [
          FristSectionInHome(),
         /*Container(
          height: context.height*.25,
          width: double.infinity,
    
          color: maincolor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                  Align(
            alignment: Alignment.topLeft,
            child: Text('Featrue product ',style:Textstyles.textfeatruecategory.copyWith(color: Colors.white))),
    
                AspectRatio(aspectRatio: 100/250,
                child: Container(color: Colors.white,),
                
                ),
              ],
            ),
          )
           
          ,
         )*/
        ],
      ),
    );
  }
}

