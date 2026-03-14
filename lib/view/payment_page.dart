import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/order_controller.dart';
import 'order_success_page.dart';

class PaymentPage extends StatelessWidget {

  final String paymentMethod;
  final String address;

  const PaymentPage({
    super.key,
    required this.paymentMethod,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {

    final cartController = Get.find<CartController>();
    final orderController = Get.find<OrderController>();

    double productTotal = 0;

    cartController.cartItems.forEach((product, qty) {
      productTotal += product.price * qty;
    });

    const double deliveryCharge = 5;
    double codCharge = paymentMethod == "COD" ? 2 : 0;

    double finalTotal = productTotal + deliveryCharge + codCharge;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Payment"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Delivery Address",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(address),

            const SizedBox(height: 25),

            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(paymentMethod),

            const SizedBox(height: 25),

            const Text(
              "Price Details",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(

                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Products Total"),
                        Text("\$${productTotal.toStringAsFixed(2)}"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Delivery Charge"),
                        Text("\$5"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    if (codCharge > 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Cash Handling Charge"),
                          Text("\$2"),
                        ],
                      ),

                    const Divider(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),

                        Text(
                          "\$${finalTotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  orderController.addOrder(
                      cartController.cartItems.keys.toList());

                  cartController.cartItems.clear();

                  Get.offAll(() => const OrderSuccessPage());

                },

                child: const Text("Confirm Payment"),
              ),
            )

          ],
        ),
      ),
    );
  }
}