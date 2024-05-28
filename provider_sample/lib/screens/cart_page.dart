import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers/movie_provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favouritelite = context.watch<MovieProvider>().favlist;
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourite Movies"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: favouritelite.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(
                    "Movie ${favouritelite[index]}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context
                          .read<MovieProvider>()
                          .removefav(favouritelite[index]);
                    },
                    child: Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ));
            }));
  }
}
