import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RoundedBtn extends StatelessWidget {
  final Function() submit;
  final String text;
  final Color color, textcolor;
  const RoundedBtn({
    Key key,
    this.submit,
    this.text,
    this.color,
    this.textcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: submit,
        minWidth: 300,
        height: 50,
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: 20),
        ),
      ),
    );
  }
}
