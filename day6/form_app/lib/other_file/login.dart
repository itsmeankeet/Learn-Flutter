import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 230, 230),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(
                30.0), // Adding some elevation for shadow effect
            child: ListView(
              children: [
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter your valid credentials for login",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(height: 25),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email"),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Enter your email address..",
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.mail))),
                ),
                const SizedBox(height: 15),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password"),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Enter your password..",
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye))),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 17, decoration: TextDecoration.underline),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity, // Set width to fill parent container
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or sign up with",
                    style: TextStyle(fontSize: 17, color: Colors.black26),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity, // Set width to fill parent container
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black54, width: 0.5)),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apple,
                          color: Colors.black54,
                          size: 30,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Sign Up with Google",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black54, width: .5)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.code,
                        color: Colors.black12,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Sign Up with Github",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
