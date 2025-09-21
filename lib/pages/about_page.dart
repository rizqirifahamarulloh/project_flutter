
import 'package:flutter/material.dart';
import '../widgets/costum_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      drawer: CustomDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aplikasi Jual Beli Elektronik',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selamat datang di aplikasi kami, platform terpercaya untuk jual beli produk elektronik berkualitas. Kami menyediakan berbagai macam barang elektronik mulai dari smartphone, laptop, hingga aksesoris pendukung lainnya dengan harga yang kompetitif.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
