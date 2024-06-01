import 'package:dark_light_theme/components/profileTile.dart';
import 'package:dark_light_theme/models/cart_provider.dart';
import 'package:dark_light_theme/models/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the list
    List<ViewTile> views = context.read<CartProvider>().getView();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage("images/5.jpg"),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Hello I am Ankit Adhikari. Now I am well experinced in Flutter. Connect with me through my social media network.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 2,
                    spreadRadius: 6,
                  ),
                ],
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                children: views.map((view) => Profiletile(view: view)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
