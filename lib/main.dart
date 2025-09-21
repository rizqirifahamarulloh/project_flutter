import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './pages/home_page.dart';
import 'counter_page.dart';
// import 'counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(create: (_) => CounterProvider(),
    return ProviderScope(
    child: MaterialApp(
      // home: SplashScreen(),
      // home: CounterPage(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
    )
    );
  }
}