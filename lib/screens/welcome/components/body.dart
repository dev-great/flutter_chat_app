import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_village/components/roundedbtn.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/Login/login_screen.dart';
import 'package:our_village/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Our Village",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/images/Group Chat-rafiki.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Roundedbtn(
              text: "Login",
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
              textcolor: Colors.white,
              color: kPrimaryColor,
            ),
            Roundedbtn(
              text: "Sign in",
              press: () {},
              textcolor: Colors.black,
              color: kSeconderyColor,
            ),
          ],
        ),
      ),
    );
  }
}
