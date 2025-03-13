import 'package:bug/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownHistory extends StatelessWidget {
  DownHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          width: 377.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Color.fromARGB(162, 235, 159, 17),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
        ),
        Positioned(
          left: 40.w,
          top: 10.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Bigtext(
                text: "Total",
                textsize: 25.sp,
                textcolor: Mycolors.total,
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 90.w,
                child: Bigtext(
                  text: "10",
                  textsize: 21.sp,
                  textcolor: Mycolors.total,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 130.w,
          top: 10.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Bigtext(
                text: "Price",
                textsize: 25.sp,
                textcolor: Mycolors.total,
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 145.w,
                child: Bigtext(
                  text: "\$ 1,000,000",
                  textsize: 21.sp,
                  textcolor: Mycolors.total,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 30.w,
          top: 5.h,
          child: Image.asset("assets/images/foodcollection.png",
              width: 90.w, height: 90.h, fit: BoxFit.fill),
        ),
      ],
    );
  }
}
