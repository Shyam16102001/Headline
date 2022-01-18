// class Source {
//   String? id;
//   String? name;
//   Source({required this.id, required this.name});
//   factory Source.fromJson(Map<String, dynamic> json) {
//     print(json);
//     return Source(id: json['id'], name: json['name']);
//   }
// }

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
