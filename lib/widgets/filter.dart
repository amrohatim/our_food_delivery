import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 57.w,
        height: 52.79.h,
        padding: EdgeInsets.all(10).w,
        decoration: BoxDecoration(
            color: Color(0xffEFF2F5),
            borderRadius: BorderRadius.all(Radius.circular(15).w)),
        child: Image.asset("assets/images/Filter.png"),
      ),
    );
  }
}
