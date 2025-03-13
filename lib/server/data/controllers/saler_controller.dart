// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:bug/mainpage/update_saler_status_controller.dart';
import 'package:bug/models/saler_model.dart';
import 'package:bug/server/data/repos/saler_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalerController extends GetxController implements GetxService {
  final SalerRepo salerRepo;
  SalerController({
    required this.salerRepo,
  });
  late var _statuscode;
  int get statusCode => _statuscode;
  bool _loading = false;
  bool get loading => _loading;
  bool _isverified = false;
  bool get isverfied => _isverified;

  Future<List<Saler>> getSaler() async {
    final response = await salerRepo.getSaler();
    return (response.body as List).map((e) => Saler.fromJson(e)).toList();
  }

  Future<Response> createSaler(Saler saler) async {
    _loading = true;
    Response response = await salerRepo.createSaler(saler);

    if (response.status.hasError) {
      _statuscode = response.statusCode;
      _loading = false;
      update();
      return response;
    } else {
      _statuscode = response.statusCode;
      if (salerRepo.sharedPreferences.containsKey("salerid")) {
        salerRepo.sharedPreferences.setStringList('saler', []);

        salerRepo.sharedPreferences.remove('salerid');
        Get.find<UpdateSalerStatusController>().isSaler = false;

        _isverified = false;
      }
      salerRepo.sharedPreferences.setString("salerid", saler.id);

      verifySaler(saler.id);
      _loading = false;

      update();

      return response;
    }
  }

  Future<void> verifySaler(String id) async {
    Response response = await salerRepo.verifySaler(id);
    if (response.status.hasError) {
      _isverified = false;
      _statuscode = response.statusCode;
    } else {
      _statuscode = response.statusCode;
      if (response.body["verified"] == true) {
        Saler saler = Saler(
            id: id,
            restaurantName: response.body["name"],
            phoneNumber: response.body["phoneNumber"].toString(),
            email: response.body["email"],
            password: response.body["password"],
            img: "img",
            description: "description");
        salerRepo.saveUserInfo(saler);
        update();
        _isverified = true;
      }
    }
  }

  userInformaiton() {
    SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
    if (sharedPreferences.containsKey("saler")) {
      List<String> value = sharedPreferences.getStringList("saler")!;
      Saler saler = Saler(
        id: value[0],
        restaurantName: value[1],
        phoneNumber: value[2],
        email: value[3],
        password: value[4],
        img: value[5],
        description: value[6],
      );
      update();
      return saler;
    } else {
      return null;
    }
  }
}
