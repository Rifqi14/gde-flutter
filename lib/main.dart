import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatsapp/ui/screens/splash.dart';
import 'package:whatsapp/core/constant/constant.dart';
import 'package:whatsapp/core/controllers/user_controller.dart';
import 'package:whatsapp/core/utils/storage_util.dart';
void main() async {
  await GetStorage.init();
  Get.put(StorageUtils());
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'GDE Inventory',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Styles.primaryColor,
          primaryColor:  Styles.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      );
  }
}