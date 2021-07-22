import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_village/components/roundedbtn.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/Login/components/Footer_signup.dart';
import 'package:our_village/screens/Login/components/Rounded_password_field.dart';
import 'package:our_village/screens/Login/components/Rounded_text_field.dart';
import 'package:our_village/screens/Login/login_screen.dart';
import 'package:our_village/screens/Signup/components/signupbackground.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SvgPicture.asset(
            "assets/images/Group Chat-rafiki.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Full Name",
            icon: Icons.person,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: "Password",
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: "Confirm Password",
          ),
          Roundedbtn(
            text: "Sign Up",
            press: () {},
            color: kPrimaryColor,
            textcolor: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          FooterSignup(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
