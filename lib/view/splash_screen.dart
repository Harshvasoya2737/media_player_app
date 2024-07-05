import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4DC),
      body: Column(
        children: [
          Container(
            height: 455,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xffE27D39),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(250),
                    bottomLeft: Radius.circular(250))),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/black-simple-headphones-removebg-preview.png",
                          height: 300,
                          width: 300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 190, left: 134),
                        child: Text(
                          "Podcast".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 280, left: 65),
                        child: Text(
                          "Listen what you want",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/images/img.png",
            height: 388,
          ),
        ],
      ),
    );
  }
}
//