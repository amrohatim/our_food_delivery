// ignore_for_file: must_be_immutable, duplicate_ignore, prefer_const_declarations, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mycolors {
  static const Map<String, dynamic> mymap = {
    'id': 1,
    'name': 'John Doe',
    'phone_number': '1234567890',
    'outgoing_products': [
      {
        'product_id': 1,
        'quantity': 2,
        'product_name': 'Product 1',
        'price': 100,
        'total_price': 200,
        'date': '2022-01-01',
        'resturant_name': 'Restaurant 1',
      },
      {
        'product_id': 2,
        'quantity': 3,
        'product_name': 'Product 2',
        'price': 150,
        'total_price': 450,
        'date': '2022-01-02',
        'resturant_name': 'Restaurant 2',
      },
    ],
  };
  // ignore: prefer_const_declarations
  static final Color primarycolor = const Color.fromARGB(255, 235, 159, 17);
  static final Color secondarycolor = const Color.fromARGB(255, 86, 90, 90);
  static final Color icon1color = const Color.fromARGB(197, 243, 226, 73);
  static final Color statusColorWaiting =
      const Color.fromARGB(255, 138, 137, 136);
  static final Color statusColorOnRoad =
      const Color.fromARGB(255, 224, 137, 49);
  static final Color statusColorDeliverd =
      const Color.fromARGB(255, 49, 224, 128);
  static final Color total = const Color.fromARGB(255, 255, 255, 255);
}

// ignore: must_be_immutable
class Bigtext extends StatelessWidget {
  Bigtext({super.key, this.textcolor, this.textsize = 20, required this.text});
  final String text;
  double textsize;
  Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
          fontSize: textsize.sp, color: textcolor, fontWeight: FontWeight.bold),
    );
  }
}

class Medtext extends StatelessWidget {
  Medtext({super.key, this.textcolor, this.textsize = 16, required this.text});
  final String text;
  double textsize;
  Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: textsize.sp, color: textcolor),
    );
  }
}

class Smalltext extends StatelessWidget {
  Smalltext(
      {super.key, this.textcolor, this.textsize = 14, required this.text});
  final String text;
  double textsize;
  Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(fontSize: textsize.sp, color: textcolor),
    );
  }
}

class AppContants {
  static const String APP_Name = "AmroFood";
  static const int App_Version = 1;
  static const String App_BaseUrl = "https://sell-skill.com/";
  static const String login = "api/endpoints/login";
  static const String logout = "api/endpoints/logout";
  static const String getSalerverifed = "api/endpoints/getSeller/";
  static const String registerSaler = "api/endpoints/sellerSignUp";
  static const String recommended_Product_Uri = "/api/v1/products/recommended";
  static const String drinks_uri = "/api/v1/products/drinks";
  static const String accesstoken = "Temporory_Token";
  static const String phone = "phone";
  static const String password = "password";
  static const String foodDesc =
      "This ice cream brand is a national favourite for a reason. They’re all about making dessert the main event, and with their indulgent flavours, the brand rarely under-delivers. And the same can be said about their catchy copy that places their interesting ingredient combinations centre stage. On their website, Ben & Jerry’s takes you on an action-led journey with their various ice cream product descriptions. Take a look at the food description example below. Ben & Jerry’s appeal to our instincts and the undeniable urge many of us have to gobble down our favourite treat. We – the reader – are the main character in this flavour story as the ice cream brand give us permission to indulge. ";
}

List<String> restaurantCategories = [
  "Appetizers/Starters",
  "Main Courses/Entrees",
  "Sandwiches/Burgers",
  "Pizza",
  "Sides",
  "Desserts",
  "Breakfast/Brunch",
  "Beverages",
  "Kids’ Menu",
  "Specials/Seasonal Dishes",
];
List<Map> salerfood = [
  {
    "owner_id": 1,
    "name": "food name1",
    'description': "description1",
    'price': "price1",
    'imageUrl': "assets/images/1.jpg",
    'category': "category1",
  },
  {
    "owner_id": 1,
    "name": "food name2",
    'description': "description2",
    'price': "price2",
    'imageUrl': "assets/images/2.jpg",
    'category': "category2",
  },
  {
    "owner_id": 1,
    "name": "food name3",
    'description': "description3",
    'price': "price3",
    'imageUrl': "assets/images/3.jpg",
    'category': "category3",
  },
  {
    "owner_id": 1,
    "name": "food name4",
    'description': "description4",
    'price': "price4",
    'imageUrl': "assets/images/4.jpg",
    'category': "category4",
  },
  {
    "owner_id": 1,
    "name": "food name5",
    'description': "description5",
    'price': "price5",
    'imageUrl': "assets/images/5.jpg",
    'category': "category5",
  }
];
