// ignore_for_file: deprecated_member_use

import 'package:bug/route/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    // Example restaurant data
    final restaurants = [
      {
        'name': 'MAX Stockholm - Hamngatan',
        'description': 'Pop på utvalda rätter!',
        'deliveryTime': '10-20 min',
        'imageUrl': 'assets/images/1.jpg',
        'freeDelivery': true,
      },
      {
        'name': 'Burger Place',
        'description': 'Tasty & Fresh!',
        'deliveryTime': '15-25 min',
        'imageUrl': 'assets/images/2.jpg',
        'freeDelivery': false,
      },
      {
        'name': 'Dessert House',
        'description': 'Sweet & Delightful',
        'deliveryTime': '20-30 min',
        'imageUrl': 'assets/images/3.jpg',
        'freeDelivery': false,
      },
    ];

    return ListView.separated(
      physics:
          const NeverScrollableScrollPhysics(), // so it doesn’t scroll separately
      shrinkWrap: true,
      itemCount: restaurants.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).w,
            ),
            elevation: 4,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant image
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteManger.get_rocmmended_food_detail(
                        restaurant['imageUrl'].toString()));
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: Image.asset(
                          restaurant['imageUrl'].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8.h,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4).w,
                          ),
                          child: Text(
                            restaurant['deliveryTime'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Restaurant name
                      Text(
                        restaurant['name'].toString(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // Description
                      Text(
                        restaurant['description'].toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // Row for "Free delivery" and delivery time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (restaurant['freeDelivery'] == true)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen[100],
                                borderRadius: BorderRadius.circular(4).w,
                              ),
                              child: const Text(
                                'Free delivery',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          Text(
                            restaurant['deliveryTime'].toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
