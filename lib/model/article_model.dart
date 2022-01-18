import 'package:headline/model/source_model.dart';
import 'package:headline/model/article_image_model.dart';

class Article {
  String? source;
  String? image;
  String? name;
  String? description;
  String? url;
  String? publishedAt;

  Article({
    required this.source,
    required this.name,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      name: json['name'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      publishedAt: json['datePublished'] as String?,
      image: ArticleImage.fromJson(json["image"]).thumbnail.contentUrl,
      source:
          List<Source>.from(json["provider"].map((x) => Source.fromJson(x)))[0]
              .name,
    );
  }
}
