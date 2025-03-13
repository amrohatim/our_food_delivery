// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContiner extends StatelessWidget {
  ProfileContiner(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.height = 72.0,
      this.width = 380.0});
  final IconData icon;
  final String title;
  final String subtitle;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(169, 168, 168, 168),
          width: 1.w,
        ),
        color: Color.fromARGB(118, 240, 245, 243),
        borderRadius: BorderRadius.circular(20).w,
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15).w,
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 25.sp,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffA8A8A8),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
