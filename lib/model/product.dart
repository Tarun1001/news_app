class Newsdata {
  Newsdata({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory Newsdata.fromJson(Map<String, dynamic> json) => Newsdata(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  Id id;
  Name name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
      };
}

enum Id { TECHCRUNCH }

final idValues = EnumValues({"techcrunch": Id.TECHCRUNCH});

enum Name { TECH_CRUNCH }

final nameValues = EnumValues({"TechCrunch": Name.TECH_CRUNCH});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

// List<NewsData> newsDataFromJson(String str) =>
//     List<NewsData>.from(json.decode(str).map((x) => NewsData.fromJson(x)));

// String newsDataToJson(List<NewsData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class NewsData {
//   NewsData({
//     this.id,
//     this.title,
//     this.url,
//     this.imageUrl,
//     this.newsSite,
//     this.summary,
//     this.publishedAt,
//     this.updatedAt,
//     this.featured,
//     this.launches,
//     this.events,
//   });

//   String id;
//   String title;
//   String url;
//   String imageUrl;
//   NewsSite newsSite;
//   String summary;
//   DateTime publishedAt;
//   DateTime updatedAt;
//   bool featured;
//   List<dynamic> launches;
//   List<dynamic> events;

//   factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
//         id: json["id"],
//         title: json["title"],
//         url: json["url"],
//         imageUrl: json["imageUrl"],
//         newsSite: newsSiteValues.map[json["newsSite"]],
//         summary: json["summary"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         featured: json["featured"],
//         launches: List<dynamic>.from(json["launches"].map((x) => x)),
//         events: List<dynamic>.from(json["events"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "url": url,
//         "imageUrl": imageUrl,
//         "newsSite": newsSiteValues.reverse[newsSite],
//         "summary": summary,
//         "publishedAt": publishedAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "featured": featured,
//         "launches": List<dynamic>.from(launches.map((x) => x)),
//         "events": List<dynamic>.from(events.map((x) => x)),
//       };
// }

// enum NewsSite { SPACEFLIGHT_NOW, SPACE_NEWS, SPACE_COM, NASA_SPACEFLIGHT }

// final newsSiteValues = EnumValues({
//   "NASA Spaceflight": NewsSite.NASA_SPACEFLIGHT,
//   "Spaceflight Now": NewsSite.SPACEFLIGHT_NOW,
//   "Space.com": NewsSite.SPACE_COM,
//   "SpaceNews": NewsSite.SPACE_NEWS
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//   }
// }
