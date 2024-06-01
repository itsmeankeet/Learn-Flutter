import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
        label: Text(
          "Search",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        suffixIcon: Image.asset(
          "images/search.png",
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
