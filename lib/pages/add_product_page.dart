import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddProduct;

  const AddProductPage({super.key, required this.onAddProduct});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = {
        'name': _nameController.text,
        'price': _priceController.text,
        'description': _descriptionController.text,
        'image': _imageUrlController.text,
        'isFavorite': false,
      };
      widget.onAddProduct(newProduct);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Produk'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
                              TextFormField(
                                controller: _priceController,
                                decoration: const InputDecoration(labelText: 'Harga'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Harga tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(labelText: 'Deskripsi'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Deskripsi tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'URL Gambar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL Gambar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
