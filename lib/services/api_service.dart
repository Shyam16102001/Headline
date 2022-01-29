import 'dart:convert';
import 'package:headline/constants.dart';
import 'package:http/http.dart' as http;
import 'package:headline/model/article_model.dart';

class ApiService {
  Future<List<Article>> getArticle() async {
    final res = await http.get(
      Uri.parse(
          'https://bing-news-search1.p.rapidapi.com/news?safeSearch=Off&textFormat=Raw'),
      headers: {
        "x-bingapis-sdk": "true",
        "x-rapidapi-host": "bing-news-search1.p.rapidapi.com",
        "x-rapidapi-key": apiKey,
      },
    );
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List body = json["value"].cast<dynamic>();
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Server Error!!");
    }
  }
}
