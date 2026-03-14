import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_controller.dart';

class OrderHistoryPage extends StatelessWidget {

  OrderHistoryPage({super.key});

  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Order History"),
      ),

      body: Obx(() {

        if (orderController.orders.isEmpty) {
          return const Center(
            child: Text("No Orders Yet"),
          );
        }

        return ListView.builder(

          itemCount: orderController.orders.length,

          itemBuilder: (context, index) {

            final order = orderController.orders[index];

            return Card(
              margin: const EdgeInsets.all(10),

              child: ListTile(

                leading: Image.network(
                  order.image,
                  width: 50,
                ),

                title: Text(order.title),

                subtitle: Text("\$${order.price}"),

              ),
            );
          },
        );
      }),
    );
  }
}