import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../page/404.dart';


// handle
import './handle/video_handle.dart';
// handle ---end

class Routes {
  static String root = '/'; // 首页
  static String video = '/video'; // 进入视频播放页面
  static String error = '/error'; // 进入错误页面
  

  static void configureRoutes(FluroRouter router) {
    // 定义404
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return NotFoundPage();
    });

    // 定义路由
    router.define(video, handler: videoHandle);
  }
}