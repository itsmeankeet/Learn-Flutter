// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:page_navigator/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "First Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [Icon(Icons.home), Icon(Icons.person)],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Tap me to visit in next page",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
