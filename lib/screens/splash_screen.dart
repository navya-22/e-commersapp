import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stylish_app/screens/splash_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen1(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assess/images/Group 34010.png'),
          const SizedBox(
            width: 10,
          ),
          Text('stylish',
              style: TextStyle(
                  color: Colors.pink[600],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreCaslonText',
                  decoration: TextDecoration.none))
        ],
      ),
    );
  }
}
