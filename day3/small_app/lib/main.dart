// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: true,
          leading: Icon(Icons.menu, color: Colors.white, size: 25),
          title: Text(
            "Second App",
            style: TextStyle(
                color: Colors.white,
                wordSpacing: 3,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  "This is my second try",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 5,
                      color: Colors.white),
                ),
                Icon(
                  Icons.favorite,
                  size: 64,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
