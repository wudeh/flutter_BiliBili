import 'dart:convert';
import 'dart:math';

import 'package:bilibili/http/http.dart';
import 'package:bilibili/model/video_url_model.dart';
import 'package:chewie/chewie.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import './video_info.dart';
import './comment.dart';
import './video_service.dart';

class VideoPage extends StatefulWidget {
  final aid;
  final cid;

  VideoPage({Key? key, required this.aid, required this.cid}) : super(key: key);

  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late VideoPlayerController _audioController;

  late TabController _tabController;

  // 视频流地址
  String url = '';
  // 音频流地址
  String audioUrl = "";

  // 视频简介需要的信息
  var info;

  // 评论数量
  int commentNum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _audioController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    getUrl();
    _getVideoDetail();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _audioController.dispose();
    _tabController.dispose();
    // player.dispose();
  }

  // 获取视频地址
  void getUrl() async {
    VideoUrlModel aa = await VideoService.getUrl(widget.aid, widget.cid);
    var bb = aa;
    url = bb.data!.dash!.video![0].baseUrl!;
    _controller = VideoPlayerController.network(url,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((value) {
        setState(() {});
      });
    // await _controller.initialize();
    _controller.addListener(() {
      setState(() {
        // print(_controller.value.aspectRatio);
      });
      // 如果视频没播放，音频也要暂停
      // if (!_controller.value.isBuffering) Stop();
    });
    audioUrl = bb.data!.dash!.audio![0].baseUrl!;
    _audioController = VideoPlayerController.network(audioUrl)
      ..initialize().then((value) {
        setState(() {});
      });
    _audioController.addListener(() {
      setState(() {});
      // 如果视频没播放，音频也要暂停
      // if (!_audioController.value.isBuffering) Stop();
    });
    print("============这是查找用户信息===============");
    // await HttpRequest.getInstance().get("http://api.bilibili.com/x/space/acc/info?mid=2");
    await HttpRequest.getInstance()
        .get("http://api.bilibili.com/x/space/acc/info?mid=2");
  }

  // 获取视频信息
  Future<void> _getVideoDetail() async {
    String appserct = "560c52ccd288fed045859ed18bffd973";
    String path = "https://app.bilibili.com/x/v2/view";
    String data =
        "aid=${widget.aid}&appkey=1d8b6e7d45233436&build=5480400&ts=${DateTime.now().millisecondsSinceEpoch}";
    String sign = md5.convert(utf8.encode(data + appserct)).toString();
    String url = "$path?$data&sign=$sign";
    try {
      Map<String, dynamic> res = await HttpRequest.getInstance().get(url);
      print("这是视频信息$url");
      print(res);
      info = res;
    } catch (e) {
      print(e.toString());
      print("获取视频详情");
      return null;
    }
  }

  // 控制音频和视频播放 暂停
  playOrStop() async {
    if (_controller.value.isPlaying) {
      Stop();
    } else {
      await _audioController.play();
      await _controller.play();
    }
  }

  // 暂停播放
  void Stop() async {
    await _audioController.pause();
    await _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: ExtendedNestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              // 视频播放区域
              SliverToBoxAdapter(
                  child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(
                          height: 375.w / 1.777777,
                        ),
                  Row(
                    children: [
                      // 暂停播放图标
                      InkWell(
                        onTap: () {
                          playOrStop();
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
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
                              playedColor: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  )
                ],
              )),
              SliverPersistentHeader(
                pinned: true, //是否固定在顶部
                floating:
                    false, // 为 true 时吸顶会定位到顶部，不管上面有没有存在另一个吸顶的组件；false 时会吸顶到上面吸顶组件的下面
                delegate: _SliverAppBarDelegate(
                    minHeight: 50.h, //收起的高度
                    maxHeight: 50.h, //展开的最大高度
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w),
                      height: 50.h,
                      width: 375.w,
                      color: Colors.white,
                      child: Row(
                        children: [
                          // 首页 tabbar
                          Container(
                            width: 120.w,
                            child: TabBar(
                                controller: _tabController,
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: Theme.of(context).primaryColor,
                                unselectedLabelColor: Colors.black,
                                indicatorColor: Theme.of(context).primaryColor,
                                labelStyle: TextStyle(color: Colors.white),
                                tabs: <Widget>[
                                  Tab(text: '简介'),
                                  Tab(text: '评论'),
                                ]),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          Container(
                            height: 40.w,
                            width: 80.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40.w),
                            ),
                            child: Text(
                              "点我发弹幕",
                              style: TextStyle(color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ];
          },
          body: TabBarView(controller: _tabController, children: [
            VideoInfo(
              aid: widget.aid,
              info: info,
            ),
            CommentPage(aid: widget.aid)
          ]),
        ),
      ),
    );
  }
}

// 吸顶组件
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
