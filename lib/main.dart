import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ourvillage/screens/newsfeed/Newsfeed.dart';
import 'package:ourvillage/screens/welcomeScreen.dart';
import 'package:provider/provider.dart';

import 'screens/newsfeed/feedscreens/components/villages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget getScreenID() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return NewsFeed(currentUserId: snapshot.data.uid);
          } else {
            return WelcomeScreen();
          }
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          title: 'Our Village App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: getScreenID(),
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => VillageRoomHelper()),
        ]);
  }
}
