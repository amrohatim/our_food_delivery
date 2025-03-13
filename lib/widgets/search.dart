import 'package:bug/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 270.18.w,
      height: 52.79.h,
      decoration: BoxDecoration(
          color: Color(0xffEFF2F5),
          borderRadius: BorderRadius.all(Radius.circular(15).w)),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.search,
            size: 25.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextField(
              cursorColor: Mycolors.primarycolor,
              decoration: InputDecoration(
                hintText: "what do you want to order?",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromARGB(151, 150, 151, 151),
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
