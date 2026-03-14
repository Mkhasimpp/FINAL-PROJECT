import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/theme_controller.dart';

import '../model/product.dart';

import 'product_detail_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});

  final ProductController productController = Get.find();
  final CartController cartController = Get.find();
  final ThemeController themeController = Get.find();

  final TextEditingController searchController = TextEditingController();
  final RxString searchText = "".obs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Nexa Store"),

        actions: [

          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),

          Obx(() => Stack(
            children: [

              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(() => CartPage());
                },
              ),

              if (cartController.cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartController.cartCount.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 10),
                    ),
                  ),
                )
            ],
          )),

          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.to(() =>  ProfilePage());
            },
          )

        ],
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),

            child: TextField(

              controller: searchController,

              decoration: InputDecoration(
                hintText: "Search products",
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              onChanged: (value) {
                searchText.value = value.toLowerCase();
              },
            ),
          ),

          Expanded(

            child: Obx(() {

              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final filteredProducts = productController.products
                  .where((product) =>
                  product.title.toLowerCase().contains(searchText.value))
                  .toList();

              return GridView.builder(

                padding: const EdgeInsets.all(12),

                itemCount: filteredProducts.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: .70,
                ),

                itemBuilder: (context, index) {

                  Product product = filteredProducts[index];

                  return GestureDetector(

                    onTap: () {
                      Get.to(() => ProductDetailPage(product: product));
                    },

                    child: Card(

                      elevation: 5,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(10),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            Image.network(product.image, height: 100),

                            const SizedBox(height: 10),

                            Text(
                              product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 6),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                const SizedBox(width: 4),
                                Text(product.rating.rate.toString()),
                              ],
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}