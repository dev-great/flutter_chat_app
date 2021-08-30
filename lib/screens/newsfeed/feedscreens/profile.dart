import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourvillage/Postcontainer.dart';
import 'package:ourvillage/Services/auth_service.dart';
import 'package:ourvillage/Services/database_Service.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/models/Post.dart';
import 'package:ourvillage/models/usermodels.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/components/editProfile.dart';
import 'package:ourvillage/screens/welcomeScreen.dart';

class ProfileScreen extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;
  ProfileScreen({
    Key key,
    this.currentUserId,
    this.visitedUserId,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _followersCount = 0;
  int _followingCount = 0;
  bool _isFollowing = false;
  int _profileSegmentedValue = 0;
  List<Tweet> _allTweets = [];
  List<Tweet> _mediaTweets = [];

  Map<int, Widget> _profileTabs = <int, Widget>{
    0: Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Timeline',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
    1: Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Media',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  };

  Widget buildProfileWidgets(UserModel author) {
    switch (_profileSegmentedValue) {
      case 0:
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _allTweets.length,
            itemBuilder: (context, index) {
              return TweetContainer(
                currentUserId: widget.currentUserId,
                author: author,
                tweet: _allTweets[index],
              );
            });
        break;
      case 1:
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _mediaTweets.length,
            itemBuilder: (context, index) {
              return TweetContainer(
                currentUserId: widget.currentUserId,
                author: author,
                tweet: _mediaTweets[index],
              );
            });
        break;
      default:
        return Center(
            child: Text('Something wrong', style: TextStyle(fontSize: 25)));
        break;
    }
  }

  getFollowersCount() async {
    int followersCount =
        await DatabaseServices.followersNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followersCount = followersCount;
      });
    }
  }

  getFollowingCount() async {
    int followingCount =
        await DatabaseServices.followingNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followingCount = followingCount;
      });
    }
  }

  followOrUnFollow() {
    if (_isFollowing) {
      unFollowUser();
    } else {
      followUser();
    }
  }

  unFollowUser() {
    DatabaseServices.unFollowUser(widget.currentUserId, widget.visitedUserId);
    setState(() {
      _isFollowing = false;
      _followersCount--;
    });
  }

  followUser() {
    DatabaseServices.followUser(widget.currentUserId, widget.visitedUserId);
    setState(() {
      _isFollowing = true;
      _followersCount++;
    });
  }

  setupIsFollowing() async {
    bool isFollowingThisUser = await DatabaseServices.isFollowingUser(
        widget.currentUserId, widget.visitedUserId);
    setState(() {
      _isFollowing = isFollowingThisUser;
    });
  }

  getAllTweets() async {
    List<Tweet> userTweets =
        await DatabaseServices.getUserTweets(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _allTweets = userTweets;
        _mediaTweets =
            _allTweets.where((element) => element.image.isNotEmpty).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFollowersCount();
    getFollowingCount();
    setupIsFollowing();
    getAllTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 25.0,
            color: kPrimaryColor,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        actions: [
          widget.currentUserId == widget.visitedUserId
              ? PopupMenuButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 30,
                  ),
                  itemBuilder: (_) {
                    return <PopupMenuItem<String>>[
                      new PopupMenuItem(
                        child: Text('Logout'),
                        value: 'logout',
                      )
                    ];
                  },
                  onSelected: (selectedItem) {
                    if (selectedItem == 'logout') {
                      AuthService.logout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    }
                  },
                )
              : SizedBox(),
        ],
      ),
      body: FutureBuilder(
        future: usersRef.doc(widget.visitedUserId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(kPrimaryColor),
              ),
            );
          }
          UserModel userModel = UserModel.fromDoc(snapshot.data);
          return ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kPrimaryColor,
                    image: userModel.coverimage.isEmpty
                        ? null
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(userModel?.coverimage),
                          ),
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: userModel.profilePicture.isEmpty
                                  ? AssetImage('assets/images/placeholder.png')
                                  : NetworkImage(userModel?.profilePicture),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userModel.name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          widget.currentUserId == widget.visitedUserId
                              ? Container(
                                  height: 40.0,
                                  width:
                                      MediaQuery.of(context).size.width - 240,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                      child: Text('Messages',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0))),
                                )
                              : GestureDetector(
                                  onTap: followOrUnFollow,
                                  child: Container(
                                    height: 40.0,
                                    width:
                                        MediaQuery.of(context).size.width - 240,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                        child: Text(
                                            _isFollowing
                                                ? 'Following'
                                                : 'Follow',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0))),
                                  ),
                                ),
                          widget.currentUserId == widget.visitedUserId
                              ? GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfileScreen(
                                                  user: userModel)),
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width:
                                        MediaQuery.of(context).size.width - 240,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        'Settings',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 40.0,
                                  width:
                                      MediaQuery.of(context).size.width - 240,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                    child: Text(
                                      'Message',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                    Divider(
                      color: kPrimaryColor,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor,
                                  fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              userModel.bio,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'FredokaOne-Regular',
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Contact:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor,
                                  fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.group,
                                  color: kPrimaryColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  userModel.village,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'FredokaOne-Regular',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.mail,
                                  color: kPrimaryColor,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  userModel.email,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'FredokaOne-Regular',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: kPrimaryColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  userModel.number,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'FredokaOne-Regular',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  '$_followingCount Friends',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  '$_followersCount Village People',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: _profileSegmentedValue,
                          thumbColor: kPrimaryColor,
                          backgroundColor: Colors.black12,
                          children: _profileTabs,
                          onValueChanged: (i) {
                            setState(() {
                              _profileSegmentedValue = i;
                            });
                          },
                        ),
                      ),
                    ),
                    buildProfileWidgets(userModel),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
