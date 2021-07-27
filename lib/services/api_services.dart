import 'dart:convert';

import 'package:http/http.dart';
import 'package:pocket_reader/models/article.dart';

class ApiService {
  final endpointUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=e55a7c5aa9324aa494f022d9dccd7957";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endpointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> article =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return article;
    } else {
      throw ("Cant get the Artcile");
    }
  }
}

class Categoryservice {
  Future<List<Article>> getCategory(String category) async {
    Response res = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=e55a7c5aa9324aa494f022d9dccd7957'));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> article =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return article;
    } else {
      throw ("Cant get the Artcile");
    }
  }
}
