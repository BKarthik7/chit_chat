class UserStory {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool hasStory;

  UserStory({
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    required this.hasStory,
  });

  factory UserStory.fromJson(Map<String, dynamic> json) {
    return UserStory(
      name: json['name'],
      imageUrl: json['imageUrl'],
      isOnline: json['isOnline'],
      hasStory: json['hasStory'],
    );
  }
}
