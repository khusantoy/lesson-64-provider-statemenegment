import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/models/product.dart';

class ProductsController {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone",
      color: Colors.teal,
      price: 250.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "MacBook",
      color: Colors.blue,
      price: 344.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "iPad",
      color: Colors.amber,
      price: 290.5,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }
}
