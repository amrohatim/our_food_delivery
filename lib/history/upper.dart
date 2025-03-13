import 'package:bug/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpperHistory extends StatelessWidget {
  const UpperHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Image.asset("assets/images/up.png"),
        ),
        Positioned(
          left: 20.w,
          top: 20.h,
          child: Column(
            children: [
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "HI ,",
                    style: GoogleFonts.nunito(
                      color: Color(0xff000000),
                      fontSize: 20.sp,
                    ),
                  ),
                  TextSpan(
                    text: "Awab Ahmed",
                    style: GoogleFonts.nunito(
                      color: Color(0xff000000),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child:
                        Icon(Icons.location_on, color: Mycolors.primarycolor),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "From ,",
                        style: GoogleFonts.nunito(
                          color: Color(0xff000000),
                          fontSize: 15.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Nicosia",
                        style: GoogleFonts.nunito(
                          color: Mycolors.primarycolor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 48.5.w,
          top: 26.h,
          child: Icon(
            Icons.notifications_outlined,
            color: Mycolors.primarycolor,
            size: 25.sp,
          ),
        )
      ],
    );
  }
}
