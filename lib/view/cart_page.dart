import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Cart"),
      ),

      body: Obx(() {

        final items = cartController.cartItems.entries.toList();

        if (items.isEmpty) {
          return const Center(child: Text("Cart is empty"));
        }

        return ListView.builder(

          itemCount: items.length,

          itemBuilder: (context, index) {

            final product = items[index].key;
            final qty = items[index].value;

            return Card(
              margin: const EdgeInsets.all(10),

              child: ListTile(

                leading: Image.network(product.image, width: 50),

                title: Text(product.title),

                subtitle: Text("\$${product.price}"),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [

                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                    ),

                    Text(qty.toString()),

                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cartController.addToCart(product);
                      },
                    ),

                  ],
                ),
              ),
            );
          },
        );
      }),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),

        child: ElevatedButton(

          onPressed: () {

            Get.to(() => CheckoutPage());

          },

          child: const Text("Place Order"),
        ),
      ),
    );
  }
}