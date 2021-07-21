import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_village/components/roundedbtn.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/Login/components/Rounded_text_field.dart';
import 'package:our_village/screens/Login/components/loginbody.dart';
import 'package:our_village/screens/Login/components/text_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign in",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            "assets/images/Conversation-pana.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Input Email",
            onChanged: (value) {},
            icon: Icons.person,
          ),
          TextFieldContainer(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Input Password",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Roundedbtn(
            text: "Sign in",
            press: () {},
            textcolor: Colors.white,
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
