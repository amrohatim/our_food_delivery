// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableICon extends StatelessWidget {
  ReuseableICon(
      {super.key,
      required this.icon,
      this.iconcolor = const Color(0xff756d54),
      this.backgcolor = const Color.fromARGB(214, 252, 244, 228),
      this.size = 40,
      this.iconsize = 18});
  final IconData icon;
  final Color iconcolor;
  final Color backgcolor;
  final double size;
  final int iconsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.h,
      width: size.w,
      decoration: BoxDecoration(
          color: backgcolor,
          borderRadius: BorderRadius.all(Radius.circular(size / 2)).w),
      child: IconButton(
          onPressed: null,
          icon: Icon(
            icon,
            color: iconcolor,
            size: iconsize.r,
          )),
    );
  }
}
