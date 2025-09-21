import 'package:flutter/material.dart';
import '../pages/add_product_page.dart';

class AddProductButton extends StatelessWidget {
  final Function(Map<String, dynamic>) onProductAdded;

  const AddProductButton({super.key, required this.onProductAdded});

  void _navigateToAddProductPage(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage(onAddProduct: onProductAdded)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _navigateToAddProductPage(context),
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}