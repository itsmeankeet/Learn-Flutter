import 'package:dark_light_theme/models/view.dart';
import 'package:flutter/material.dart';

class Profiletile extends StatelessWidget {
  final ViewTile view;
  const Profiletile({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.primary,
      title: Text(
        view.title,
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(view.subtitle,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.inversePrimary)),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Image.asset(
          view.imageDescription,
          height: 31,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
