import 'package:dark_light_theme/components/item_tiles.dart';
import 'package:dark_light_theme/components/textfield_page.dart';
import 'package:dark_light_theme/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access to the shop
    List<Items> items = context.watch<CartProvider>().getItems();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        children: [
          //shop title
          const Text(
            "S H O P   H U B",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //shop subtitle
          Text(
            "Select from Top Quality Products at Unbeatable Prices, Just for You!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          const MyTextField(),
          const SizedBox(
            height: 40,
          ),
          //shop items
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Items item = items[index];
                  return ItemTiles(
                    items: item,
                  );
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          //logo
          const Center(
              child: Text(
            "S H O P   H U B",
            style: TextStyle(
                fontSize: 27, letterSpacing: 7, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
