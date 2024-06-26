import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/controllers/products_controller.dart';
import 'package:lesson_64_provider_statemenegment/models/product.dart';
import 'package:lesson_64_provider_statemenegment/views/screens/cart_screen.dart';
import 'package:lesson_64_provider_statemenegment/views/widgets/create_product_dialog.dart';
import 'package:lesson_64_provider_statemenegment/views/widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final productsController = ProductsController();

  void _addProduct() async {
    final newProduct = await showDialog<Product>(
      context: context,
      builder: (ctx) => const CreateProductDialog(),
    );

    if (newProduct != null) {
      setState(() {
        productsController.createProduct(newProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: productsController.list.length,
          itemBuilder: (context, index) {
            final product = productsController.list[index];
            return ProductItem(
              product: product,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
