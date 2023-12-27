import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vid_share/presentation/components/profile_avatar.dart';
import 'package:vid_share/repository/models/post_model.dart';
import 'package:vid_share/route_config/route_constants.dart';
import 'package:vid_share/utils/format_datetime.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed(RouteConstants.VIDEODETAILS,
              pathParameters: {'id': post.id});
        },
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.network(post.videoUrl),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ProfileAvatar(username: post.username, userImageUrl: post.userImageUrl),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  post.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          Text(
                            "${post.viewsCount} Views",
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.62)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          Text(post.location),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.av_timer,
                            color: Colors.black,
                          ),
                          Text(FormatDateTime().getTimeAgo(post.createdAt)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.sports_soccer,
                            color: Colors.black,
                          ),
                          Text(post.catagory),
                        ],
                      )
                    ],
                  )
                ],
              )
            ])
          ])
        ]),
      ),
    );
  }
}
