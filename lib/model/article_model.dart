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
        name: json['title'] as String?,
        url: json['url'] as String?,
        description: json['description'] as String?,
        publishedAt: json['date'] as String?,
        image: json['thumbnail'] as String?,
        source: json["source"]["name"] as String?);
  }
}
