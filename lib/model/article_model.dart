import 'package:headline/model/source_model.dart';
import 'package:headline/model/thumbnail_model.dart';

class Article {
  List<Source> source;
  ArticleImage urlToImage;
  String? title;
  String? description;
  String? url;
  String? publishedAt;

  Article({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['name'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      publishedAt: json['datePublished'] as String?,
      urlToImage: ArticleImage.fromJson(json["image"]),
      source:
          List<Source>.from(json["provider"].map((x) => Source.fromJson(x))),
    );
  }
}
