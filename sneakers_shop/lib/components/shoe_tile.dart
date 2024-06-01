import 'package:flutter/material.dart';
import 'package:sneakers_shop/module/shoe.dart';

class ShoeTile extends StatelessWidget {
  void Function()? onTap;
  Shoe shoe;
  ShoeTile({super.key, required this.shoe, required Function()? this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //picture of shoe
            Image.asset(
              shoe.imagePath,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            //decription
            Text(
              shoe.imageDescription,
              style: const TextStyle(fontSize: 15, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            //name
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //price and add to cart
                    Text(
                      "\$${shoe.price}",
                      style:
                          const TextStyle(fontSize: 17, color: Colors.black45),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
