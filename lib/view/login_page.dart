import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  final TextEditingController usernameController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Center(

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(25),

            child: Column(

              children: [

                /// App Icon
                Image.asset(
                  "assets/icons/app_icon.png",
                  height: 120,
                ),

                const SizedBox(height: 15),

                const Text(
                  "Nexa Store",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                /// Username
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                /// Password
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(

                    onPressed: () {

                      controller.login(
                        usernameController.text.trim(),
                        passwordController.text.trim(),
                      );

                    },

                    child: const Text("Login"),
                  ),
                ),

                const SizedBox(height: 20),

                const Text("OR"),

                const SizedBox(height: 20),

                /// Google Login
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(

                    icon: const Icon(Icons.login),

                    label: const Text("Login with Google"),

                    onPressed: () {

                      controller.googleLogin();

                    },

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}