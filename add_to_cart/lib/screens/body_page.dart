// ignore_for_file: prefer_const_constructors

import 'package:add_to_cart/screens/item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [ReturnContainer(), ReturnContainer()],
      ),
    );
  }
}
