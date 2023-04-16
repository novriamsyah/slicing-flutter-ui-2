import 'package:flutter/material.dart';
import 'package:login_animation/screens/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (BuildContext context) {
        var screenHeight = MediaQuery.of(context).size.height;
        return Onboarding(
          screenHeight: screenHeight,
        );
      }),
    );
  }
}
