import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt/src/videoList.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/rendering.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  nextVideo() {
    if (index == videos.length - 1) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("You have reached the end"),
      ));
    } else {
      setState(() {
        index += 1;
      });
    }
  }

  List<videoList> videos;
  videoList video;
  int index;
  Map<String, dynamic> data = {};
  YoutubePlayerController controller;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      data = ModalRoute.of(context).settings.arguments;
      this.index = data['index'];
      this.videos = data['list'];
    }
    this.video = this.videos[index];
    controller = new YoutubePlayerController(
      initialVideoId: video.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              '${video.videoTitle}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: YoutubePlayer(
//              onEnded: nextVideo(),
              key: ObjectKey(controller),
              controller: controller,
              actionsPadding: const EdgeInsets.only(left: 16.0),
              bottomActions: [
                CurrentPosition(),
                const SizedBox(width: 10.0),
                ProgressBar(isExpanded: true),
                const SizedBox(width: 10.0),
                RemainingDuration(),
                FullScreenButton(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Text(
              '${video.videoDesc}',
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.lime,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextVideo();
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
