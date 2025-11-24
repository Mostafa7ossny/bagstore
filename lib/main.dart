import 'package:flutter/material.dart';
import 'package:learn/model/cart.dart';
import 'package:learn/screens/homescreen.dart';
import 'package:learn/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Splash()),
    );
  }
}
