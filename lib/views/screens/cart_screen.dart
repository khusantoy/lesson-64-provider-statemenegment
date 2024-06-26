import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/controllers/cart_controller.dart';
import 'package:lesson_64_provider_statemenegment/views/widgets/product_item.dart';

class CartScreen extends StatefulWidget {
  final CartController cartController;
  const CartScreen({super.key, required this.cartController});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    print("Savatcha sahifasi ochildi");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: widget.cartController.cart.products.isEmpty
          ? const Center(
              child: Text("No available products"),
            )
          : ListView.builder(
              itemCount: widget.cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = widget.cartController.cart.products.values
                    .toList()[index]['product'];
                return ProductItem(
                  product: product,
                  cartController: widget.cartController,
                );
              }),
    );
  }
}
