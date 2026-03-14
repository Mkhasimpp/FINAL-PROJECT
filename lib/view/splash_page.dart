import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {

      bool isLogged = box.read("login") ?? false;

      if (isLogged) {
        Get.offAll(() => HomePage());
      } else {
        Get.offAll(() => LoginPage());
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "assets/icons/app_icon.png",
              width: 120,
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome to Nexa Store",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )

          ],
        ),
      ),
    );
  }
}