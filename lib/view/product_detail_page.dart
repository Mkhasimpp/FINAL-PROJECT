import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product.dart';
import '../controller/cart_controller.dart';
import 'checkout_page.dart';

class ProductDetailPage extends StatelessWidget {

  final Product product;

  ProductDetailPage({super.key, required this.product});

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(product.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Image.network(
              product.image,
              height: 200,
            ),

            const SizedBox(height: 20),

            Text(
              product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(Icons.star, color: Colors.orange),

                const SizedBox(width: 5),

                Text(product.rating.rate.toString()),

              ],
            ),

            const SizedBox(height: 10),

            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              product.description,
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            Row(

              children: [

                Expanded(
                  child: ElevatedButton(

                    onPressed: () {

                      cartController.addToCart(product);

                      Get.snackbar(
                        "Added",
                        "Product added to cart",
                      );

                    },

                    child: const Text("Add to Cart"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(

                    onPressed: () {

                      cartController.addToCart(product);

                      Get.to(() => CheckoutPage());

                    },

                    child: const Text("Buy Now"),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}