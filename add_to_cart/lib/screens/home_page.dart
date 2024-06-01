import 'package:add_to_cart/screens/body_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider In Flutter"),
      ),
      body: const BodyPage(),
    );
  }
}
