import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controller/login_controller.dart';
import 'controller/cart_controller.dart';
import 'controller/product_controller.dart';
import 'controller/order_controller.dart';
import 'controller/theme_controller.dart';

import 'view/splash_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await GetStorage.init();

  runApp(const NexaApp());
}

class NexaApp extends StatelessWidget {

  const NexaApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Controllers
    Get.put(LoginController());
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(OrderController());
    Get.put(ThemeController());

    final ThemeController themeController = Get.find();

    return Obx(() => GetMaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Nexa Store",

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),

      darkTheme: ThemeData.dark(),

      themeMode:
      themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,

      home: const SplashPage(),
    ));
  }
}