import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:musicmain/constants/constants.dart';
import 'package:musicmain/screens/details.dart';

class CustomlistTile extends StatelessWidget {
  final String content;
  final int index;
  final String url;
  final String newscompany;
  final String authorname;
  final Constants constants = Constants();
  final String title;
  final DateTime time;
  final int currentindex;
  final String imageUrl;
  final String description;
  Future<Image> loadimage() async {
    return Image.network(imageUrl, fit: BoxFit.fill);
  }

  CustomlistTile({
    this.content,
    this.index,
    this.url,
    this.newscompany,
    this.description,
    this.authorname,
    this.imageUrl,
    this.title,
    this.time,
    @required this.currentindex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: Details(
                  content: content,
                  url: url,
                  time: time,
                  newscompany: newscompany,
                  description: description,
                  imageURl: imageUrl,
                  title: title,
                  index: currentindex,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width * 0.92,
        child: Card(
          shadowColor: Colors.white,
          color: Color(0xFFD3C9E7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.4,
                      maxHeight: 150,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: index,
                            child: FadeInImage(
                              placeholder:
                                  AssetImage("assets/images/coverimage.jpg"),
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 12, right: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        maxLines: 3,
                        style: constants.kTextstyle(),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          authorname,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
