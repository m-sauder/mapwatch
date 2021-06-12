import 'dart:typed_data';

class Coordinate {
  String id;
  String title;
  String description;
  Uint8List image;

  Coordinate(
    this.id,
    this.title,
    this.description,
    this.image,
  );

  Coordinate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
      };
}
