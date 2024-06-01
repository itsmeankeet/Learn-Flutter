// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/cart_tile.dart';
import 'package:sneakers_shop/module/cart.dart';
import 'package:sneakers_shop/module/shoe.dart';

class ShowCart extends StatelessWidget {
  void onTap(index) {}
  const ShowCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Cart",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.getUserCart().length,
                        itemBuilder: (BuildContext context, int index) {
                          Shoe individualShoe = value.getUserCart()[index];
                          return CartTile(shoe: individualShoe);
                        }),
                  )
                ],
              ),
            ));
  }
}
