import 'product.dart';

class Order {

  final List<Product> products;
  final double total;
  final DateTime date;

  Order({
    required this.products,
    required this.total,
    required this.date,
  });

}