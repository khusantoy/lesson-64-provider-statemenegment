import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/models/cart.dart';
import 'package:lesson_64_provider_statemenegment/models/product.dart';

class CartController extends ChangeNotifier {
  final Cart _cart = Cart(products: {}, totalPrice: 0);

  Cart get cart {
    return _cart;
  }

  void addToCart(Product product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    _cart.totalPrice += _cart.products[product.id]["product"].price;

    for (var pro in _cart.products.values) {
      print(pro['product'].title);
      print(pro['amount']);
    }

    notifyListeners();
  }
}
