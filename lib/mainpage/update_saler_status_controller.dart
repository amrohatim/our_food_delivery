import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateSalerStatusController extends GetxController {
  SharedPreferences shared = Get.find();

  bool _isSaler = false;
  bool get isSaler => _isSaler;

  set isSaler(bool isSaler) {
    _isSaler = isSaler;
    update();
  }

  @override
  void onInit() {
    if (shared.getStringList('saler') != []) {
      _isSaler = true;
      update();
    }
    super.onInit();
  }
}
