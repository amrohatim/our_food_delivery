import 'package:bug/constants.dart';
import 'package:bug/widgets/pageview_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Get.put(PageviewController());
    return GetBuilder<PageviewController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 22.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(0);
                  controller.setPage(0);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  width: 110.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: controller.page == 0
                          ? Mycolors.primarycolor
                          : Color(0xffEFF2F5),
                      borderRadius: BorderRadius.all(Radius.circular(12).w)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Icon(
                          Icons.home_filled,
                          color: controller.page == 0
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "HOME",
                        style: TextStyle(
                            color: controller.page == 0
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 13.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(1);
                  controller.setPage(1);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  width: 110.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: controller.page == 1
                          ? Mycolors.primarycolor
                          : Color(0xffEFF2F5),
                      borderRadius: BorderRadius.all(Radius.circular(12).w)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Icon(
                          Icons.history,
                          color: controller.page == 1
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                            color: controller.page == 1
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 13.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(2);
                  controller.setPage(2);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  width: 110.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: controller.page == 2
                          ? Mycolors.primarycolor
                          : Color(0xffEFF2F5),
                      borderRadius: BorderRadius.all(Radius.circular(12).w)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Icon(
                          CupertinoIcons.person_fill,
                          color: controller.page == 2
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: controller.page == 2
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 13.sp),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
