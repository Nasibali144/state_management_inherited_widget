import 'package:flutter/material.dart';
import 'package:state_management_inherited_widget/models/product_model.dart';

class ProductService extends InheritedWidget {
  ProductService({super.key, required super.child});

  final List<Product> orders = [];

  static ProductService of(BuildContext context) {
    ProductService? productService = context.dependOnInheritedWidgetOfExactType<ProductService>();
    return productService!;
  }

  @override
  bool updateShouldNotify(ProductService oldWidget) {
    return orders != oldWidget.orders;
  }

  void addProduct(Product product) {
    orders.add(product);
  }

  void removeProduct(Product product) {
    orders.remove(product);
  }
}