import 'package:bug/history/upper.dart';
import 'package:bug/route/route_helper.dart';
import 'package:bug/widgets/profile_continer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperHistory(),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              "Profile",
              style:
                  GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ProfileContiner(
            icon: CupertinoIcons.person,
            title: "Account",
            subtitle: "Personal Information, Phone",
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RouteManger.signUp_page);
            },
            child: ProfileContiner(
                icon: Icons.add_business_outlined,
                title: "Register Restaurant",
                subtitle: "Register your restaurant"),
          ),
          SizedBox(
            height: 20.h,
          ),
          ProfileContiner(
              icon: CupertinoIcons.news,
              title: "Log In",
              subtitle: "Log in as a customer"),
          SizedBox(
            height: 20.h,
          ),
          ProfileContiner(
              icon: Icons.location_on_outlined,
              title: "Location",
              subtitle: "Set your location"),
          SizedBox(
            height: 20.h,
          ),
          ProfileContiner(
              icon: Icons.login_outlined,
              title: "Log Out",
              subtitle: "Log out from the app"),
        ],
      ),
    );
  }
}
