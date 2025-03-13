import 'package:bug/route/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Example category data
    final categories = [
      {
        'name': 'Burger',
        'places': 157,
        'imageUrl': 'assets/images/4.jpg',
      },
      {
        'name': 'Dessert',
        'places': 130,
        'imageUrl': 'assets/images/5.jpg',
      },
      {
        'name': 'Vegetarian',
        'places': 220,
        'imageUrl': 'assets/images/6.jpg',
      },
    ];

    return InkWell(
      child: SizedBox(
        height: 160.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: categories.length,
          separatorBuilder: (context, index) => SizedBox(width: 16.w),
          itemBuilder: (context, index) {
            final category = categories[index];
            return SizedBox(
              width: 120.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category image
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteManger.get_rocmmended_food_detail(
                            category['imageUrl'].toString()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8).w,
                        child: Image.asset(
                          category['imageUrl'].toString(),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Category name
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      category['name'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Number of places
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      '${category['places']} places',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
