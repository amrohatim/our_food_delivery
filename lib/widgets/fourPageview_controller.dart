// ignore_for_file: file_names

import 'package:get/get.dart';

class FourpageviewController extends GetxController {
  final _page = 0.obs;
  int get page => _page.value;
  void setPage(int index) {
    _page.value = index;

    update();
  }
}
