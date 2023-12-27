class PostModel {
  const PostModel({
    required this.id,
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.location,
    required this.catagory,
    required this.viewsCount,
    required this.likes,
    required this.dislikes,
    required this.shares,
    required this.createdAt,
    required this.userId,
    required this.username,
    required this.userImageUrl,
  });

  final String id, videoUrl,
      title,
      description,
      location,
      catagory,
      userId,
      username,
      userImageUrl;
  final List<String> likes, dislikes;
  final int shares, viewsCount;
  final DateTime createdAt;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      videoUrl: json['videoUrl'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      catagory: json['catagory'],
      viewsCount: json['viewsCount'],
      likes: List<String>.from(json['likes']),
      dislikes: List<String>.from(json['dislikes']),
      shares: json['shares'],
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
      username: json['username'],
      userImageUrl: json['userImageUrl'],
    );
  }
}
