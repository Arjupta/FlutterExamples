import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt/src/video.dart';
import 'package:yt/src/videoList.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/src': (context) => Video(),
      '/': (context) => MyApp(videos),
    },
  ));
}

class MyApp extends StatelessWidget {
  List<videoList> videos;
  MyApp(List<videoList> videos) {
    this.videos = videos;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('YT MODULE'),
          centerTitle: true,
          leading: Icon(Icons.video_library)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.grey[200],
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  title: Text('${videos[index].videoTitle}',
                      style: TextStyle(fontWeight: FontWeight.w300)),
                  leading: Image(
                    width: 60.0,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/play.jpg'),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/src',
                        arguments: {'index': index, 'list': videos});
                  },
                ));
          },
        ),
      ),
    );
  }
}
