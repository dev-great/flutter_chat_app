import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF228B22);
const kSeconderyColor = Color(0xFFF0FFF0);

final _fireStore = FirebaseFirestore.instance;

final usersRef = _fireStore.collection('users');

final followersRef = _fireStore.collection('Followers');

final followingRef = _fireStore.collection('Following');

final storageRef = FirebaseStorage.instance.ref();

final tweetsRef = _fireStore.collection('tweets');

final feedRefs = _fireStore.collection('feeds');

final likesRef = _fireStore.collection('likes');

final activitiesRef = _fireStore.collection('activities');
