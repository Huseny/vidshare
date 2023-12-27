import 'package:flutter/material.dart';
import 'package:vid_share/presentation/components/custom_bottom_sheet.dart';
import 'package:vid_share/presentation/components/custom_topbar.dart';
import 'package:vid_share/presentation/components/video_details_body.dart';

class VideoDetailedView extends StatefulWidget {
  const VideoDetailedView({super.key, required this.id});
  final String id;

  @override
  State<VideoDetailedView> createState() => _VideoDetailedViewState();
}

class _VideoDetailedViewState extends State<VideoDetailedView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: const CustomBottomSheet(),
          backgroundColor: const Color.fromRGBO(246, 237, 245, 1),
          body: Column(children: [
            const CustomTopBar(),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    hintText: "Search",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            VideoDetailsBody(
              id: widget.id,
            )
          ])),
    );
  }
}
