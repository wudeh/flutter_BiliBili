import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../page/video/index.dart';

Handler videoHandle = Handler(
  handlerFunc: (BuildContext? context,Map<String,List<String>> params){
    var aid = params['aid']?.first;
    var cid = params['cid']?.first;
    return VideoPage(aid: aid, cid: cid,);
  }
);