import 'package:flutter/material.dart';
import 'package:stylish_app/screens/home_screen.dart';
import 'package:stylish_app/screens/place_order_screen.dart';
import 'package:stylish_app/screens/shipping_screen.dart';
import 'package:stylish_app/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stylish_app/screens/sign_up_screen.dart';
import 'package:stylish_app/screens/splash_screen.dart';
import 'package:stylish_app/screens/splash_screen1.dart';
import 'package:stylish_app/screens/trending_product_screen.dart';
import 'package:stylish_app/widget/bottomnavigation.dart';
import 'firebase_options.dart';

// ...


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp()
  );
}
 class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Splash Screen',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: SignInScreen(),
    debugShowCheckedModeBanner: false,
  );
  }
 }