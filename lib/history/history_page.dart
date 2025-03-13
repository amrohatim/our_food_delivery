import 'package:bug/constants.dart';
import 'package:bug/history/down.dart';
import 'package:bug/history/med.dart';
import 'package:bug/history/orderitem.dart';
import 'package:bug/history/upper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdelivered = true; // or set this dynamically based on some condition
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperHistory(),
          MedHistory(),
          OrderItem(
            animeStatus: "waiting",
            image: "assets/images/3.jpg",
            name: "Paracetamol",
            price: " 50",
            status: "Waiting ...",
            quantity: 2,
            statusimage: "assets/images/wait.png",
            statuscolor: Mycolors.statusColorWaiting,
          ),
          OrderItem(
            animeStatus: "onroad",
            image: "assets/images/2.jpg",
            name: "Soup",
            price: " 30",
            status: "on Road",
            quantity: 5,
            statusimage: "assets/images/motorbike.png",
            statuscolor: Mycolors.statusColorOnRoad,
          ),
          SizedBox(height: 30.h),
          if (isdelivered)
            Divider(
              color: Colors.grey.shade300,
              indent: 30.w,
              endIndent: 30.w,
            ),
          SizedBox(height: 15.h),
          OrderItem(
            animeStatus: "delivered",
            image: "assets/images/6.jpg",
            name: "Bread",
            price: " 20",
            status: "Delivered",
            quantity: 1,
            statusimage: "assets/images/received.png",
            statuscolor: Mycolors.statusColorDeliverd,
          ),
          SizedBox(
            height: 30.h,
          ),
          DownHistory()
        ],
      ),
    );
  }
}
