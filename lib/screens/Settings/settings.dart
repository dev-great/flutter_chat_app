import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 35.0, 0.0, 15.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 15.0),
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Mike Tyler',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    SizedBox(height: 5.0),
                    Text(
                      'See your profile',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(height: 20.0),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 65.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.help, size: 40.0, color: Colors.grey[700]),
                      SizedBox(width: 10.0),
                      Text('Theme and apperance',
                          style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down, size: 30.0),
                ],
              ),
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 65.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.settings, size: 40.0, color: Colors.grey[700]),
                      SizedBox(width: 10.0),
                      Text('Settings & Privacy',
                          style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down, size: 30.0),
                ],
              ),
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 65.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.settings, size: 40.0, color: Colors.grey[700]),
                      SizedBox(width: 10.0),
                      Text('Create Account', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down, size: 30.0),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 65.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.exit_to_app,
                          size: 40.0, color: Colors.grey[700]),
                      SizedBox(width: 10.0),
                      Text('Logout', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
