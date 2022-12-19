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
    this.source,
    this.name,
    this.description,
    this.url,
    this.image,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      name: json['name'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      publishedAt: json['datePublished'] as String?,
      image: json['image'] != null
          ? ArticleImage.fromJson(json['image']).thumbnail.contentUrl
          : null,
      source:
          List<Source>.from(json["provider"].map((x) => Source.fromJson(x)))[0]
              .name,
    );
  }
}
