import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/Group.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/home.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/notification.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/profile.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/Search.dart';

class NewsFeed extends StatefulWidget {
  final String currentUserId;

  const NewsFeed({Key key, this.currentUserId}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(currentUserId: widget.currentUserId),
        SearchScreen(
          currentUserId: widget.currentUserId,
        ),
        Group(),
        NotificationScreen(currentUserId: widget.currentUserId),
        ProfileScreen(
          currentUserId: widget.currentUserId,
          visitedUserId: widget.currentUserId,
        ),
      ].elementAt(_selectedTab),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        activeColor: kPrimaryColor,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.group_add_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
