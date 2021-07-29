import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';

class SocialVerification extends StatelessWidget {
  const SocialVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '_OR_',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => print('login with facebook'),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.5,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/fb.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () => print('login with google'),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.5,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/gg.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () => print('login with twitter'),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.5,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/tt.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
