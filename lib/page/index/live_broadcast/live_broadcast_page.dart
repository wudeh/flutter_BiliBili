import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LiveBroadcastPage extends StatefulWidget {

  LiveBroadcastPage({Key? key}) : super(key: key);

  _LiveBroadcastPageState createState() => _LiveBroadcastPageState();
}

class _LiveBroadcastPageState extends State<LiveBroadcastPage> with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive =>true;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text('直播'),
    );
  }
}