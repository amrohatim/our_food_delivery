// ignore_for_file: file_names

import 'package:bug/constants.dart';
import 'package:bug/route/route_helper.dart';
import 'package:bug/widgets/text_form_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    void signUpClick() {}

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 140.w,
              ),
              child: Image.asset(
                "assets/images/food.png",
                scale: 1.5.r,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child: Text(
                "Welcome, Log In",
                style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 40.h, right: 70.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextForm(controller: phoneController, hinttext: "Phone"),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextForm(
                      controller: passwordController, hinttext: "Password"),
                  SizedBox(
                    height: 50.h,
                  ),
                  InkWell(
                    onTap: () {
                      signUpClick();
                    },
                    child: Container(
                      width: 330,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.black),
                      child: Center(
                        child: Bigtext(
                          text: "Log In",
                          textsize: 26,
                          textcolor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 70.w),
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account,",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 17.sp),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Get.toNamed(RouteManger.get_sigUp_page()),
                              text: " SignUp",
                              style: GoogleFonts.inter(
                                  color:
                                      const Color.fromARGB(255, 211, 159, 17),
                                  fontSize: 17))
                        ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
