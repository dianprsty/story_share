class Post {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final String avatarUrl;
  final String createdAt;
  final double lat;
  final double lon;

  Post({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.avatarUrl,
    required this.createdAt,
    required this.lat,
    required this.lon,
  });
}
