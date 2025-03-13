// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:bug/constants.dart';
import 'package:bug/models/saler_model.dart';
import 'package:bug/route/route_helper.dart';
import 'package:bug/server/data/controllers/saler_controller.dart';
// ignore: unused_import
import 'package:bug/server/data/repos/saler_repo.dart';
import 'package:bug/widgets/loading.dart';
import 'package:bug/widgets/text_form_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Uuid uuid = Uuid();

  void signUpClick() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      loading = true;
      setState(() {});
      var salerController = Get.find<SalerController>();
      await salerController.createSaler(Saler(
          id: uuid.v4(),
          restaurantName: nameController.text,
          phoneNumber: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          img: "img",
          description: "description"));
      if (salerController.statusCode == 200 ||
          salerController.statusCode == 201) {
        loading = false;
        setState(() {});
        Get.offNamed(RouteManger.verifypage);
      } else if (salerController.statusCode != 200) {
        int code = salerController.statusCode;
        String errorMessage = "";
        if (code == 500) {
          errorMessage = "Somethin wrong with the server";
        }
        if (code == 404) {
          errorMessage = "User not found";
        }
        if (code == 400) {
          errorMessage = "Bad Request";
        }
        if (code == 401) {
          errorMessage = "Unauthorized";
        }
        if (code == 503) {
          errorMessage = "Service Unavailable ";
        }
        loading = false;
        setState(() {});

        Get.snackbar(
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            "Failed",
            errorMessage);
      }
    } else {
      loading = false;
      setState(() {});
      Get.snackbar("Error", "Please fill all the fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: loading == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 190.w,
                      ),
                      child: Image.asset(
                        "assets/images/food.png",
                        scale: 2.r,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 10.h),
                      child: Text(
                        "Register, Your Resturant",
                        style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: 20.w, top: 40.h, right: 70.w),
                      child: Column(
                        children: [
                          MyTextForm(
                              controller: nameController,
                              hinttext: "Resturant Name"),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextForm(
                              controller: emailController, hinttext: "E-mail"),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextForm(
                              controller: passwordController,
                              hinttext: "Password"),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextForm(
                              controller: phoneController, hinttext: "Phone"),
                          SizedBox(
                            height: 35.h,
                          ),
                          InkWell(
                            onTap: () {
                              signUpClick();
                            },
                            child: Container(
                              width: 330,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.black),
                              child: Center(
                                child: Bigtext(
                                  text: "Sign Up",
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
                            padding: EdgeInsets.only(right: 63.w),
                            child: RichText(
                                text: TextSpan(
                                    text: "Already have an account,",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 17.sp),
                                    children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Get.toNamed(
                                            RouteManger.get_logIn_page()),
                                      text: " LogIn",
                                      style: GoogleFonts.inter(
                                          color: const Color.fromARGB(
                                              255, 241, 152, 18),
                                          fontSize: 17))
                                ])),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : Loading(),
        ));
  }
}
