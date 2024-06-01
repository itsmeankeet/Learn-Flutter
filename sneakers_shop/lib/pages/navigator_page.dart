// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigatorPage extends StatelessWidget {
  void Function(int)? onTabChange;
  NavigatorPage({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 214, 214, 214),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GNav(
                padding: EdgeInsets.all(14),
                backgroundColor: Color.fromARGB(255, 214, 214, 214),
                activeColor: Colors.white,
                tabBackgroundColor: Colors.black,
                gap: 10,
                tabMargin: EdgeInsets.symmetric(horizontal: 15),
                onTabChange: (value) => onTabChange!(value),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: "Shop",
                  ),
                  GButton(
                    icon: Icons.shopping_bag,
                    text: "Cart",
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
