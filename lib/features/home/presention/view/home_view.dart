import 'package:ecommercefirebase/core/database/cache/cache_helper.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommercefirebase/features/categories/presention/view/product_view.dart';
import 'package:ecommercefirebase/features/cart/presentation/view/cart_view.dart';
import 'package:ecommercefirebase/features/home/presention/view/widgets/icon_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        icon: BlocProvider(
          create: (context) => CartCubit()..getData(),
          child: IconCart(),
        ),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
    var screens = [
      const HomeViewBody(),
      const ProductView(),
      const CartView(),
      const CartView(),
    ];
    return SafeArea(
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
              color: Colors.blueGrey,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).push('/profile',
                      extra: CacheHelper().getData(key: 'id'));
                },
                icon: const Icon(
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
    );
  }
}
