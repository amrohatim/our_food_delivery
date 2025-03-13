import 'package:bug/constants.dart';
import 'package:bug/server/data/controllers/product_controller.dart';
import 'package:bug/widgets/Reusable_Icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    ProductController prodcutControl = Get.find<ProductController>();

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bigtext(text: "Storage"),
            Divider(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
                height: 620.h,
                child: ListView.builder(
                    itemCount: salerfood.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 225.h,
                        margin:
                            EdgeInsets.only(top: 8.h, bottom: 8, right: 4.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100.w,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10).w),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(salerfood[index]
                                                  ["imageUrl"]))),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            prodcutControl.quantity--;
                                          },
                                          onLongPress: () {
                                            for (var i = 0;
                                                i < prodcutControl.quantity;) {
                                              prodcutControl.quantity--;
                                            }
                                          },
                                          child: ReuseableICon(
                                            icon: Icons.remove,
                                            size: 30.r,
                                            iconsize: 12,
                                            iconcolor: Colors.white,
                                            backgcolor: Mycolors.primarycolor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        GetBuilder<ProductController>(
                                            builder: (controller) {
                                          return Text(
                                            controller.quantity.toString(),
                                            style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                fontSize: 15.sp),
                                          );
                                        }),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (prodcutControl.quantity < 99) {
                                              prodcutControl.quantity++;
                                            } else {
                                              Get.snackbar(
                                                  backgroundColor:
                                                      Colors.grey.shade700,
                                                  colorText:
                                                      Mycolors.primarycolor,
                                                  "You cant add more quantity",
                                                  "Quantity Greater than 100");
                                            }
                                          },
                                          onLongPress: () {
                                            if (prodcutControl.quantity < 90) {
                                              prodcutControl.quantity =
                                                  prodcutControl.quantity + 10;
                                            } else {
                                              Get.snackbar(
                                                  backgroundColor:
                                                      Colors.grey.shade700,
                                                  colorText:
                                                      Mycolors.primarycolor,
                                                  "You cant add more quantity",
                                                  "Quantity Greater than 100");
                                            }
                                          },
                                          child: ReuseableICon(
                                            icon: Icons.add,
                                            size: 30.r,
                                            iconsize: 12,
                                            backgcolor: Mycolors.primarycolor,
                                            iconcolor: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 8.w),
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              "100000",
                                              style: GoogleFonts.nunito(
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Image.asset(
                                              "assets/images/lira.png",
                                              width: 35.w,
                                              height: 35.h,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 130.w,
                                        child: Text(
                                            style: GoogleFonts.cairo(
                                                color: Mycolors.primarycolor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            salerfood[index]["name"])),
                                    Container(
                                        width: 130.w,
                                        height: 64.h,
                                        child: Text(
                                            style: GoogleFonts.robotoCondensed(
                                                color: Colors.grey.shade700,
                                                fontSize: 12),
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            "The steak is perfectly seared to a golden-brown crust, locking in its juicy tenderness. Each bite is bursting with rich, smoky flavors, enhanced by a buttery garlic glaze that melts into the meat. The aroma of roasted garlic and fresh herbs fills the air, making it irresistible.")),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    SizedBox(
                                        width: 122.w,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          "Pizza",
                                          style: GoogleFonts.robotoCondensed(
                                              fontWeight: FontWeight.w700),
                                        )),
                                    SizedBox(
                                      height: 44.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 70.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5).w),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Mycolors.primarycolor,
                                                  width: 1,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside)),
                                          child: Center(
                                            child: Text(
                                              "Publish",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 14.sp,
                                                  color: Mycolors.primarycolor,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: 50.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 0.1),
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255))
                                              ],
                                              color:
                                                  Color.fromARGB(246, 0, 0, 0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5).w)),
                                          child: Center(
                                            child: Text(
                                              "Delete",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 12.sp,
                                                  color: Mycolors.primarycolor,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
