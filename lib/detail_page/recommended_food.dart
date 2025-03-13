// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names

import 'package:bug/constants.dart';
import 'package:bug/widgets/Extend_text.dart';
import 'package:bug/widgets/Reusable_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedFood extends StatelessWidget {
  const RecommendedFood({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              titleSpacing: -30.w,
              toolbarHeight: 80,
              expandedHeight: 300.h,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(70.h),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          topRight: Radius.circular(20.w)),
                    ),
                    child: Center(
                        child: Bigtext(
                      text: "Name",
                      textsize: 26.sp,
                    )),
                  )),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  img,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ExtendeText(text: AppContants.foodDesc),
                )
              ],
            ))
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 50.w, right: 50.w, top: 10.h, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: ReuseableICon(
                      icon: Icons.remove,
                      size: 45,
                      iconsize: 26,
                      iconcolor: Colors.white,
                      backgcolor: Mycolors.primarycolor,
                    ),
                  ),
                  Bigtext(text: "\$ 10 " + " X " + 10.toString()),
                  InkWell(
                    onTap: () {
                      null;
                    },
                    child: ReuseableICon(
                      icon: Icons.add,
                      size: 45,
                      iconsize: 26,
                      backgcolor: Mycolors.primarycolor,
                      iconcolor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h, right: 8.w, left: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 120.h,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 236, 236),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40).w,
                      topRight: const Radius.circular(40).w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)).w),
                    child: Icon(
                      Icons.favorite,
                      size: 29.r,
                      color: Mycolors.primarycolor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 60.h,
                        width: 180.h,
                        decoration: BoxDecoration(
                            color: Mycolors.primarycolor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)).w),
                        child: Center(
                          child: Bigtext(
                            text: "Order Now",
                            textcolor: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
