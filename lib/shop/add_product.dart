import 'dart:io';

import 'package:bug/constants.dart';
import 'package:bug/server/data/controllers/product_controller.dart';
import 'package:bug/widgets/Reusable_Icon.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  ImagePicker imagePicker = ImagePicker();
  File? producPic;
  getimage() async {
    var xFile = await imagePicker.pickImage(source: ImageSource.gallery);

    producPic = File(xFile!.path);
    setState(() {});
  }

  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    ProductController prodcutControl = Get.find<ProductController>();
    ValueNotifier productnameNotifier = ValueNotifier(false);
    ValueNotifier descriptionNotifier = ValueNotifier(false);
    ValueNotifier priceNotifier = ValueNotifier(false);

    TextEditingController price = TextEditingController();
    TextEditingController description = TextEditingController();

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bigtext(text: "Add Food | Dish"),
            Divider(),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Upload Image",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            producPic == null
                ? InkWell(
                    onTap: () {
                      getimage();
                    },
                    child: Container(
                      width: 150.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(83, 150, 152, 157),
                          borderRadius: BorderRadius.all(Radius.circular(4).w)),
                      child: Center(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 35.r,
                        ),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      SizedBox(
                        width: 170,
                        height: 110,
                      ),
                      Container(
                        width: 150.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(producPic!.path))),
                            color: Color.fromARGB(83, 150, 152, 157),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4).w)),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            getimage();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Mycolors.primarycolor,
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              color: const Color.fromARGB(207, 255, 255, 255),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Product name",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            ValueListenableBuilder(
                valueListenable: productnameNotifier,
                builder: (context, child, value) {
                  return TextFormField(
                    onFieldSubmitted: (value) {
                      if (value == "") {
                        productnameNotifier.value = false;
                      }
                    },
                    onTap: () {
                      productnameNotifier.value = true;
                    },
                    cursorColor: Mycolors.primarycolor,
                    decoration: InputDecoration(
                        hintText: productnameNotifier.value == false
                            ? "e.g  Delcious pizza with cheese"
                            : "",
                        hintStyle: GoogleFonts.mali(
                            fontSize: 13.sp,
                            color: Color.fromARGB(193, 150, 152, 157)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Mycolors.primarycolor))),
                  );
                }),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Description",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 215.w,
              height: 70.h,
              padding: EdgeInsets.all(8).w,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(83, 150, 152, 157)),
                  borderRadius: BorderRadius.all(Radius.circular(8).w)),
              child: ValueListenableBuilder(
                  valueListenable: descriptionNotifier,
                  builder: (context, child, value) {
                    return TextFormField(
                      controller: description,
                      cursorColor: Color.fromARGB(193, 150, 152, 157),
                      maxLength: 300,
                      onFieldSubmitted: (value) {
                        if (value == "") {
                          descriptionNotifier.value = false;
                        }
                      },
                      onTap: () {
                        descriptionNotifier.value = true;
                      },
                      decoration: InputDecoration(
                          hintText: descriptionNotifier.value == false
                              ? "e.g  Brief Description"
                              : "",
                          hintStyle: GoogleFonts.mali(
                              fontSize: 13.sp,
                              color: Color.fromARGB(193, 150, 152, 157)),
                          border: InputBorder.none),
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Category",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            DropdownButton2<String>(
              dropdownStyleData: DropdownStyleData(
                  maxHeight: 300.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4).w),
                      color: Colors.white),
                  elevation: 4,
                  width: 200.w),
              hint: Text(
                "Select Category",
                style: GoogleFonts.mali(
                  fontSize: 14.sp,
                  color: Color.fromARGB(193, 150, 152, 157),
                ),
              ),
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              items: restaurantCategories
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.mali(
                        fontSize: 14.sp,
                        color: Color.fromARGB(235, 75, 75, 77)),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Price per unit",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 90.w,
                  height: 50.h,
                  padding: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(83, 150, 152, 157)),
                      borderRadius: BorderRadius.all(Radius.circular(4).w)),
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: priceNotifier,
                        builder: (context, child, value) {
                          return TextFormField(
                            keyboardType: TextInputType.number,
                            controller: price,
                            cursorColor: Color.fromARGB(193, 150, 152, 157),
                            onFieldSubmitted: (value) {
                              if (value == "") {
                                priceNotifier.value = false;
                              }
                            },
                            onTap: () {
                              priceNotifier.value = true;
                            },
                            decoration: InputDecoration(
                                hintText: priceNotifier.value == false
                                    ? "e.g 150"
                                    : "",
                                hintStyle: GoogleFonts.mali(
                                    fontSize: 14.sp,
                                    color: Color.fromARGB(193, 150, 152, 157)),
                                border: InputBorder.none),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 44.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(83, 150, 152, 157)),
                      borderRadius: BorderRadius.all(Radius.circular(4).w)),
                  child: Image.asset(
                    "assets/images/lira.png",
                    width: 15.w,
                    height: 15.h,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Quantity",
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    prodcutControl.quantity--;
                  },
                  onLongPress: () {
                    for (var i = 0; i < prodcutControl.quantity;) {
                      prodcutControl.quantity--;
                    }
                  },
                  child: ReuseableICon(
                    icon: Icons.remove,
                    size: 35,
                    iconsize: 12,
                    iconcolor: Colors.white,
                    backgcolor: Mycolors.primarycolor,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                GetBuilder<ProductController>(builder: (controller) {
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
                    prodcutControl.quantity++;
                  },
                  onLongPress: () {
                    prodcutControl.quantity = prodcutControl.quantity + 10;
                  },
                  child: ReuseableICon(
                    icon: Icons.add,
                    size: 35,
                    iconsize: 12,
                    backgcolor: Mycolors.primarycolor,
                    iconcolor: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Container(
                  width: 90.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5).w),
                      color: Colors.white,
                      border: Border.all(
                          color: Mycolors.primarycolor,
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignInside)),
                  child: Center(
                    child: Text(
                      "Publish",
                      style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          color: Mycolors.primarycolor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 120.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0.1),
                            color: const Color.fromARGB(255, 255, 255, 255))
                      ],
                      color: Color.fromARGB(193, 90, 90, 90),
                      borderRadius: BorderRadius.all(Radius.circular(5).w)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.store,
                        color: Colors.white,
                      ),
                      Text(
                        "Store only",
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 130.h,
            )
          ],
        ),
      ),
    );
  }
}
