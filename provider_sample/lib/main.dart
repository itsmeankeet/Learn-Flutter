import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers/movie_provider.dart';
import 'package:provider_sample/screens/home_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => MovieProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
