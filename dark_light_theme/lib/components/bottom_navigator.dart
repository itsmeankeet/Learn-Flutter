// ignore_for_file: must_be_immutable

import 'package:dark_light_theme/components/gbuttonprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigator extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavigator({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        gap: 10,
        textSize: 10.0,
        iconSize: 25,
        onTabChange: onTabChange,
        tabs: [
          MyGButton(text: "Home", icon: Icons.home),
          MyGButton(text: "Like", icon: Icons.favorite),
          MyGButton(text: "Cart", icon: Icons.shopping_bag),
          MyGButton(text: "Profile", icon: Icons.person),
        ]);
  }
}
