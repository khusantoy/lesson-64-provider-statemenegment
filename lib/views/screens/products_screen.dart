import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/controllers/products_controller.dart';
import 'package:lesson_64_provider_statemenegment/models/product.dart';
import 'package:lesson_64_provider_statemenegment/views/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return const ProductItem();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
