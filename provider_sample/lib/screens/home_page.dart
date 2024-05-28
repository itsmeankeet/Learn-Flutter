import 'package:flutter/material.dart';
import 'package:provider_sample/screens/body_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sample Example"),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: BodyPage(),
    );
  }
}
