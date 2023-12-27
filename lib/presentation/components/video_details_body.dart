import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:vid_share/presentation/components/profile_avatar.dart';
import 'package:vid_share/repository/models/post_model.dart';
import 'package:vid_share/repository/video/dummy.dart';
import 'package:video_player/video_player.dart';

class VideoDetailsBody extends StatefulWidget {
  const VideoDetailsBody({super.key, required this.id});
  final String id;

  @override
  State<VideoDetailsBody> createState() => _VideoDetailsBodyState();
}

class _VideoDetailsBodyState extends State<VideoDetailsBody> {
  late FlickManager flickManager;
  bool isInitialized = false;
  late PostModel postModel;

  @override
  void initState() {
    postModel = getVideoById(widget.id);
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      ),
    );
    setState(() {
      isInitialized = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  PostModel getVideoById(String id) {
    return DummyData().generateDummyPosts(1)[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: isInitialized
                  ? Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FlickVideoPlayer(flickManager: flickManager),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Text(
                    postModel.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text("Like")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_down,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text("DisLike")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text("Share")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ProfileAvatar(
                      username: postModel.username,
                      userImageUrl: postModel.userImageUrl),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(228, 228, 228, 1)),
                        child: Text(
                          postModel.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 15),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
