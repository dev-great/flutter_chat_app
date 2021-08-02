import 'dart:io';

class User {
  String email;

  String name;

  String village;

  String userID;

  String profilePictureURL;

  String appIdentifier;

  User(
      {this.email = '',
      this.name = '',
      this.village = '',
      this.userID = '',
      this.profilePictureURL = ''})
      : this.appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return new User(
        email: parsedJson['email'] ?? '',
        name: parsedJson['name'] ?? '',
        village: parsedJson['village'] ?? '',
        userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        profilePictureURL: parsedJson['profilePictureURL'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'name': this.name,
      'village': this.village,
      'id': this.userID,
      'profilePictureURL': this.profilePictureURL,
      'appIdentifier': this.appIdentifier
    };
  }
}
