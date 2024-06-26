import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/controllers/cart_controller.dart';
import 'package:lesson_64_provider_statemenegment/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    print("Savatcha sahifasi ochildi");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("No available products"),
            )
          : ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = cartController.cart.products.values
                    .toList()[index]['product'];
                return ProductItem(product: product);
              }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          "Total price: \$${cartController.cart.totalPrice.toString()}",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
