// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerP = TextEditingController();
  TextEditingController controllerT = TextEditingController();
  TextEditingController controllerR = TextEditingController();
  double interest = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Intrest Calculator App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
      drawer: Drawer(
        backgroundColor: Colors.yellow[200],
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Dashboard",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.dashboard,
                      size: 50,
                    ),
                  ),
                  ListTile(
                    title: Text(
                        "Calculate Interest by entering Principle, Time, and Rate"),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text(
                "HOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              leading: const Icon(
                Icons.home,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
            const ListTile(
              title: Text(
                "CONTACT US",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.contact_page,
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Principle",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: controllerP,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 40),
            Text(
              "Rate",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: controllerR,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 40),
            Text(
              "Time",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: controllerT,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    elevation: 10,
                    shadowColor: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      double principle = double.tryParse(controllerP.text) ?? 0;
                      double rate = double.tryParse(controllerR.text) ?? 0;
                      double time = double.tryParse(controllerT.text) ?? 0;
                      interest = (principle * time * rate) / 100;
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Interest is $interest",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
