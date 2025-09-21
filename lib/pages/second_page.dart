import 'package:flutter/material.dart';
import '../widgets/costum_drawer.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Page'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('Kembali ke Halaman Pertama')),
      ),
    );
  }
}

