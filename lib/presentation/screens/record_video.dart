import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:vid_share/presentation/components/custom_topbar.dart';
import 'package:vid_share/repository/location/location_services.dart';
import 'package:vid_share/route_config/route_constants.dart';
import 'package:video_player/video_player.dart';

class RecordVideo extends StatefulWidget {
  const RecordVideo({super.key});

  @override
  State<RecordVideo> createState() => _RecordVideoState();
}

class _RecordVideoState extends State<RecordVideo> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late VideoPlayerController _videoPlayerController;
  bool isRecording = false;
  bool isPaused = false;
  bool isStopped = false;
  LocationService locationService = LocationService();
  String? currentLocation;
  FlickManager? flickManager;
  late XFile videoFile;

  @override
  void initState() {
    super.initState();
    _getLocation();

    _controller = CameraController(
      const CameraDescription(
        name: "0",
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 1,
      ),
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _getLocation() async {
    String? placeName = await locationService.getPlaceName();
    setState(() {
      currentLocation = placeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(246, 237, 245, 1),
            body: Column(children: [
              const CustomTopBar(),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  return Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: isStopped
                          ? FlickVideoPlayer(
                              flickManager: flickManager!,
                            )
                          : snapshot.connectionState == ConnectionState.done
                              ? CameraPreview(_controller)
                              : const Center(
                                  child: CircularProgressIndicator()),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_controller.value.isInitialized) {
                                if (isRecording) {
                                  await _controller.pauseVideoRecording();
                                  setState(() {
                                    isRecording = false;
                                    isPaused = true;
                                  });
                                } else if (isPaused) {
                                  await _controller.resumeVideoRecording();
                                  setState(() {
                                    isRecording = true;
                                    isPaused = false;
                                  });
                                } else {
                                  await _controller.startVideoRecording();
                                  setState(() {
                                    isRecording = true;
                                    isPaused = false;
                                  });
                                }
                              }
                            },
                            child: Icon(
                                isRecording ? Icons.pause : Icons.play_arrow),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_controller.value.isRecordingVideo) {
                                videoFile =
                                    await _controller.stopVideoRecording();
                                File file = File(videoFile.path);
                                _videoPlayerController =
                                    VideoPlayerController.file(file);
                                flickManager = FlickManager(
                                    videoPlayerController:
                                        _videoPlayerController);
                                setState(() {
                                  isRecording = false;
                                  isPaused = false;
                                  isStopped = true;
                                });
                              }
                            },
                            child: const Icon(Icons.stop),
                          ),
                        ],
                      ),
                    ),
                    isStopped
                        ? Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (currentLocation != null) {
                                        GoRouter.of(context).pushNamed(
                                            RouteConstants.POSTVIDEO,
                                            pathParameters: {
                                              'location': currentLocation!,
                                              "path": videoFile.path
                                            });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Text(
                                      "Post",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ]);
                },
              )
            ])));
  }
}
