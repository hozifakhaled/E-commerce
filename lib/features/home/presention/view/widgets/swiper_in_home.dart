import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class SwiperInHome extends StatelessWidget {
  const SwiperInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),),
      child: Swiper(
        itemCount: 4,
        itemBuilder: (context, index) {
          List<String> images = [
            Assets.imagesUnsplash,
            Assets.imagesOffer2,
            Assets.imagesOffer3,
            Assets.imagesOffer4
          ];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              
              images[index],
              fit: BoxFit.fill,
            ),
          );
        },
        autoplay: true,
        autoplayDelay: 3000,
        pagination: const SwiperPagination(

          alignment: Alignment.bottomCenter, // وضع النقاط أسفل السلايدر
          builder: DotSwiperPaginationBuilder(
            space: 10,
            color: Colors.grey,
            activeColor: maincolor,
          ),
        ),
        control: null, // إزالة الأسهم
      ),
    );
  }
}
