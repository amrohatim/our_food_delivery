import 'package:get/get.dart';

class PageviewController extends GetxController {
  final _page = 0.obs;
  int get page => _page.value;
  void setPage(int index) {
    _page.value = index;

    update();
  }
}
