import 'package:bug/constants.dart';
import 'package:bug/models/saler_model.dart';
import 'package:bug/server/data/controllers/saler_controller.dart';
import 'package:bug/shop/add_product.dart';
import 'package:bug/shop/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final PageController _pageController = PageController();

  String timeImage = "assets/images/sun.png";
  String gettime() {
    var now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      setState(() {
        timeImage = "assets/images/sun.png";
      });
      return "Good Morning!";
    } else if (hour >= 12 && hour < 16) {
      setState(() {
        timeImage = "assets/images/sunsets.png";
      });
      return "Good Afternoon!";
    } else if (hour >= 16 && hour < 20) {
      setState(() {
        timeImage = "assets/images/evening.png";
      });
      return "Good Evening!";
    } else {
      setState(() {
        timeImage = "assets/images/night.png";
      });
      return "Good Night!";
    }
  }

  int page = 0;
  @override
  void initState() {
    super.initState();

    gettime();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late Saler saler;
    if (Get.find<SalerController>().userInformaiton() != null) {
      saler = Get.find<SalerController>().userInformaiton();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 140.w,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20).w,
                      bottomRight: Radius.circular(20).w,
                    ),
                    color: Color(0xff36393F),
                    border: Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).w,
                              image: DecorationImage(
                                image: AssetImage(timeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(gettime(),
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 14.sp,
                                  color: Color(0xff96989D),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h, right: 10.w),
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50).w,
                          image: DecorationImage(
                            image: AssetImage('assets/images/man.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xff96989D),
                                size: 18.r,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: 102.w,
                                child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    saler.restaurantName,
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 16.sp,
                                        color: Color(0xff96989D),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(
                                size: 18.r,
                                Icons.email,
                                color: Color(0xff96989D),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Text(saler.email.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 12.sp,
                                        color: Color(0xff96989D),
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(
                                size: 18.r,
                                Icons.verified,
                                color: Color(0xff96989D),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(saler.id.toString().substring(00, 12),
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 12.sp,
                                      color: Color(0xff96989D),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Divider(
                            color: Color(0xff96989D),
                            thickness: 0.5.h,
                            endIndent: 10.w,
                            indent: 3.w,
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 100.w,
                            child: Text('Dashboard',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    color: Color(0xff96989D),
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 30.h),
                          InkWell(
                            onTap: () {
                              page = 0;
                              setState(() {});
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInSine);
                            },
                            child: Container(
                              width: 120.w,
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: page == 1
                                      ? const Color.fromARGB(255, 223, 221, 221)
                                      : Mycolors.primarycolor,
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(6).w,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.add,
                                      color: page == 1
                                          ? const Color.fromARGB(
                                              255, 223, 221, 221)
                                          : Mycolors.primarycolor,
                                      size: 22.r),
                                  SizedBox(width: 5.w),
                                  Text('Add Food',
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        color: page == 1
                                            ? const Color.fromARGB(
                                                255, 223, 221, 221)
                                            : Mycolors.primarycolor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          InkWell(
                            onTap: () {
                              page = 1;
                              setState(() {});
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInSine);
                            },
                            child: Container(
                              width: 120.w,
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: page == 0
                                      ? const Color.fromARGB(255, 223, 221, 221)
                                      : Mycolors.primarycolor,
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(6).w,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.store,
                                      color: page == 0
                                          ? const Color.fromARGB(
                                              255, 223, 221, 221)
                                          : Mycolors.primarycolor,
                                      size: 22.r),
                                  SizedBox(width: 5.w),
                                  Text('Storage',
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        color: page == 0
                                            ? const Color.fromARGB(
                                                255, 223, 221, 221)
                                            : Mycolors.primarycolor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          Center(
                            child: Icon(Icons.logout,
                                size: 60.r, color: Color(0xff96989D)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 23.w),
                            child: Text('logout',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 18.sp,
                                    color: Color(0xff96989D),
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 140.w,
                  height: MediaQuery.sizeOf(context).height - 70,
                  color: Colors.white,
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    children: [AddFood(), StoragePage()],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
