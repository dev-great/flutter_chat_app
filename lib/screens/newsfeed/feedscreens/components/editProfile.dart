import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ourvillage/Services/database_Service.dart';
import 'package:ourvillage/Services/storageservice.dart';
import 'package:ourvillage/constants.dart';
import 'package:ourvillage/models/usermodels.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  EditProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _name;
  File _profilePicture;
  String _bio;
  String _number;
  File _coverimage;
  String _village;
  String _imagePickedType;
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  handleImageFromGallery() async {
    try {
      File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile != null) {
        if (_imagePickedType == 'profile') {
          setState(() {
            _profilePicture = imageFile;
          });
        } else if (_imagePickedType == 'cover') {
          setState(() {
            _coverimage = imageFile;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  displayCoverImage() {
    if (_coverimage == null) {
      if (widget.user.coverimage.isEmpty) {
        return AssetImage("assets/images/Placeholder.png");
      } else {
        return NetworkImage(widget.user.coverimage);
      }
    } else {
      return FileImage(_coverimage);
    }
  }

  displayProfileImage() {
    if (_profilePicture == null) {
      if (widget.user.profilePicture.isEmpty) {
        return AssetImage("assets/images/Placeholder.png");
      } else {
        return NetworkImage(widget.user.profilePicture);
      }
    } else {
      return FileImage(_profilePicture);
    }
  }

  saveProfile() async {
    _formkey.currentState.save();
    if (_formkey.currentState.validate() && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      String profilePictureUrl = '';
      String coverPictureUrl = '';
      if (_profilePicture == null) {
        profilePictureUrl = widget.user.profilePicture;
      } else {
        profilePictureUrl = await StorageService.uploadProfilePicture(
            widget.user.profilePicture, _profilePicture);
      }
      if (_coverimage == null) {
        coverPictureUrl = widget.user.coverimage;
      } else {
        coverPictureUrl = await StorageService.uploadCoverPicture(
            widget.user.coverimage, _coverimage);
      }
      UserModel user = UserModel(
        id: widget.user.id,
        name: _name,
        profilePicture: profilePictureUrl,
        coverimage: coverPictureUrl,
        village: _village,
        number: _number,
        bio: _bio,
      );

      DatabaseServices.updateUserData(user);
      Navigator.pop(context);
    }
  }

  @override
  Void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
    _number = widget.user.number;
    _village = widget.user.village;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          GestureDetector(
            onTap: () {
              _imagePickedType = 'cover';
              handleImageFromGallery();
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      image:
                          _coverimage == null && widget.user.coverimage.isEmpty
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: displayCoverImage())),
                ),
                Container(
                  height: 150,
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        "Change cover photo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -40, 0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imagePickedType = 'profile';
                        handleImageFromGallery();
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: displayProfileImage()),
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.black54,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Change profile photo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        saveProfile();
                      },
                      child: Container(
                        width: 80,
                        height: 25,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Text('Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        _isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(kPrimaryColor))
                            : SizedBox.shrink(),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: _name,
                          decoration: InputDecoration(
                            labelText: 'Name:',
                            labelStyle: TextStyle(color: kPrimaryColor),
                          ),
                          validator: (input) => input.trim().length < 2
                              ? 'please enter a valid name'
                              : null,
                          onSaved: (value) {
                            _name = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: 5,
                          initialValue: _bio,
                          decoration: InputDecoration(
                            labelText: 'Bio:',
                            labelStyle: TextStyle(color: kPrimaryColor),
                          ),
                          onSaved: (value) {
                            _bio = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: _number,
                          decoration: InputDecoration(
                            labelText: 'Number +234:',
                            labelStyle: TextStyle(color: kPrimaryColor),
                          ),
                          validator: (input) => input.trim().length < 2
                              ? 'please enter your Village'
                              : null,
                          onSaved: (value) {
                            _number = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: _village,
                          decoration: InputDecoration(
                            labelText: 'Village:',
                            labelStyle: TextStyle(color: kPrimaryColor),
                          ),
                          validator: (input) => input.trim().length < 2
                              ? 'please enter your Village'
                              : null,
                          onSaved: (value) {
                            _village = value;
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
