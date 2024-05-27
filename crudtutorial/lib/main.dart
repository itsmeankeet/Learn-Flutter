// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
/*
P R O G R A M M I N G    F U N D A M E N T A L S
variables

String name = "Ankit Adhikari";
int age = 20;
double pi = 3.14;
bool isBeginner = true;

Basic opertors
+ add 
- subtract 
/ divide 
* mutliply
% remainder

we use print statement to print in console

COMPARISION OPERATOR

5 == 5 => true
5 != 2 => true
3>2 => true
print(9 == 9) this print true

LOGICAL OPERATOR
 AND operator, returns true if both sides are true

 isBeginner && ( age < 18 ) -> true

 OR operator
||
 NOT operator 
 !isBeginer -> return false



 CONTROL FLOW
 tells computer how to control flow
 if(conditon) {
  do something
 }
 if( age > 18 ) {
  print ("You are adult");
 } else if (age > 60 ) {
  print("You are old");
 } else {
  print ("You are not a adult");
 }



 switch(grade) {
  case A:
  print("...");
  case b:
  print("...");
  ...

  default:
  print("Invalid");


  LOOPS 
  for(int i = 0; i<=10; i++) {
    do something;
  }
 }

 void doesnt return anything 
 int returns integer 

 function with parameters
 void name 
List is ordered collection of elements,, can have duplicates
 List<int> numbers = {1,2,3} this list only contains int

set is unordered collection of elements,, cant have duplicates
 MAP most important
  Map user = {
    'name' = "Ankit Adhikari",
    'age'= 20,
    'height'= 100
  }


  remember everything in flutter is widget
*/

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // void greet() {
  //   print("Hello, Ankit!");
  // }
  // void greet($name) {
  //   print("Hello," + $name + "!");
  // }
  List names = ["Ankit", "Anil", "Dilmaya"];

  void userTapped() {
    print("User Tapped");
  }

  @override
  Widget build(BuildContext context) {
    // greet("Ankit");
    // greet();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //scaffold is the main widget for the app
        backgroundColor: Colors.deepPurple[300],
        appBar: AppBar(
          title: Text(
            "My App Bar",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        // body: ListView(
        //   scrollDirection: Axis.vertical,
        //   children: [
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(10.0),
        //         child: Container(
        //           height: 300,
        //           width: 300,
        //           padding: EdgeInsets.all(20),
        //           decoration: BoxDecoration(
        //               color: Colors.deepPurple,
        //               borderRadius: BorderRadius.circular(20)),
        //           child: Icon(
        //             Icons.favorite,
        //             size: 64,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Center(
        //       child: Container(
        //         height: 300,
        //         width: 300,
        //         padding: EdgeInsets.all(20),
        //         decoration: BoxDecoration(
        //             color: Colors.deepPurple,
        //             borderRadius: BorderRadius.circular(20)),
        //         child: Icon(
        //           Icons.favorite,
        //           size: 64,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(10.0),
        //         child: Container(
        //           height: 300,
        //           width: 300,
        //           padding: EdgeInsets.all(20),
        //           decoration: BoxDecoration(
        //               color: Colors.deepPurple,
        //               borderRadius: BorderRadius.circular(20)),
        //           child: Icon(
        //             Icons.favorite,
        //             size: 64,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // )
        // body: ListView.builder(
        //   itemCount: names.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: Text(names[index]),
        //     );
        //   },
        // )

        body: Center(
          child: GestureDetector(
            onDoubleTap: userTapped,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.favorite,
                    size: 64,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tap Me!",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
