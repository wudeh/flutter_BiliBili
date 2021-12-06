import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {

  final aid;

  CommentPage({Key? key, required this.aid}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$widget.aid'),
    );
  }
}
