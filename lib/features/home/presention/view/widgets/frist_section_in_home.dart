import 'package:ecommercefirebase/core/routeing/routs.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/item_in_home.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/list_categories_items.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/swiper_in_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FristSectionInHome extends StatelessWidget {
  const FristSectionInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10.h,
        children: [
          SizedBox(
            height: context.height * .20,
            child: const SwiperInHome(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                2,
                (index) => InkWell(
                  onTap: () {
                    if (index == 0) {
                      GoRouter.of(context)
                          .push(AppRoutes.customProduct,extra: index);
                    }else{
                      GoRouter.of(context)
                          .push(AppRoutes.customProduct,extra: index);
                    }
                  },
                  child: ItemInHome(
                    text: index == 0 ? 'New Arrivals' : 'Discunted products ',
                    icon: index == 0
                        ? Icon(
                            Icons.share_arrival_time,
                            size: 35.sp,
                            color: maincolor,
                          )
                        : Icon(
                            Icons.discount,
                            size: 35.sp,
                            color: maincolor,
                          ),
                    width: context.width * .45,
                    height: context.height * .15,
                  ),
                )),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text('Featrue Category ',
                  style: Textstyles.textfeatruecategory)),
          const ListCategoriesItems(),
        ],
      ),
    );
  }
}
