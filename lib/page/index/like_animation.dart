import 'package:flutter/material.dart';

class LikeAnimationPage extends StatefulWidget {

  LikeAnimationPage({Key? key}) : super(key: key);

  _LikeAnimationPageState createState() => _LikeAnimationPageState();
}

class _LikeAnimationPageState extends State<LikeAnimationPage> with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive =>true;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text('追番'),
    );
  }
}