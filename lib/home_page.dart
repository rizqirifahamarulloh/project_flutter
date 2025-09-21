import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Elektronik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const ProductGridPage(),
    );
  }
}

class ProductGridPage extends StatefulWidget {
  const ProductGridPage({Key? key}) : super(key: key);

  @override
  State<ProductGridPage> createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  // DIUBAH: Nama variabel diubah agar lebih jelas
  final List<Map<String, dynamic>> _allProducts = [
    {
      "name": "Laptop Pro",
      "price": "Rp 15.000.000",
      "image": "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFwdG9wfGVufDB8fDB8fHww",
      "isFavorite": false,
    },
    {
      "name": "Drone Pro",
      "price": "Rp 9.500.000",
      "image": "https://images.unsplash.com/photo-1507582020474-9a35b7d455d9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJvbmV8ZW58MHx8MHx8fDA%3D",
      "isFavorite": false,
    },
    {
      "name": "Smartwatch",
      "price": "Rp 3.000.000",
      "image": "https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c21hcnQlMjB3YXRjaHxlbnwwfHwwfHx8MA%3D%3D",
      "isFavorite": false,
    },
    {
      "name": "Tablet Plus",
      "price": "Rp 6.000.000",
      "image": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGFibGV0fGVufDB8fDB8fHww",
      "isFavorite": false,
    },
    {
      "name": "Kamera DSLR",
      "price": "Rp 8.000.000",
      "image": "https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtZXJhfGVufDB8fDB8fHww",
      "isFavorite": false,
    },
    {
      "name": "Headphone X",
      "price": "Rp 1.500.000",
      "image": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGVhZHBob25lfGVufDB8fDB8fHww",
      "isFavorite": false,
    },
    {
      "name": "Speaker Bluetooth",
      "price": "Rp 750.000",
      "image": "https://images.unsplash.com/photo-1594223456678-8d4c124c657a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ymx1ZXRvb3RoJTIwc3BlYWtlcnxlbnwwfHwwfHx8MA%3D%3D",
      "isFavorite": false,
    },
    {
      "name": "Smartphone X",
      "price": "Rp 7.000.000",
      "image": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bW9iaWxlJTIwcGhvbmV8ZW58MHx8MHx8fDA%3D",
      "isFavorite": false,
    },
    {
      "name": "Monitor 4K",
      "price": "Rp 5.000.000",
      "image": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9uaXRvcnxlbnwwfHwwfHx8MA%3D%3D",
      "isFavorite": false,
    },
    {
      "name": "Keyboard Mekanik",
      "price": "Rp 1.200.000",
      "image": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2V5Ym9hcmR8ZW58MHx8MHx8fDA%3D",
      "isFavorite": false,
    },
  ];

  // State untuk menampung hasil pencarian
  List<Map<String, dynamic>> _foundProducts = [];

  @override
  initState() {
    _foundProducts = _allProducts;
    super.initState();
  }

  // Memfilter produk favorit
  void toggleFavorite(Map<String, dynamic> productToToggle) {
    setState(() {
      productToToggle['isFavorite'] = !productToToggle['isFavorite'];
    });
  }

  // BARIS BARU: Fungsi untuk menjalankan logika filter
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allProducts;
    } else {
      results = _allProducts
          .where((product) => product["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Halaman Produk'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu Navigasi',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Beranda', style: TextStyle(color: Colors.black)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.blue),
              title: const Text('Keranjang', style: TextStyle(color: Colors.black)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text('Profil', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }
            ),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.blue),
              title: const Text('Counter Page', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterPage()), // Mengarah ke CounterPage
                );
              },
            ),
          ],
        ),
      ),
      // Column untuk menampung TextField dan GridView
      body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
      children: [
      // 1. Widget TextField untuk pencarian
      TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          labelText: 'Cari Produk',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),

      // 2. Widget untuk memberi jarak
      SizedBox(height: 20),

      // 3. Widget Expanded yang berisi GridView
      Expanded(
        child: _foundProducts.isNotEmpty
            ? GridView.builder(
                // ... (kode GridView Anda di sini, tidak perlu diubah)
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: _foundProducts.length,
                itemBuilder: (context, index) {
                  final product = _foundProducts[index];
                  // ... (Return ProductCard)
                  return ProductCard(
                    name: product['name'],
                    price: product['price'],
                    imageUrl: product['image'],
                    isFavorite: product['isFavorite'],
                    onFavoritePressed: () {
                      toggleFavorite(product);
                    },
                  );
                },
              )
            : const Center(
                child: Text(
                  'Produk tidak ditemukan',
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
    ], // Penutup children dari Column
  ), // Penutup Column
),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported,
                      size: 50, color: Colors.grey);
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
                      Text(name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(price,
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 14)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavoritePressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}