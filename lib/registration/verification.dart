import 'dart:async';

import 'package:bug/constants.dart';
import 'package:bug/route/route_helper.dart';
import 'package:bug/server/data/controllers/saler_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool verifing() {
    String? id = Get.find<SalerController>()
        .salerRepo
        .sharedPreferences
        .getString("salerid");

    if (id != null) {
      Get.find<SalerController>().verifySaler(id);
      return Get.find<SalerController>().isverfied;
    }
    return true;
  }

  Stream stream = Stream.periodic(Duration(seconds: 5), (int) {
    return int++;
  });
  late StreamSubscription streamSubscription;
  @override
  void initState() {
    super.initState();
    streamSubscription = stream.listen(
      (event) {
        print(verifing().toString());
        if (verifing() == true) {
          Get.offNamed(RouteManger.initial);
          Get.snackbar(
              backgroundColor: Mycolors.primarycolor,
              colorText: Colors.white,
              "Success",
              "You have successfully registered");
        }
        setState(() {});
      },
    );
  }

  goToHome() {
    Get.offNamed(RouteManger.initial);
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 10), verifing);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verification",
                style: GoogleFonts.roboto(
                    color: Mycolors.primarycolor,
                    letterSpacing: 2,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 400.w,
                height: 350.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/verify.jpg"))),
              ),
              SizedBox(
                width: 340.w,
                child: Text(
                    style:
                        TextStyle(color: Colors.grey.shade800, fontSize: 14.sp),
                    "Dear user we highly appreciate your patience and commitment in the registration process , we are verifying your information and you will receive a phone call from the admin to inform you about our Terms of Service."),
              ),
              Container(
                width: 340.w,
                margin: EdgeInsets.only(top: 5.h),
                child: Text.rich(TextSpan(
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14.sp),
                    text: "Admin will call your number :",
                    children: [
                      TextSpan(
                          style: TextStyle(
                              color: Mycolors.primarycolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                          text: " 0556441299")
                    ])),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 44.w),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Mycolors.primarycolor,
                  minHeight: 3.h,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () => goToHome(),
                child: Container(
                  width: 340.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Mycolors.primarycolor,
                      borderRadius: BorderRadius.all(Radius.circular(8).w)),
                  child: Center(
                    child: Text(
                      "Back to home",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: const Color.fromARGB(240, 255, 255, 255)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
