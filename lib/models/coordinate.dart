import 'dart:typed_data';

class Coordinate {
  String id;
  String title;
  String description;
  double latitude;
  double longitude;
  String image;

  Coordinate(
    this.id,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.image,
  );

  Coordinate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
        'image': image,
      };
}
