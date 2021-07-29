import 'package:flutter/material.dart';
import 'package:our_village/constants.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for messages or users",
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
