class ArticleImage {
  ArticleImage({
    required this.thumbnail,
  });

  Thumbnail thumbnail;

  factory ArticleImage.fromJson(Map<String, dynamic> json) {
    return ArticleImage(
      thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    );
  }
}

class Thumbnail {
  Thumbnail({
    required this.contentUrl,
  });

  String contentUrl;

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      contentUrl: json["contentUrl"],
    );
  }
}
