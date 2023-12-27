import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:vid_share/presentation/components/custom_topbar.dart';
import 'package:video_player/video_player.dart';

class PostVideo extends StatefulWidget {
  const PostVideo({super.key, required this.path, required this.location});

  final String path, location;

  @override
  State<PostVideo> createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {
  // late VideoPlayerController _videoPlayerController;
  // FlickManager? flickManager;
  TextEditingController titleController = TextEditingController();
  TextEditingController catagoryController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _videoPlayerController = VideoPlayerController.file(File(widget.path));
    // flickManager = FlickManager(videoPlayerController: _videoPlayerController);

    super.initState();
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(212, 212, 212, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomTopBar(),
          // Container(
          //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
          //     height: MediaQuery.of(context).size.height * .6,
          //     width: MediaQuery.of(context).size.width,
          //     child: FlickVideoPlayer(flickManager: flickManager!)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5)),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const Text(
                  "Info",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return "Title cannot be empty";
                  },
                  controller: titleController,
                  decoration: const InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: catagoryController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return "Catagory cannot be empty";
                  },
                  decoration: const InputDecoration(
                      hintText: "Catagory",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return "Description cannot be empty";
                  },
                  maxLines: 7,
                  maxLength: 300,
                  decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Dialog(
                              child: Center(
                                child: Text("Video Uploaded Successfully"),
                              ),
                            );
                          });
                    },
                    child: const Text("Post"))
              ]),
            ),
          )
        ]),
      ),
    ));
  }
}
