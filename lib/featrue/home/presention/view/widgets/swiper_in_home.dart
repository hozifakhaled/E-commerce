import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class SwiperInHome extends StatelessWidget {
  const SwiperInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper.list(
      list: [Assets.imagesUnsplash, Assets.imagesUnsplash, Assets.imagesUnsplash],
      builder: (context, data, index) {
        return Image.asset(data, fit: BoxFit.fill);
      },
       autoplay: true, // تفعيل التشغيل التلقائي
    autoplayDelay: 3000, // مدة الانتظار بين كل تمرير (بالملي ثانية)
    pagination: const SwiperPagination(
       builder: DotSwiperPaginationBuilder(
        space: 10,
        
        color: Colors.grey, // لون النقاط العادية
        activeColor: maincolor, // لون النقطة النشطة
      ),
    ),
    control: const SwiperControl(),
    
    );
  }
}

