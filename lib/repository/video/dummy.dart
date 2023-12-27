import 'dart:math';

import 'package:vid_share/repository/models/post_model.dart';

class DummyData {
  List<PostModel> generateDummyPosts(int count) {
  List<PostModel> dummyPosts = [];

  for (int i = 1; i <= count; i++) {
    dummyPosts.add(PostModel(
      id: "$i",
      videoUrl: 'https://picsum.photos/640/360',
      title: 'Lorem Ipsum Video $i',
      description: 'This is a dummy video description for Video $i.',
      location: 'City $i',
      catagory: 'Category $i',
      viewsCount: Random().nextInt(5000),
      likes: generateRandomUserIds(),
      dislikes: generateRandomUserIds(),
      shares: Random().nextInt(100),
      createdAt: DateTime.now().subtract(Duration(days: Random().nextInt(10))),
      userId: 'user$i',
      username: 'user$i',
      userImageUrl: 'https://picsum.photos/200/300',
    ));
  }

  return dummyPosts;
}

List<String> generateRandomUserIds() {
  List<String> userIds = [];
  int numberOfLikes = Random().nextInt(20); // Maximum 20 likes/dislikes for simplicity

  for (int i = 0; i < numberOfLikes; i++) {
    userIds.add('user${Random().nextInt(100)}');
  }

  return userIds;
}
}