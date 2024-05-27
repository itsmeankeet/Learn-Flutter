// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:page_navigator/pages/aboutus_page.dart';
import 'package:page_navigator/pages/contact_page.dart';
import 'package:page_navigator/pages/home_page.dart';
import 'package:page_navigator/pages/second_page.dart';
import 'package:page_navigator/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "First Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [Icon(Icons.home), Icon(Icons.person)],
      ),
      drawer: Drawer(
        shadowColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                //logo
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 65,
                ),

                //company name
                Text(
                  "A N K E E T",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
            //home
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "H O M E",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                //when we come back from home bage or other page the drawer will be close
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
              // subtitle: Text("Go to home page"),
            ),
            //about us
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "A B O U T   U S",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutusPage()));
              },
              // subtitle: Text("Go to home page"),
            ),
            //contact us
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              title: Text(
                "C O N T A C T    U S",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage()));
              },
              // subtitle: Text("Go to home page"),
            ),
            //settings
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "S E T T I N G S",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              // subtitle: Text("Go to home page"),
            ),
          ],
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Tap me to visit in next page",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
