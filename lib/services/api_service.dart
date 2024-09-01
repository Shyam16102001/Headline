import 'dart:convert';
import 'package:headline/constants.dart';
import 'package:http/http.dart' as http;
import 'package:headline/model/article_model.dart';

class ApiService {
  Future<List<Article>> getArticle() async {
    final res = await http.get(
      Uri.parse(
          'https://google-news22.p.rapidapi.com/v1/top-headlines?country=in&language=en'),
      headers: {
        'Host': 'google-news22.p.rapidapi.com',
        'X-Rapidapi-Host': 'google-news22.p.rapidapi.com',
        'X-Rapidapi-Key': apiKey,
      },
    );
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List body = json["data"].cast<dynamic>();
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Server Error!!");
    }
  }
}
