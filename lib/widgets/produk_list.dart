import 'package:flutter/material.dart';
import '../widgets/produk_cart.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function(Map<String, dynamic>) onFavoritePressed;

  const ProductList(
      {super.key, required this.products, required this.onFavoritePressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 10.0, // Spasi horizontal
          mainAxisSpacing: 10.0, // Spasi vertikal
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            name: product['name'],
            price: product['price'],
            imageUrl: product['image'],
            isFavorite: product['isFavorite'],
            onFavoritePressed: () {
              onFavoritePressed(product);
            },
          );
        },
      ),
    );
  }
}
