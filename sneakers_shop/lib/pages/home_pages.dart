import 'package:flutter/material.dart';
import 'package:sneakers_shop/pages/drawer.dart';
import 'package:sneakers_shop/pages/navigator_page.dart';
import 'package:sneakers_shop/pages/shop_page.dart';
import 'package:sneakers_shop/pages/show_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  void navigateButtonBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const ShowCart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      drawer: const DrawerPage(),
      body: _pages[_selectedindex],
      bottomNavigationBar: NavigatorPage(
        onTabChange: (index) => navigateButtonBar(index),
      ),
    );
  }
}
