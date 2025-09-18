import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('Kembali ke Halaman Pertama')),
      ),
    );
  }
}