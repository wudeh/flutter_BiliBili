import 'dart:convert';

import 'package:bilibili/http/http.dart';
import 'package:crypto/crypto.dart';
import '../../model/video_url_model.dart';

class VideoService {
  // 获取视频地址
  static Future<VideoUrlModel> getUrl(String aid, String cid) async {
    print(aid);
    print(cid);
    String appserct = "aHRmhWMLkdeMuILqORnYZocwMBpMEOdt";
    String path = "https://app.bilibili.com/x/playurl";
    int ts = DateTime.now().millisecondsSinceEpoch;
    String data =
        "actionkey=appkey&aid=${aid}&appkey=iVGUTjsxvpLeuDCf&build=5490400&buvid=XZF9F55FE566C57599024A397F5F160E74DBE&cid=${cid}&device=android&expire=0&fnval=16&fnver=0&force_host=0&fourk=0&from_spmid=tm.recommend.0.0&mid=0&mobi_app=android&otype=json&platform=android&qn=32&spmid=main.ugc-video-detail.0.0&ts=$ts";
    String sign = md5.convert(utf8.encode(data + appserct)).toString();
    String url = "$path?$data&sign=$sign";
    print("这是获取视频地址的URL$url");

    Map<String, dynamic> aa = await HttpRequest.getInstance().get(url);
    return VideoUrlModel.fromJson(aa);
  //   var bb = aa;
  //   String cc = bb['data']['dash']['video'][0]['base_url'];
  //   // print(bb['data']['dash']);
  //   // print(bb['data']['dash']['audio']);
  //   url = cc;
  //   _controller = VideoPlayerController.network(url,
  //       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
  //     ..initialize().then((value) {
  //       setState(() {});
  //     });
  //   // await _controller.initialize();
  //   _controller.addListener(() {
  //     setState(() {
  //       // print(_controller.value.aspectRatio);
  //     });
  //   });
  //   audioUrl = bb['data']['dash']['audio'][0]['base_url'];
  //   _audioController = VideoPlayerController.network(audioUrl)
  //     ..initialize().then((value) {
  //       setState(() {});
  //     });
  //   _audioController.addListener(() {
  //     setState(() {});
  //   });
  //   print("============这是查找用户信息===============");
  //   // await HttpRequest.getInstance().get("http://api.bilibili.com/x/space/acc/info?mid=2");
  //   await HttpRequest.getInstance()
  //       .get("http://api.bilibili.com/x/space/acc/info?mid=2");
  }
}
