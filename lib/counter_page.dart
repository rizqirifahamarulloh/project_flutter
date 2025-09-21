import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:first_project_flutter/counter_riverpod.dart';


// class CounterPage extends StatefulWidget {
// @override
//   _CounterPageState createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

// class CounterPage extends StatelessWidget {
class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value:", style: TextStyle(fontSize: 24)),
            Text(
              '$counter',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).increment(),
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).decrement(),
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}