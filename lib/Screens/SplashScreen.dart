import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (b) => HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
              ),
              Text(
                "Pocket Reader",
                style: GoogleFonts.lato(
                    color: Color.fromRGBO(1, 30, 41, 1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(1, 30, 41, 1),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
