import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourvillage/Postcontainer.dart';
import 'package:ourvillage/Services/database_Service.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/models/Post.dart';
import 'package:ourvillage/models/usermodels.dart';
import 'package:ourvillage/screens/Settings/settings.dart';
import 'package:ourvillage/screens/newsfeed/createpost.dart';

class HomeScreen extends StatefulWidget {
  final String currentUserId;
  HomeScreen({Key key, this.currentUserId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _followingPosts = [];
  bool _loading = false;

  buildTweets(Tweet tweet, UserModel author) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TweetContainer(
        tweet: tweet,
        author: author,
        currentUserId: widget.currentUserId,
      ),
    );
  }

  showFollowingPosts(String currentUserId) {
    List<Widget> followingPostsList = [];
    for (Tweet post in _followingPosts) {
      followingPostsList.add(FutureBuilder(
          future: usersRef.doc(post.authorId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              UserModel author = UserModel.fromDoc(snapshot.data);
              return buildTweets(post, author);
            } else {
              return SizedBox.shrink();
            }
          }));
    }
    return followingPostsList;
  }

  setupFollowingPosts() async {
    setState(() {
      _loading = true;
    });
    List followingPosts =
        await DatabaseServices.getHomeTweets(widget.currentUserId);
    if (mounted) {
      setState(() {
        _followingPosts = followingPosts;
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupFollowingPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
              ),
              ListTile(
                title: Text(
                  'About Us',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                leading: Icon(Icons.info, color: kPrimaryColor),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Community Projects',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                leading: Icon(Icons.group_work, color: kPrimaryColor),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Help & Support',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                leading: Icon(
                  Icons.help_center,
                  color: kPrimaryColor,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                leading: Transform.rotate(
                    angle: pi / 1,
                    child: Icon(Icons.settings, color: kPrimaryColor)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuTab()));
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                leading: Transform.rotate(
                    angle: pi / 1,
                    child: Icon(Icons.exit_to_app, color: kPrimaryColor)),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Ourvillage",
            style: TextStyle(
              fontSize: 25.0,
              color: kPrimaryColor,
              fontFamily: 'Pacifico-Regular',
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatePostScreen(
                                currentUserId: widget.currentUserId,
                              )));
                },
                icon: Icon(
                  Icons.create,
                  color: kPrimaryColor,
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => setupFollowingPosts(),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              _loading ? LinearProgressIndicator() : SizedBox.shrink(),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  Column(
                    children: _followingPosts.isEmpty && _loading == false
                        ? [
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                'There is No New Tweets',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ]
                        : showFollowingPosts(widget.currentUserId),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
