import 'package:flutter/material.dart';
import 'package:sneakers_shop/pages/drawer.dart';
import 'package:sneakers_shop/pages/navigator_page.dart';
import 'package:sneakers_shop/pages/shop_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      drawer: const DrawerPage(),
      body: const ShopPage(),
      bottomNavigationBar: const NavigatorPage(),
    );
  }
}
