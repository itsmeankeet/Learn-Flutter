import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/module/cart.dart';
import 'package:sneakers_shop/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.white,
              body: IntroPage(),
            )));
  }
}
