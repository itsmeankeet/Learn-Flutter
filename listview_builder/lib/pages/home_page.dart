// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:listview_builder/components/user.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List users = [
    User("Ankit Adhikari", "Developer", "images/ankit.jpg"),
    User("Eva Martinez", "Doctor", "images/1.jpg"),
    User("Alice Smith", "Designer", "images/2.jpg"),
    User("Bob Johnson", "Engineer", "images/3.jpg"),
    User("Carol Williams", "Manager", "images/4.jpg"),
    User("David Brown", "Teacher", "images/5.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.image),
              radius: 30,
            ),
            title: Text(
              user.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                  fontSize: 25),
            ),
            subtitle: Text(
              user.job,
              style: const TextStyle(color: Colors.white38, fontSize: 15),
            ),
            // You can add more widgets or customize the ListTile as needed
          );
        },
      ),
    ));
  }
}

/*
*/