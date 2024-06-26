import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/controllers/cart_controller.dart';
import 'package:lesson_64_provider_statemenegment/models/product.dart';

class ProductItem extends StatefulWidget {
  final CartController cartController;
  final Product product;

  const ProductItem(
      {super.key, required this.product, required this.cartController});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: widget.product.color,
      ),
      title: Text(
        widget.product.title,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: IconButton(
        onPressed: () {
          widget.cartController.addToCart(widget.product);
        },
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
