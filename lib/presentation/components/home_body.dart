import 'package:flutter/material.dart';
import 'package:vid_share/presentation/components/video_widget.dart';
import 'package:vid_share/repository/models/post_model.dart';
import 'package:vid_share/repository/video/dummy.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key,});

  final List<PostModel> postModel = DummyData().generateDummyPosts(20);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: postModel.length,
        itemBuilder: (context, index) {
          return VideoView(post: postModel[index],);
        },
      ),
    );
  }
}