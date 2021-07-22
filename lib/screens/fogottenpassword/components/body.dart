import 'package:flutter/material.dart';
import 'package:our_village/components/roundedbtn.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/Login/components/Footer_signup.dart';
import 'package:our_village/screens/Login/components/Rounded_text_field.dart';
import 'package:our_village/screens/Login/login_screen.dart';
import 'package:our_village/screens/Resetpassword/resetpassword.dart';
import 'package:our_village/screens/fogottenpassword/components/forgetbackground.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ForgetBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fogotten Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "assets/images/reg.png",
              height: size.height * 0.35,
            ),
            Container(
              width: size.width * 0.6,
              child: Text(
                "You will be sent your reset link, check your email for your verification code",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Recovery email",
              icon: Icons.mail,
              onChanged: (value) {},
            ),
            Roundedbtn(
              text: "Reset Password",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResetPassword();
                    },
                  ),
                );
              },
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
                })
          ],
        ),
      ),
    );
  }
}
