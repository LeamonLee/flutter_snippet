import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    )
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network("https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4");

    // initialize() 回傳的是一個void型別的Future, 
    // 如果是用stateless widget, 會使用futureBuilder 的snap.hasData來判斷資料是否已經成功讀取
    // 但這邊的future回傳的是void型態, 沒辦法判斷
    // 故這邊使用stateful widget
    
    // .then() 裡面的_ 要加否則會報錯
    _videoPlayerController.initialize().then((_){     
          setState(() {
            
          });
    });      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player Demo"),
      ),
      
      body: AspectRatio(
        aspectRatio: 1280/720,
        child: Stack(
          children: <Widget>[
            VideoPlayer(_videoPlayerController),
            Positioned(
              bottom: 0,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.play_arrow, size:30.0, color:Colors.white),
                    onTap: (){
                      setState((){
                        _videoPlayerController.play();
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(Icons.pause, size:30.0, color:Colors.white),
                    onTap: (){
                      setState((){
                        _videoPlayerController.pause();
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )
      
      // body: _videoPlayerController.value.initialized? 
      // AspectRatio(
      //   aspectRatio: _videoPlayerController.value.aspectRatio,    // aspectRatio會根據影片的寬度 來決定 高度
      //   child: VideoPlayer(_videoPlayerController),
      // ) 
      // :Container(),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.play_arrow),
      //   onPressed: (){
      //     setState(() {
      //       _videoPlayerController.play();
      //     });
      //   },
      // ),
    );
  }
}

