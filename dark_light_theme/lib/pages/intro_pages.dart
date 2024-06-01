import 'package:dark_light_theme/pages/home_page.dart';
import 'package:dark_light_theme/pages/shop_page.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

class IntroPage extends StatelessWidget {
  //button after ontap in shop now
  void onTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ShopPage()));
  }

  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              "images/shopping.png",
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 300,
            ),
            const SizedBox(
              height: 40,
            ),
            //title
            const Text(
              "S H O P   H U B",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //subtitile
            Text(
              "All Your Favorite Stores in One Place",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 20,
            ),
            //button
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: MyButton(
                buttonName: "Shop Now",
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Image.asset(
                  "images/go.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
