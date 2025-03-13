import 'dart:math';

import 'package:bug/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItem extends StatefulWidget {
  const OrderItem(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.status,
      required this.statuscolor,
      required this.statusimage,
      required this.quantity,
      required this.animeStatus});
  final String image;
  final String name;
  final String price;
  final String status;
  final Color statuscolor;
  final String statusimage;
  final int quantity;
  final String animeStatus;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Reduced duration
      vsync: this,
    )..repeat();
    _offsetAnimation =
        Tween<double>(begin: 0.0, end: pi * 2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(22).w,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(28, 234, 212, 90),
              blurRadius: 50.0,
              spreadRadius: 0.0,
              offset: Offset(12, 26),
            ),
          ],
        ),
        width: 380.w,
        height: 103.h,
        child: Row(
          children: [
            Container(
              width: 67.9.w,
              height: 67.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16).w,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    widget.name,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    text: TextSpan(
                      text: "\$ ${widget.price} ",
                      style: GoogleFonts.poppins(
                        color: const Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "X ${widget.quantity}",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            color: Mycolors.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                AnimatedBuilder(
                  animation: _offsetAnimation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: widget.animeStatus == "onroad"
                          ? (Matrix4.identity()
                            ..setTranslationRaw(
                                _offsetAnimation.value * 6, 0, 0))
                          : widget.animeStatus == "waiting"
                              ? Matrix4.rotationZ(_offsetAnimation.value)
                              : Matrix4.identity(),
                      child: child,
                    );
                  },
                  child: Image.asset(
                    widget.statusimage,
                    width: 35.w,
                    height: 35.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: widget.statuscolor,
                    borderRadius: BorderRadius.circular(5).w,
                  ),
                  child: Text(
                    widget.status,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
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
