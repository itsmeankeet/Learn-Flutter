import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 239, 250),
      appBar: AppBar(
        elevation: 6,
        centerTitle: true,
        title: const Text("Profile App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: double.infinity, //gives all the height
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage("image/ankit.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hello I am Ankit Adhikari. I am beginner in Flutter. I am from Pokhara",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "Pokhara-16 Batelachour",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.web_stories),
                      title: Text("Website"),
                      subtitle: Text("www.google.com"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Phone"),
                      subtitle: Text("+977 9800000000"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.email),
                      title: Text("Email"),
                      subtitle: Text("adhikariankit553@gmail.com"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.code),
                      title: const Text("Github"),
                      subtitle: const Text("https://github.com/itsmeankeet"),
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
