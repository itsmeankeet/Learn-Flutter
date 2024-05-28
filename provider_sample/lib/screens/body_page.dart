import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/components/my_button.dart';
import 'package:provider_sample/providers/movie_provider.dart';
import 'package:provider_sample/screens/cart_page.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProvider>().favlist;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    "Movie $index",
                    style: const TextStyle(fontSize: 40),
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        if (!fav.contains(index)) {
                          context.read<MovieProvider>().addtoList(index);
                        } else {
                          context.read<MovieProvider>().removefav(index);
                        }
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 40,
                        color: fav.contains(index) ? Colors.red : Colors.grey,
                      )),
                );
              }),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: MyButton(name: "Show All favourite Movies"))
      ],
    );
  }
}
