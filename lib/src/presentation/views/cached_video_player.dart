import 'package:flutter/material.dart';
import 'package:cached_video_player/cached_video_player.dart';

class WorkoutVideoPlayer extends StatefulWidget {
  const WorkoutVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  final String videoUrl;

  @override
  State<WorkoutVideoPlayer> createState() => _WorkoutVideoPlayerState();
}

class _WorkoutVideoPlayerState extends State<WorkoutVideoPlayer> {
  late CachedVideoPlayerController controller;
  @override
  void initState() {
    controller = CachedVideoPlayerController.network(widget.videoUrl);
    controller.initialize().then((value) {
      controller.play();
      controller.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CachedVideoPlayer(controller))
            : Container(
                height: 200,
                width: screenWidth * 1,
                decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: const Center(child: CircularProgressIndicator()),
              )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
