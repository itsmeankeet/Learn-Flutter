import 'package:flutter/material.dart';
import 'package:listview_builder/pages/home_page.dart';
import 'package:listview_builder/pages/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.grey.shade800,
          elevation: 0,
          title: const Text(
            "Employee List",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
        ),
        body: HomePage(),
        bottomNavigationBar: NavigationPage(),
      ),
    );
  }
}
