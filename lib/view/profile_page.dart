import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/login_controller.dart';
import 'order_history_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final LoginController controller = Get.find();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {

    String name = box.read("name") ?? "User";
    String email = box.read("email") ?? "";
    String photo = box.read("photo") ?? "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 30),

            /// Profile Image
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              backgroundImage:
              photo.isNotEmpty ? NetworkImage(photo) : null,
              child: photo.isEmpty
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),

            const SizedBox(height: 15),

            /// Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            /// Email
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            /// Order History Button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.history),
                label: const Text("Order History"),

                onPressed: () {
                  Get.to(() => OrderHistoryPage());
                },
              ),
            ),

            const SizedBox(height: 15),

            /// Logout Button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),

                onPressed: () {
                  controller.logout();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}