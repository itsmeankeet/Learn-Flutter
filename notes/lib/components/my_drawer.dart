import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String name;
  final String imageAddress;
  void Function()? onTap;

  MyDrawer(
      {super.key,
      required this.name,
      required this.imageAddress,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            imageAddress,
            height: 35,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          title: Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
        ));
  }
}
