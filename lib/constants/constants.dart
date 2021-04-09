import 'package:flutter/material.dart';

class Constants {
  TextStyle kTextstyle() => TextStyle(
        color: Color(0xff49426c),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      );
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // your customization here
      title: Text('Latest News'),
      centerTitle: true,
      backgroundColor: Colors.black54,
    );
  }
}
