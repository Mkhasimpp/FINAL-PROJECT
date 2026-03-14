import 'package:get/get.dart';
import '../model/product.dart';

class OrderHistoryController extends GetxController {

  var orders = <Product>[].obs;

  void addOrder(Product product) {

    orders.add(product);

  }

}