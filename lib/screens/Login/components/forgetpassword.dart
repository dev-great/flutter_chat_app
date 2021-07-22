import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';
import 'package:our_village/screens/fogottenpassword/fogottenpassword.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Row(
        children: [
          Checkbox(
            value: true,
            activeColor: kPrimaryColor,
            onChanged: (value) {},
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Fogottenpassword();
                  },
                ),
              );
            },
            child: new Text(
              'Fogotten Password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
