import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourvillage/Services/database_Service.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/models/Activities.dart';
import 'package:ourvillage/models/usermodels.dart';
import 'package:ourvillage/screens/newsfeed/feedscreens/components/date-time.dart';

class NotificationScreen extends StatefulWidget {
  final String currentUserId;
  NotificationScreen({
    Key key,
    this.currentUserId,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Activity> _activities = [];

  setupActivities() async {
    List<Activity> activities =
        await DatabaseServices.getActivities(widget.currentUserId);
    if (mounted) {
      setState(() {
        _activities = activities;
      });
    }
  }

  buildActivity(Activity activity) {
    return FutureBuilder(
        future: usersRef.doc(activity.fromUserId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return SizedBox.shrink();
          } else {
            UserModel user = UserModel.fromDoc(snapshot.data);
            return SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: user.profilePicture.isEmpty
                          ? AssetImage('assets/images/Placeholder.png')
                          : NetworkImage(user.profilePicture),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        activity.follow == true
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('${user.name} follows you'),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(formatTimestamp(activity.timestamp)),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${user.name} liked your Post'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(formatTimestamp(activity.timestamp)),
                                    ],
                                  ),
                                ],
                              ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.more_horiz),
                            Text(''),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  )
                ],
              ),
            );
          }
        });
  }

  @override
  void initState() {
    super.initState();
    setupActivities();
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
            'Notifications',
            style: TextStyle(
              fontSize: 25.0,
              color: kPrimaryColor,
              fontFamily: 'Pacifico-Regular',
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.expand_more_rounded,
                  color: kPrimaryColor,
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => setupActivities(),
          child: ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = _activities[index];
                return buildActivity(activity);
              }),
        ));
  }
}
