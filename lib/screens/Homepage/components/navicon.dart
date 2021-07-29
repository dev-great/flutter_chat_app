import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';

class NewIcons extends StatelessWidget {
  final IconData icon;
  final Function() press;
  final double iconsize;
  const NewIcons({
    Key? key,
    required this.icon,
    required this.press,
    required this.iconsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: kSeconderyColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconsize,
        color: Colors.black,
        onPressed: press,
      ),
    );
  }
}
