import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm(
      {super.key, required this.controller, required this.hinttext});
  final TextEditingController controller;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      textInputAction: TextInputAction.next,
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)).w,
              borderSide: BorderSide(color: Colors.black))),
    );
  }
}
