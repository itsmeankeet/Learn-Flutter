import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  const MyButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Center(child: child),
    );
  }
}
