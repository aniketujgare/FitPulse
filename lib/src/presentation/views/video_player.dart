// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// /// Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   final String url;
//   const VideoApp({super.key, required this.url});

//   @override
//   VideoAppState createState() => VideoAppState();
// }

// class VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url)
//       ..initialize().then((_) {
//         _controller.play();
//         _controller.setLooping(true);
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Center(
//       child: _controller.value.isInitialized
//           ? AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             )
//           : 
// Container(
//               height: 200,
//               width: screenWidth * 1,
//               decoration: const BoxDecoration(
//                   color: Colors.pinkAccent,
//                   borderRadius: BorderRadius.all(Radius.circular(18))),
//               child: const Center(child: CircularProgressIndicator()),
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     _controller.dispose();
//   }
// }
