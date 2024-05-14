// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

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
          backgroundColor: Colors.lightGreen[200],
          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            title: Text("My First App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            elevation: 0,
            leading: Icon(
              Icons.menu,
              size: 40,
              color: Colors.white,
            ),
          ),
          body: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15), right: Radius.circular(100)),
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Text("This is my heart for you",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            height: 5.0, //gives height
                          )),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 64,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(150),
                        right: Radius.circular(150)),
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Text("This is first container",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            height: 5.0, //gives height
                          )),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 64,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(100), right: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Text("This is my heart for you",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            height: 5.0, //gives height
                          )),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 64,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
