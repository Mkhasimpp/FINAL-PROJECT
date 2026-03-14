import 'package:get/get.dart';
import '../model/product.dart';

class CartController extends GetxController {

  var cartItems = <Product, int>{}.obs;

  void addToCart(Product product) {

    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }

  }

  void removeFromCart(Product product) {

    if (!cartItems.containsKey(product)) return;

    if (cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }

  }

  int get cartCount =>
      cartItems.values.fold(0, (sum, item) => sum + item);
}