import 'package:flutter/material.dart';
import 'package:navigator_app/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("This is my first page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              //navigate to second page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondPage()));
            },
            child: const Text("Go to second page")),
      ),
    );
  }
}
