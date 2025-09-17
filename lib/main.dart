import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stateless Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<String> items = ["Laptop", "Smartphone", "Tablet", "Smartwatch"];

  ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Barang')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.devices),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}

//deklarasi data menggunakan looping
class ProductScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"kode": "P001", "Laptop": "Harga: \$1000"},
    {"kode": "P002", "HP": "Harga: \$600"},
    {"kode": "P003", "Tablet": "Harga: \$400"},
  ];

  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Kode')),
            DataColumn(label: Text('Nama Barang')),
            DataColumn(label: Text('Harga')),
          ],
          rows: products
              .map(
                (product) => DataRow(
                  cells: [
                    DataCell(Text(product['kode'] ?? '')),
                    DataCell(Text(product.keys.firstWhere((k) => k != 'kode'))),
                    DataCell(
                      Text(
                        product.values.firstWhere((v) => v.contains('Harga')),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

//stateless widget dengan komponen
class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Laptop", 
      "price": "\$1000", 
      "isFavourite": false, 
      "image": "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=1772&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "HP", 
      "price": "\$600", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1598327105666-5b89351aff97?q=80&w=927&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",  
    },

    {
      "name": "Tablet",
      "price": "\$400", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1544244015-9c72fd9c866d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHRhYmxldHxlbnwwfHwwfHx8MA%3D%3D",
    },

    {
      "name": "Smartwatch", 
      "price": "\$200", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "Headphone", 
      "price": "\$150", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "Camera", 
      "price": "\$800", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "Speaker", 
      "price": "\$120", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1518441902114-3f1a0f0b3c8b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "Monitor", 
      "price": "\$300", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "Keyboard", 
      "price": "\$80", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1517331156700-3c241d2b4d83?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },

    {
      "name": "Mouse", 
      "price": "\$40", 
      "isFavourite": false,
      "image": "https://images.unsplash.com/photo-1587825140408-5b5c6f1d6eaf?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  void toggleFavorite(int index) {
  //setState adalah method untuk merubah state
    setState(() {
      products[index]['isFavourite'] = !products[index]['isFavourite'];
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk Belanja')),
      body: Column(
        children: [
          UIWidgetField(),
          HeaderWidget(),
          Expanded(
            // MENGGANTI ListView.builder MENJADI GridView.builder
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              // Konfigurasi untuk tampilan Grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom
                crossAxisSpacing: 8.0, // Jarak horizontal antar item
                mainAxisSpacing: 8.0, // Jarak vertikal antar item
                childAspectRatio: 0.75, // Rasio item (lebar banding tinggi)
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCart( // Menggunakan ProductCart yang sudah dimodifikasi
                  name: products[index]['name']!,
                  price: products[index]['price']!,
                  isFavourite: products[index]['isFavourite']!,
                  onFavouritePressed: () => toggleFavorite(index),
                  imageUrl: products[index]['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: const Color.fromARGB(255, 83, 176, 253),
      child: const Center(
        child: Text(
          'Selamat Datang di Toko Kami',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'poppins',
          ),
        ),
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  final String name;
  final String price;
  final bool isFavourite;
  final VoidCallback? onFavouritePressed;
  final String imageUrl;

  const ProductCart({
    Key? key,
    required this.name,
    required this.price,
    required this.isFavourite,
    required this.onFavouritePressed,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 50);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavouritePressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UIWidgetField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Masukan pencarian',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
