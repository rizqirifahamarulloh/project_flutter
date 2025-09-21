import 'package:flutter/material.dart';
import '../data/produk_data.dart';
import '../widgets/costum_drawer.dart';
import '../widgets/search_field.dart';
import '../widgets/produk_list.dart';
import '../widgets/add_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _allProducts = [];
  List<Map<String, dynamic>> _filteredProducts = [];
  void _addProduct(Map<String, dynamic> newProduct) {
    setState(() {
      _allProducts.add(newProduct);
      _filteredProducts = List.from(_allProducts);
    });
  }

  @override
  void initState() {
    super.initState();
    _allProducts = List.from(produkData);
    _filteredProducts = List.from(produkData);
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) =>
              product['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleFavorite(Map<String, dynamic> productToToggle) {
    setState(() {
      final productIndex = _allProducts.indexOf(productToToggle);
      if (productIndex != -1) {
        _allProducts[productIndex]['isFavorite'] = !productToToggle['isFavorite'];
      }
      final filteredProductIndex = _filteredProducts.indexOf(productToToggle);
      if (filteredProductIndex != -1) {
        _filteredProducts[filteredProductIndex]['isFavorite'] = !productToToggle['isFavorite'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Beranda'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          SearchField(onChanged: _updateSearchQuery),
          ProductList(
            products: _filteredProducts,
            onFavoritePressed: _toggleFavorite,
          )
        ],
      ),
      floatingActionButton: AddProductButton(onProductAdded: _addProduct),
    );
  }
}