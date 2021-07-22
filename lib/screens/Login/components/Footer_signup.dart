import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';

class FooterSignup extends StatelessWidget {
  final bool login;
  final Function() press;
  const FooterSignup({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an account?" : "Already have an account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "sign Up" : "sign In",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
