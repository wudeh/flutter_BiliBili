import 'dart:convert';

import 'package:bilibili/http/http.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class VideoInfo extends StatefulWidget {
  final aid;

  // 视频简介里的信息
  final info;

  VideoInfo({Key? key, required this.aid, required this.info})
      : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getVideoDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('我是简介'),
    );
  }
}
