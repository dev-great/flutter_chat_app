import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String profilePicture;
  String email;
  String bio;
  String coverimage;
  String village;
  String number;

  UserModel(
      {this.id,
      this.name,
      this.profilePicture,
      this.email,
      this.bio,
      this.coverimage,
      this.village,
      this.number});

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id ?? '',
      name: doc['name'],
      email: doc['email'],
      profilePicture: doc['profilePicture'],
      bio: doc['bio'],
      village: doc['village'],
      coverimage: doc['coverimage'],
      number: doc['number'],
    );
  }
}
