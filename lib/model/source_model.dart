class Source {
  Source({
    required this.name,
  });

  String name;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json["name"],
    );
  }
}
