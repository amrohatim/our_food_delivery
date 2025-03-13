// ignore_for_file: unnecessary_import

import 'package:bug/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController implements GetxService {
  int _quantity = 0;
  int get quantity => _quantity;
  set quantity(int quantity) {
    if (quantity >= 0) {
      _quantity = quantity;
      update();
    } else {
      Get.snackbar(
          backgroundColor: Colors.grey.shade700,
          colorText: Mycolors.primarycolor,
          "No quantity",
          "you cant 't reduce more");
    }

    update();
  }
}
