import 'package:flutter/material.dart';
import 'package:lesson_64_provider_statemenegment/controllers/cart_controller.dart';
import 'package:lesson_64_provider_statemenegment/controllers/products_controller.dart';
import 'package:lesson_64_provider_statemenegment/models/product.dart';
import 'package:lesson_64_provider_statemenegment/views/widgets/edit_product_dialog.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void _editProduct(Product product) async {
    final updatedProduct = await showDialog<Product>(
      context: context,
      builder: (ctx) => EditProductDialog(product: product),
    );

    if (updatedProduct != null) {
      setState(() {
        final productsController =
            Provider.of<ProductsController>(context, listen: false);
        productsController.updateProduct(updatedProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _editProduct(widget.product),
      leading: CircleAvatar(
        backgroundColor: widget.product.color,
      ),
      title: Text(
        widget.product.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(widget.product.price.toString()),
      trailing: IconButton(
        onPressed: () {
          final cartController =
              Provider.of<CartController>(context, listen: false);
          cartController.addToCart(widget.product);
        },
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
