import 'package:bug/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 370.h, left: 133),
      child: Column(
        children: [
          Image.asset(
            "assets/images/anime.gif",
            width: 120,
          ),
          Text(
            "Loading",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Mycolors.primarycolor),
          )
        ],
      ),
    );
  }
}
