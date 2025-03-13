import 'package:bug/constants.dart';
import 'package:bug/mainpage/update_saler_status_controller.dart';
import 'package:bug/server/api/apiclient.dart';
import 'package:bug/server/data/controllers/product_controller.dart';
import 'package:bug/server/data/controllers/saler_controller.dart';
import 'package:bug/server/data/repos/saler_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(prefs);
  Get.put<ApiClient>(ApiClient(appbaseurl: AppContants.App_BaseUrl));
  Get.lazyPut<SalerRepo>(
      () => SalerRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut<SalerController>(() => SalerController(salerRepo: Get.find()));
  Get.lazyPut<ProductController>(() => ProductController());
  Get.lazyPut<UpdateSalerStatusController>(() => UpdateSalerStatusController());
}
