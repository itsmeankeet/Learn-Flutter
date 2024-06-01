import 'package:dark_light_theme/models/cart_provider.dart';
import 'package:dark_light_theme/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final Items cart;
  const CartTile({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false);
    onTap(BuildContext context, Items items) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Confirm Delete"),
                actions: [
                  MaterialButton(
                      child: const Text("Yes"),
                      onPressed: () {
                        Navigator.pop(context);
                        context
                            .read<CartProvider>()
                            .removeFromCart(context, items);
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(cart.name),
          leading: Image.asset(cart.imagePath),
          trailing: GestureDetector(
            onTap: () => onTap(context, cart),
            child: SizedBox(
              height: 40,
              width: 80,
              child: Image.asset(
                "images/delete.png",
              ),
            ),
          ),
          subtitle: Text("\$ ${cart.price.toString()}"),
        ),
      ),
    );
  }
}
