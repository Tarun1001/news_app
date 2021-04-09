import 'package:flutter/material.dart';

class Imageview extends StatelessWidget {
  final int index;
  final String title;
  final String image;

  const Imageview({@required this.image, this.index, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.cancel_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: index, child: Center(child: Image.network(image))),
            Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
