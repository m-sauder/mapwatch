class Coordinate {
  String title;
  String description;
  double latitude;
  double longitude;
  String image;

  Coordinate(
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.image,
  );

  Coordinate.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
        'image': image,
      };
}
