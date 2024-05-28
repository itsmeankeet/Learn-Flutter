import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Image.asset(
                "images/nike.jpg",
                height: 100,
              ),
              const Text(
                "Just Do it!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ))
        ],
      ),
    );
  }
}
