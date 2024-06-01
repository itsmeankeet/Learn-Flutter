import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/module/cart.dart';
import 'package:sneakers_shop/module/shoe.dart';

class CartTile extends StatefulWidget {
  final Shoe shoe;
  const CartTile({super.key, required this.shoe});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  void removeItem() {
    Provider.of<Cart>(context, listen: false).removeFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          tileColor: Colors.grey.shade200,
          title: Text(widget.shoe.name),
          trailing: GestureDetector(
            onTap: removeItem,
            child: SizedBox(
                width: 50,
                child: Image.asset(
                  "images/trash-bin.png",
                  gaplessPlayback: true,
                  height: 35,
                  width: 10,
                )),
          ),
          leading: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade400),
              child: Image.asset(widget.shoe.imagePath)),
          subtitle: Text("Price \$ ${widget.shoe.price.toString()}"),
        ),
      ],
    );
  }
}
