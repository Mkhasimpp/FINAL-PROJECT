import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Product product = Get.arguments;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Product Details"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Image.network(
                product.image,
                height: 200,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 15),

            Text(product.description),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: (){
                  Get.snackbar(
                    "Cart",
                    "Added to cart",
                  );
                },

                child: const Text("Add to Cart"),
              ),

            )

          ],
        ),
      ),
    );
  }
}