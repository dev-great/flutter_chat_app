import 'package:flutter/material.dart';
import 'package:our_village/screens/Login/components/body.dart';
import 'package:our_village/screens/Login/components/loginbody.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
