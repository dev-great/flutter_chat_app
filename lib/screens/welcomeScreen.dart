import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourvillage/screens/components/roundedBtn.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Image.asset(
                    "assets/images/welcomepicture.png",
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Nigerian's number one community development application",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RoundedBtn(
                      submit: () {},
                      text: "Create Account",
                      color: Color(0xff1b5e20),
                      textcolor: Color(0xffffffff)),
                  Divider(),
                  RoundedBtn(
                      submit: () {},
                      text: "SignIn",
                      color: Color(0xff1b5e20),
                      textcolor: Color(0xffffffff))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
