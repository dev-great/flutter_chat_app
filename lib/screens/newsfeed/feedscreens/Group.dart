import 'package:flutter/material.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/components/villages.dart';
import 'package:provider/provider.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
        onPressed: () {
          Provider.of<VillageRoomHelper>(context, listen: false)
              .showCreateChatroomShit(context);
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Villages ',
          style: TextStyle(
            fontSize: 25.0,
            color: kPrimaryColor,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<VillageRoomHelper>(context, listen: false)
                    .showCreateChatroomShit(context);
              },
              icon: Icon(
                Icons.add,
                color: kPrimaryColor,
                size: 30,
              ))
        ],
      ),
    );
  }
}
