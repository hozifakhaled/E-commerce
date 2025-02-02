import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var item = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        label: 'category',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',

      ),
    ];
    var screens = [
     HomeViewBody(),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.yellow,
      )
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: TextFieldColor,
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
