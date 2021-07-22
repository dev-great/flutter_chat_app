import 'package:flutter/material.dart';
import 'package:our_village/components/roundedbtn.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/Login/components/Rounded_password_field.dart';
import 'package:our_village/screens/Login/login_screen.dart';
import 'package:our_village/screens/Resetpassword/components/background.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResetBackground(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Reset Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: "New Password",
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: "Confirm Password",
          ),
          Roundedbtn(
            text: "Reset Password",
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
            color: kPrimaryColor,
            textcolor: Colors.white,
          ),
        ],
      ),
    ));
  }
}
