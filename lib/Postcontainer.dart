import 'package:flutter/material.dart';
import 'package:ourvillage/Services/database_Service.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/models/Post.dart';

import 'models/usermodels.dart';
import 'screens/newsfeed/feedscreens/components/date-time.dart';

class TweetContainer extends StatefulWidget {
  final Tweet tweet;
  final UserModel author;
  final String currentUserId;

  const TweetContainer({Key key, this.tweet, this.author, this.currentUserId})
      : super(key: key);
  @override
  _TweetContainerState createState() => _TweetContainerState();
}

class _TweetContainerState extends State<TweetContainer> {
  int _likesCount = 0;
  bool _isLiked = false;

  initTweetLikes() async {
    bool isLiked =
        await DatabaseServices.isLikeTweet(widget.currentUserId, widget.tweet);
    if (mounted) {
      setState(() {
        _isLiked = isLiked;
      });
    }
  }

  likeTweet() {
    if (_isLiked) {
      DatabaseServices.unlikeTweet(widget.currentUserId, widget.tweet);
      setState(() {
        _isLiked = false;
        _likesCount--;
      });
    } else {
      DatabaseServices.likeTweet(widget.currentUserId, widget.tweet);
      setState(() {
        _isLiked = true;
        _likesCount++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _likesCount = widget.tweet.likes;
    initTweetLikes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: widget.author.profilePicture.isEmpty
                    ? AssetImage('assets/placeholder.png')
                    : NetworkImage(widget.author.profilePicture),
                radius: 20.0,
              ),
              SizedBox(width: 7.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.author.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0)),
                  SizedBox(height: 5.0),
                  Text(formatTimestamp(widget.tweet.timestamp))
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            widget.tweet.text,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          widget.tweet.image.isEmpty
              ? SizedBox.shrink()
              : Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.tweet.image),
                          )),
                    )
                  ],
                ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.black,
                    ),
                    onPressed: likeTweet,
                  ),
                  Text(
                    _likesCount.toString() + ' Likes',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.comment, size: 20.0),
                  SizedBox(width: 5.0),
                  Text('Comment', style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.share, size: 20.0)),
                  SizedBox(width: 5.0),
                  Text('Share', style: TextStyle(fontSize: 14.0)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider()
        ],
      ),
    );
  }
}
