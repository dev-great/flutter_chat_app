import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: size.height * 0.2,
                width: size.width * 1,
                color: kPrimaryColor,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
