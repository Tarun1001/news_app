import 'package:flutter/material.dart';

class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  List savednews = [];
  void addtosaved(String imageurl, String title) {
    setState(() {
      savednews.add({imageurl, title});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
