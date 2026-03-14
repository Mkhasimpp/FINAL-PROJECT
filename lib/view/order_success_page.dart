import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'order_history_page.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                "assets/gif/success.gif",
                width: 220,
              ),

              const SizedBox(height: 30),

              const Text(
                "Order Placed Successfully!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Thank you for shopping with Nexa Store.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    Get.offAll(() => HomePage());

                  },

                  child: const Text("Continue Shopping"),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton(

                  onPressed: () {

                    Get.to(() => OrderHistoryPage());

                  },

                  child: const Text("View Order History"),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}