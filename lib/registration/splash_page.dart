// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:bug/route/route_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  Matrix4 matrix = Matrix4.identity();
  Matrix4 matrix2 = Matrix4.identity();
  Matrix4 matrix3 = Matrix4.identity();
  bool osal = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController.forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () {
      Get.toNamed(RouteManger.initial);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Transform(
                transform: matrix,
                child: Image.asset(
                  "assets/images/food.png",
                  scale: 2.r,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Good",
                    style: GoogleFonts.mali(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange)),
                Text(" Food",
                    style: GoogleFonts.mali(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
