import 'package:flutter/material.dart';
import 'package:ourvillage/screens/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Village App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: WelcomeScreen(),
    );
  }
}
