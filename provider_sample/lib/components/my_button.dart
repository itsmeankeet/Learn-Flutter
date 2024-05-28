import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final String name;
  MyButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(136, 164, 162, 162),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
