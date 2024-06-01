import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/shoe_tile.dart';
import 'package:sneakers_shop/module/cart.dart';
import 'package:sneakers_shop/module/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  addShoeonCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addCartToItem(shoe);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully Added"),
              content: Text("Check your cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Search",
                        suffixIcon: const Icon(Icons.search)),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Everyone flies, but some spread their wings longer than others.",
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hot Picks🔥",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.getShoe().length,
                          itemBuilder: (BuildContext context, int index) {
                            Shoe shoe = value.getShoe()[index];
                            return ShoeTile(
                              shoe: shoe,
                              onTap: () {
                                addShoeonCart(shoe);
                              },
                            );
                          })),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ));
  }
}
