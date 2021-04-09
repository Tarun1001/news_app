import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:musicmain/model/product.dart';

class Networking {
  Newsdata newsdataFromJson(String str) => Newsdata.fromJson(json.decode(str));

  Future<Newsdata> fetchProducts() async {
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=541e33ffb11c4b259e22ee3403931bfd");
    if (response.statusCode == 200) {
      print(response.body);
      return newsdataFromJson(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
