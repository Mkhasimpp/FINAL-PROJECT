import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/product.dart';

class ProductController extends GetxController {

  var isLoading = true.obs;

  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {

    try {

      isLoading(true);

      final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
      );

      if (response.statusCode == 200) {

        var data = jsonDecode(response.body) as List;

        products.value =
            data.map((e) => Product.fromJson(e)).toList();

      }

    } finally {

      isLoading(false);

    }
  }
}