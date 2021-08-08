import 'package:flutter/material.dart';

class HotRankPage extends StatefulWidget {

  HotRankPage({Key? key}) : super(key: key);

  _HotRankPageState createState() => _HotRankPageState();
}

class _HotRankPageState extends State<HotRankPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive =>true;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text('热门'),
    );
  }
}