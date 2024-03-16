import 'dart:async';

import 'package:first_bmiapp/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>MyHomePage()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Icon(FontAwesomeIcons.joint,
        color: Colors.amber,
        size: 81,),
      )

    );
  }
}
