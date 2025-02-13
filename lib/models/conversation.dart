class Conversation {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool hasStory;
  final String message;
  final String time;

  Conversation({
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    required this.hasStory,
    required this.message,
    required this.time,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      name: json['name'],
      imageUrl: json['imageUrl'],
      isOnline: json['isOnline'],
      hasStory: json['hasStory'],
      message: json['message'],
      time: json['time'],
    );
  }
}
