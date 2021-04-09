import 'package:flutter/material.dart';
import 'package:musicmain/networking/networking.dart';
import 'package:musicmain/screens/homescreen.dart';

void main() {
  Networking().fetchProducts();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.redAccent,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
