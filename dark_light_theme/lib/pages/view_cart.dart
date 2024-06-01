import 'package:dark_light_theme/components/cart_tile.dart';
import 'package:dark_light_theme/components/my_button.dart';
import 'package:dark_light_theme/models/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    var cartsItem = context.watch<CartProvider>().getCart();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 179, 136, 136),
        title: const Text("My Cart"),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: cartsItem.length,
              itemBuilder: (BuildContext context, int index) {
                final cartItem = cartsItem[index];
                return CartTile(
                  cart: cartItem,
                );
              }),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: MyButton(
              buttonName: "Pay Now",
              color: Theme.of(context).colorScheme.inversePrimary,
              child: Image.asset(
                "images/pay.png",
                color: Theme.of(context).colorScheme.secondary,
              ),
            )),
      ]),
    );
  }
}

class $ {}
