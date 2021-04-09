import 'package:flutter/material.dart';
import 'package:musicmain/constants/constants.dart';
import 'package:musicmain/screens/photoview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';

import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  final String content;
  final String url;
  final DateTime time;
  final String newscompany;
  final String detailstext =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";
  final Constants constants = Constants();
  final int index;
  final String title;
  final String imageURl;
  final String description;
  Details({
    this.content,
    this.url,
    this.time,
    this.newscompany,
    this.description,
    this.imageURl,
    this.title,
    @required this.index,
  });
  void _launchURL() async {
    var _url = url;

    await launch(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    final RenderBox box = context.findRenderObject();
                    Share.share(url,
                        subject: url,
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size);
                  },
                  child: Icon(Icons.share_outlined)),
              label: "Share"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    print(url);
                    _launchURL();
                  },
                  child: Icon(Icons.link)),
              label: "link"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: Icon(Icons.bookmark_border),
                onTap: () {},
              ),
              label: "Save")
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: index,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: Imageview(
                                      title: title,
                                      image: imageURl,
                                      index: index,
                                    ),
                                    type: PageTransitionType.fade));
                          },
                          child: Image.network(
                            imageURl,
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.4),
                    child: Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 3),
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("- $newscompany"),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 30.0, left: 5, right: 5),
                                child: Text(
                                  description,
                                  style: TextStyle(
                                      fontSize: 16,
                                      wordSpacing: 4,
                                      height: 1.4),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.49,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.39,
                    left: 50,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          child: Text("inshorts"),
                        )),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height * 0.1,
                  //     color: Colors.blueAccent,
                  //   ),
                  // )
                ],
              ),

              // Align(
              //     alignment: Alignment.topRight,
              //     child: Padding(
              //       padding: const EdgeInsets.only(right: 10.0, bottom: 5),
              //       child: Text("${time.hour}:${time.minute}"),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
