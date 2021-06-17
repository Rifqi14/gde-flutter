import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:whatsapp/core/models/user_model.dart';
import 'package:whatsapp/core/services/user_service.dart';
import 'package:whatsapp/core/utils/dialog_util.dart';
import 'package:whatsapp/core/utils/storage_util.dart';
import 'package:whatsapp/ui/screens/home.dart';
import 'package:whatsapp/ui/screens/login.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  UserModel user;
  var _userService = UserService();
  @override
  void onInit() async {
    super.onInit();
    if (StorageUtils.to.token != null) {
      await getUser();
      if (user?.name != null) {
         Get.offAll(() => HomeScreen());
      }
    }else{
      nosession();
    }
  }
  Future<void> nosession() async {
    Future.delayed(
      Duration(milliseconds: 1500),
      () => Get.offAll(() => LoginScreen()),
    );
  }
  Future getUser() async {
    user = await _userService.me();
  }

  Future login({
    @required String phone,
    @required String password,
  }) async {
    DialogUtils.showLoading('Login...');
    dio.Response res = await _userService.login(phone, password);
    //* Throw errors
    if (res.statusCode >= 400) {
      DialogUtils.showInfo(res.data['errors'].toString(), closePreDialog: true);
      return;
    }

    if (res?.statusCode == 200) {
      //* Save token
      var token = res.data['access_token'];
      StorageUtils.to.saveToken(token);

      await getUser();
      Get.offAll(() => HomeScreen());
    } else {
      DialogUtils.showWarning(res.data['errors'], closePreDialog: true);
      return;
    }
  }
  void logout() async {
    DialogUtils.showChoose('Are you sure you want to exit this application?', 'Yes', onClick: () async {
      // stop cron
      await StorageUtils.to.storage.erase();
      Get.offAll(() => LoginScreen());
    });
  }
}