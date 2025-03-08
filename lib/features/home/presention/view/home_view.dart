import 'dart:io';

import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/manger/cubit/product_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/product_view.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/cart_view.dart';
import 'package:ecommercefirebase/features/home/presention/cubit/bestsellingcubit/home_cubit.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/icon_cart.dart';
import 'package:ecommercefirebase/features/notifcation/data/model/notification_model.dart';
import 'package:ecommercefirebase/features/notifcation/presentiion/cubit/notifications_cubit.dart';
import 'package:ecommercefirebase/features/notifcation/presentiion/view/notification_view.dart';
import 'package:ecommercefirebase/features/notifcation/presentiion/view/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String image = CacheHelper().getData(key: 'image') ?? '';
  int currentIndex = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var item = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Category',
      ),
      BottomNavigationBarItem(
        icon: IconCart(),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notification',
      ),
    ];
    var screens = [
      BlocProvider.value(
        value: getIt<HomeCubit>()..getBestSelling(),
        child: const HomeViewBody(),
      ),
      BlocProvider.value(
        value: getIt<ProductCubit>()..getdata('product'),
        child: ProductView(),
      ),
      BlocProvider.value(
        value: getIt<CartCubit>()..getData(),
        child: const CartView(),
      ),
      BlocProvider(
        create: (context) => NotificationsCubit(Hive.box<NotificationModel>('box'))..loadNotifications(),
        child: const NotificationViewBody(),
      ),
    ];
    return SafeArea(
      child: BlocProvider<CartCubit>(
        create: (context) => getIt<CartCubit>(),
        child: Scaffold(
          appBar: AppBar(
            title: CustomTitleLogo(
              textcolor1: Colors.black,
              textcolor2: maincolor,
            ),
            toolbarHeight: 50.h,
            backgroundColor: maincolor2,
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                //  color: Colors.blueGrey,
                child: MaterialButton(
                  onPressed: () {
                    GoRouter.of(context).push('/profile',
                        extra: CacheHelper().getData(key: 'id'));
                  },
                  child: image != ''
                      ? CircleAvatar(
                          backgroundImage: FileImage(File(image)),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
          backgroundColor: maincolor2,
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: maincolor2,
            items: item,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            selectedItemColor: maincolor,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
