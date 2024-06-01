import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final String buttonName;
  final Color? color;
  const MyButton(
      {super.key,
      required this.child,
      required this.buttonName,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 15,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
