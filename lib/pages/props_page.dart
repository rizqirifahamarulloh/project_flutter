import 'package:flutter/material.dart';
import '../widgets/costum_drawer.dart';

class PropsPage extends StatelessWidget {

  final String name;
  final int age;
  final bool isActive;

  PropsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.isActive,
  });

  void showMessage(BuildContext context) {
    final snackBar = SnackBar(content: Text('Hello, $name!, Age $age'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Props Page')),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Age: $age', style: TextStyle(fontSize: 20)),
            Text(
              'Status: ${isActive ? "Yes" : "No"}',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),
            CounterButton(onPressed: () => showMessage(context)),
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final VoidCallback onPressed;

  CounterButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text('Show Message'));
  }
}