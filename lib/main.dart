import 'dart:async';

import 'package:bug/constants.dart';
import 'package:bug/helper/dependencies.dart' as dep;
import 'package:bug/mainpage/update_saler_status_controller.dart';
import 'package:bug/products_page/categorey_page.dart';
import 'package:bug/products_page/restaurants_page.dart';
import 'package:bug/route/route_helper.dart';
import 'package:bug/server/data/controllers/saler_controller.dart';
import 'package:bug/widgets/filter.dart';
import 'package:bug/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs = Get.find();

    if (prefs.getStringList("saler") == null &&
        prefs.getString('salerid') != null) {
      prefs.setStringList('saler', []);
      Get.find<SalerController>()
          .verifySaler(prefs.getString('salerid').toString());
    }

    if (prefs.getStringList('saler') == null) {
      prefs.setStringList('saler', []);
    }
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 825.4545454545455),
        builder: (context, child) {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            // home: VerifyPage(),
            getPages: RouteManger.routes,
            initialRoute: RouteManger.splash_page,
          );
        });
  }
}

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  SharedPreferences shared = Get.find();

  Stream stream = Stream.periodic(Duration(seconds: 5), (int) {
    return int++;
  });
  late StreamSubscription streamSubscription;
  @override
  void initState() {
    super.initState();

    streamSubscription = stream.listen(
      (event) async {
        if (shared.getString("salerid") != null &&
            shared.getStringList("saler")!.isEmpty) {
          shared.setStringList('saler', []);
          await Get.find<SalerController>()
              .verifySaler(shared.getString("salerid").toString());
          if (Get.find<SalerController>().isverfied == true) {
            Get.find<UpdateSalerStatusController>().isSaler = true;
            Get.snackbar(
                backgroundColor: Mycolors.primarycolor,
                colorText: Colors.white,
                "Success",
                "You have successfully registered");
          }

          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      // You can create a custom AppBar or a row that looks like the top
      // location bar in the screenshot. For simplicity, we’ll just use an AppBar:

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 50.h),
              child: Text(
                'Find Your',
                style: GoogleFonts.inter(
                  fontSize: 31.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                'Favorite Food',
                style: GoogleFonts.inter(
                  fontSize: 31.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //  search

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 5.h),
                  child: Search(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 5.h),
                  child: Filter(),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Title: "Restaurants"
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Categories section (horizontal scroll)
            CategoriesSection(),

            // "All restaurants" title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'All restaurants',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Restaurants list
            RestaurantList(),
          ],
        ),
      ),
    );
  }
}
