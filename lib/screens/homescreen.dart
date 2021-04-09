import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:musicmain/constants/constants.dart';
import 'package:musicmain/model/product.dart';
import 'package:musicmain/networking/networking.dart';
import 'package:musicmain/widgets/custom_widgets.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Newsdata newsdata;
  final Article article;
  const MyHomePage({this.title, this.article, this.newsdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff49426c),
      body: Container(
        child: Center(
          child: FutureBuilder<Newsdata>(
            future: Networking().fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              if (snapshot.hasData) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Color(0xff49426c),
                      expandedHeight: 150.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          "News Feed",
                          style: TextStyle(color: Color(0xffD3C9E7)),
                        ),
                      ),
                      actions: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(right: 25, top: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffD3C9E7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "T",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      return Slidable(
                        actions: [
                          new IconSlideAction(
                            onTap: () {},
                            caption: 'Save',
                            color: Colors.red,
                            icon: Icons.bookmark,
                          ),
                        ],
                        actionExtentRatio: 0.25,
                        actionPane: SlidableDrawerActionPane(),
                        child: CustomlistTile(
                          content: snapshot.data.articles[index].content,
                          index: index,
                          url: snapshot.data.articles[index].url,
                          newscompany: snapshot.data.articles[index].source.name
                              .toString(),
                          authorname: snapshot.data.articles[index].author,
                          description:
                              snapshot.data.articles[index].description,
                          time: snapshot.data.articles[index].publishedAt,
                          imageUrl: snapshot.data.articles[index].urlToImage,
                          currentindex: index,
                          title: snapshot.data.articles[index].title,
                        ),
                      );
                    }, childCount: snapshot.data.articles.length))
                  ],
                );
              } else {
                return SizedBox(
                  child: Lottie.asset("assets/images/lottieare.json"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
