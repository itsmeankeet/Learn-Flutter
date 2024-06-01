import 'package:flutter/material.dart';
import 'package:dark_light_theme/components/bottom_navigator.dart';
import 'package:dark_light_theme/components/my_drawer.dart';
import 'package:dark_light_theme/pages/favourite.dart';
import 'package:dark_light_theme/pages/profile.dart';
import 'package:dark_light_theme/pages/shop_page.dart';
import 'package:dark_light_theme/pages/view_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  final List<Widget> _pages = [
    const ShopPage(),
    const Like(),
    const ViewCart(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    void onTabChange(int index) {
      setState(() {
        _selectedindex = index;
      });
    }

    void onTap(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ViewCart()),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: GestureDetector(
              onTap: () => onTap(context),
              child: Image.asset(
                "images/cart.png",
                color: Theme.of(context).colorScheme.inversePrimary,
                height: 30,
                width: 30,
              ),
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigator(onTabChange: onTabChange),
    );
  }
}
