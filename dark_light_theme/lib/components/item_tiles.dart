import 'package:dark_light_theme/models/cart_provider.dart';
import 'package:dark_light_theme/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTiles extends StatelessWidget {
  final Items items;
  const ItemTiles({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    onTap(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Do you want to add item to the cart?"),
                actions: [
                  MaterialButton(
                      child: const Text("Yes"),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<CartProvider>().addToCart(items);
                      }),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No"),
                  )
                ],
              ));
    }

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        height: 400,
        width: 280,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //image
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.asset(
                            items.imagePath,
                          ))),
                  //imagename
                  Text(
                    items.name,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  //image description
                  Text(
                    items.imageDescription,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16),
                  ),
                ],
              ),
              //image price + add to cart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${items.price}",
                    style: TextStyle(
                        fontSize: 23,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                      onTap: () => onTap(context),
                      child: Image.asset("images/add-to-cart.png",
                          height: 40, width: 40)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
