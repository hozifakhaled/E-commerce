import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/item_day.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/search_textfiled_in_home.dart';
import 'package:ecommercefirebase/featrue/home/presention/view/widgets/swiper_in_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 20.h,
        children: [
          searchTextFiledInHome(),
          SizedBox(
            height: context.height * .20,
            child: SwiperInHome(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(2, (index) => ItemDay()),
          ),
          SizedBox(
            height: context.height * .3,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return  Image.asset(Assets.imagesOffer, fit: BoxFit.fill,width: double.infinity,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
