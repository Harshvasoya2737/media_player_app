import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool observetext = true;

  void login() {
    final String email = emailcontroller.text;
    final String password = passwordcontroller.text;

    if (email == "harshvasoya@gmail.com" && password == "12345") {
      Navigator.pushReplacementNamed(context, "home");
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Center(child: Text("Invalid email or password"))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/images/boylisten-removebg-preview.png"),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(color: Colors.white12),
                  child: Center(
                      child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.white54, fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Email",
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 50,
                    left: 50,
                  ),
                  child: TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.white54)),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Password",
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 50,
                    left: 50,
                  ),
                  child: TextFormField(
                    obscureText: observetext,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.white54),
                        suffixIcon: IconButton(
                          icon: Icon(
                            observetext
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white38,
                          ),
                          onPressed: () {
                            setState(() {
                              observetext = !observetext;
                            });
                          },
                        )),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: login,
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration:
                        BoxDecoration(color: Color(0xffE27D39), boxShadow: [
                      BoxShadow(
                        color: Colors.white24, // Shadow color
                        spreadRadius: 10, // Spread radius
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: Center(
                        child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
