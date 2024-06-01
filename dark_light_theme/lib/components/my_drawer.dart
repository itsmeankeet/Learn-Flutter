import 'package:dark_light_theme/pages/intro_pages.dart';
import 'package:dark_light_theme/pages/view_cart.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  onTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IntroPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Image.asset(
                    "images/shopping.png",
                    height: 70,
                    width: 70,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "S H O P   H U B",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              )),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: Image.asset("images/home.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Image.asset("images/settings.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewCart()));
                },
                child: ListTile(
                  title: const Text("C A R T"),
                  leading: Image.asset("images/trolley.png"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: GestureDetector(
              onTap: () => onTap(context),
              child: ListTile(
                title: Text("L O G O U T"),
                leading: Image.asset("images/exit.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
