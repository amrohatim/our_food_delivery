import 'dart:async';

import 'package:bug/history/history_page.dart';
import 'package:bug/main.dart';
import 'package:bug/mainpage/update_saler_status_controller.dart';
import 'package:bug/profile/profile.dart';
import 'package:bug/shop/shop.dart';
import 'package:bug/widgets/four_nav_bar.dart';
import 'package:bug/widgets/mybottomnavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController();
  final PageController pageController2 = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateSalerStatusController>(
      builder: (controller) {
        bool isSaler = controller.isSaler;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 5.h,
            backgroundColor: Color(0xff000000).withAlpha(220),
          ),
          body: isSaler == true
              ? PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController2,
                  children: [
                    RestaurantScreen(),
                    OrderDetailsScreen(),
                    Shop(),
                    Profile()
                  ],
                )
              : PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    RestaurantScreen(),
                    OrderDetailsScreen(),
                    Profile()
                  ],
                ),
          bottomNavigationBar: isSaler == true
              ? FourNavBar(pageController: pageController2)
              : MyBottomNavBar(
                  pageController: pageController,
                ),
        );
      },
    );
  }
}
