import 'dart:convert';

import 'package:http/http.dart';
import 'package:headline/model/article_model.dart';

int i = 1;

class ApiService {
  final endPointUrl =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=58d0ddbff78d4cfbb8902ddbf0deb719';
  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List body = json['articles'].cast<dynamic>();
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Server Error");
    }
  }
}
