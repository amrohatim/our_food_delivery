// ignore_for_file: implementation_imports

import 'package:bug/constants.dart';
import 'package:bug/models/saler_model.dart';
import 'package:bug/server/api/apiclient.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

class SalerRepo extends GetxService {
  late ApiClient apiClient;
  late SharedPreferences sharedPreferences;
  SalerRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getSaler() async {
    return await apiClient.get(AppContants.registerSaler);
  }

  Future<Response> createSaler(Saler saler) async {
    return await apiClient.post(AppContants.registerSaler, saler.toJson());
  }

  Future<List<String>> saveUserInfo(Saler saler) async {
    List<String> value = [];
    value.add(saler.id);
    value.add(saler.restaurantName);
    value.add(saler.phoneNumber);
    value.add(saler.email);
    value.add(saler.password);
    value.add(saler.img);
    value.add(saler.description);
    if (sharedPreferences.containsKey("saler")) {
      sharedPreferences.remove("saler");
    }
    await sharedPreferences.setStringList('saler', value);

    return value;
  }

  Future<Response> verifySaler(String id) async {
    return await apiClient.get(AppContants.getSalerverifed + id);
  }
}
