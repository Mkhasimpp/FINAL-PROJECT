import 'package:get/get.dart';
import '../model/product.dart';

class OrderController extends GetxController {

  var orders = <Product>[].obs;

  void addOrder(List<Product> items) {

    orders.addAll(items);

  }

}