import 'package:bug/constants.dart';

import 'package:bug/widgets/fourPageview_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FourNavBar extends StatefulWidget {
  const FourNavBar({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<FourNavBar> createState() => _FourNavBarState();
}

class _FourNavBarState extends State<FourNavBar> {
  @override
  Widget build(BuildContext context) {
    Get.put(FourpageviewController());
    return GetBuilder<FourpageviewController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(0);
                  controller.setPage(0);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: 85.w,
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
                          size: 20.r,
                          Icons.home_filled,
                          color: controller.page == 0
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "HOME",
                        style: TextStyle(
                            color: controller.page == 0
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(1);
                  controller.setPage(1);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 85.w,
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
                          size: 20.r,
                          Icons.history,
                          color: controller.page == 1
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                            color: controller.page == 1
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(2);
                  controller.setPage(2);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 85.w,
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
                          size: 20.r,
                          Icons.restaurant_menu,
                          color: controller.page == 2
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "MyShop",
                        style: TextStyle(
                            color: controller.page == 2
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                onTap: () {
                  widget.pageController.jumpToPage(3);
                  controller.setPage(3);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 85.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      color: controller.page == 3
                          ? Mycolors.primarycolor
                          : Color(0xffEFF2F5),
                      borderRadius: BorderRadius.all(Radius.circular(12).w)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Icon(
                          size: 20.r,
                          CupertinoIcons.person_fill,
                          color: controller.page == 3
                              ? Colors.white
                              : Color(0xff171A1F),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: controller.page == 3
                                ? Colors.white
                                : Color(0xff171A1F),
                            fontSize: 12.sp),
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
