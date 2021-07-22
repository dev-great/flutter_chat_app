import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/Login/components/text_field.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<string> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }
}

mixin string {}
