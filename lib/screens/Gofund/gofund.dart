import 'package:flutter/material.dart';
import 'package:our_village/screens/Homepage/components/search.dart';

class GoFundScreen extends StatelessWidget {
  const GoFundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Search(),
          ],
        ),
      ),
    );
  }
}
