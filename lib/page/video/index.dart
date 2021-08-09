import 'dart:convert';

import 'package:bilibili/http/http.dart';
import 'package:chewie/chewie.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chewie_audio/chewie_audio.dart';

class VideoPage extends StatefulWidget {
  final aid;
  final cid;

  VideoPage({Key? key,required this.aid,required this.cid}) : super(key: key);

  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

   late VideoPlayerController _controller;
   late VideoPlayerController _audioController;

  // late ChewieController _chewieController;

   

    String url = '';

  late String audioUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _audioController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    getUrl();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _audioController.dispose();
    // player.dispose();
  }


  // 获取视频地址
  void getUrl() async {
    print(widget.aid);
    print(widget.cid);
    String appserct="aHRmhWMLkdeMuILqORnYZocwMBpMEOdt";
    String path="https://app.bilibili.com/x/playurl";
    int ts=DateTime.now().millisecondsSinceEpoch;
    String data="actionkey=appkey&aid=${widget.aid}&appkey=iVGUTjsxvpLeuDCf&build=5490400&buvid=XZF9F55FE566C57599024A397F5F160E74DBE&cid=${widget.cid}&device=android&expire=0&fnval=16&fnver=0&force_host=0&fourk=0&from_spmid=tm.recommend.0.0&mid=0&mobi_app=android&otype=json&platform=android&qn=32&spmid=main.ugc-video-detail.0.0&ts=$ts";
    String sign=md5.convert(utf8.encode(data+appserct)).toString();
    String url="$path?$data&sign=$sign";
    
    String aa = await HttpRequest.getInstance().get(url);
    var bb = jsonDecode(aa);
    String cc =  bb['data']['dash']['video'][0]['base_url'];
    // print(bb['data']['dash']);
    // print(bb['data']['dash']['audio']);
    url = cc;
    _controller = VideoPlayerController.network(url,videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))..initialize().then((value){
      setState(() {
        
      });
    });
    // await _controller.initialize();
    _controller.addListener(() {
          setState(() {
            print('刷新刷新');
          });
        });
    audioUrl = bb['data']['dash']['audio'][0]['base_url'];
    _audioController = VideoPlayerController.network(audioUrl)..initialize().then((value){
      setState(() {
        
      });
    });
    _audioController.addListener(() {
          setState(() {
            print('audio刷新刷新');
          });
        });
    
  }

  // 控制音频和视频播放 暂停
  playOrStop() async {
      if(_audioController.value.isPlaying) {
        await _audioController.pause();
        await _controller.pause();
        
      }else {
        await _audioController.play();
        await _controller.play();
        
      }
  }

  @override
  Widget build(BuildContext context) {
    // final chewieController = ChewieController(
    //   videoPlayerController: _controller,
    //   autoPlay: false,
    //   looping: true,
    // );
    return Material(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
                  
                  Row(
                    children: [
                      // 暂停播放图标
                      InkWell(
                          onTap: () {
                            playOrStop();
                          },
                          child: Icon(
                            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white70,
                          ), 
                        ),
                      // 进度条
                      Container(
                        width: 300.w, 
                        child: VideoProgressIndicator(
                          _controller, 
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            // 已播放过的进度条颜色
                            playedColor: Theme.of(context).primaryColor
                          ),),
                      )
                    ], 
                  ) 
                ], 
              )
            )
          ], 
        ),
      ), 
    );
  }
}
