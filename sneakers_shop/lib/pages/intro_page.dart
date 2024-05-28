import 'package:flutter/material.dart';
import 'package:sneakers_shop/components/my_button.dart';
import 'package:sneakers_shop/pages/home_pages.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/nike.jpg",
              height: 260,
            ),
            const SizedBox(
              height: 100,
            ),
            //title
            const Text(
              "Just Do it",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            //subtitle
            const Text(
              "Brand new sneakers and custom kicks made with premium quality",
              style: TextStyle(fontSize: 15, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            //button
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const MyButton(
                  child: Text(
                "Shop Now",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
            )
          ],
        ),
      ),
    );
  }
}
