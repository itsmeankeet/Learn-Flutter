// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:navigator_app/pages/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: FirstPage());
  }
}
