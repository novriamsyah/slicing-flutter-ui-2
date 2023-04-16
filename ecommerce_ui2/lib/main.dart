import 'package:ecommerce_ui2/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff060606),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail-product': (context) => const ProductScreen(),
      },
    );
  }
}
