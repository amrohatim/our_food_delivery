// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_const_constructors

import 'package:bug/detail_page/recommended_food.dart';
import 'package:bug/mainpage/mainpage.dart';
import 'package:bug/registration/login_page.dart';
import 'package:bug/registration/simple_black_signUp_page.dart';
import 'package:bug/registration/splash_page.dart';
import 'package:bug/registration/verification.dart';
import 'package:get/get.dart';

class RouteManger {
  static const String initial = "/";
  static const String popular_food_detail = "/popular-food";
  static const String recommended_food_detail = "/recommended-food";
  static const String cart_page = "/cart-page";
  static const String splash_page = "/splash-page";
  static const String logIn_page = "/login";
  static const String signUp_page = "/signup";
  static const String add_Address_page = "/add_address";
  static const String verifypage = "/verify";

  static String get_popular_food_detail(int pageid, String Page) =>
      "$popular_food_detail?PageId=$pageid&Page=$Page";
  static String get_rocmmended_food_detail(String name) =>
      "$recommended_food_detail?img=$name";
  static String get_splash_page() => splash_page;
  static String get_logIn_page() => logIn_page;
  static String get_sigUp_page() => signUp_page;
  static String get_add_address_page() => add_Address_page;
  static List<GetPage> routes = [
    GetPage(name: splash_page, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => const MainPage()),
    GetPage(
        name: logIn_page, page: () => LoginPage(), transition: Transition.fade),
    GetPage(
        name: signUp_page,
        page: () => SignUpPage(),
        transition: Transition.fade),
    GetPage(
        transition: Transition.leftToRight,
        name: recommended_food_detail,
        page: () {
          String img = Get.parameters['img'].toString();
          return RecommendedFood(img: img);
        }),
    GetPage(name: verifypage, page: () => VerifyPage())
  ];
}
