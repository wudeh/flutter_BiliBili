import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final bool expand;
  final TextStyle markerStyle;
  final String atName;

  const ExpandableText(this.text, {
    Key? key,
    required this.maxLines,
    required this.style,
    required this.markerStyle,
    this.expand = false,
    this.atName = '',
  }) : super(key: key);

  @override
  createState() => _ExpandableTextState();

}

class _ExpandableTextState extends State<ExpandableText> {

  late bool expand;
  late TextStyle style;
  late int maxLines;

  @override
  void initState() {
    expand = widget.expand;
    style = widget.style;
    maxLines = widget.maxLines;
    super.initState();
  }

  Widget buildOrdinaryText() {
    final text = widget.text;
    return LayoutBuilder(builder: (_, size) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
      );
      tp.layout(maxWidth: size.maxWidth);

      if (!tp.didExceedMaxLines) return Text(text, style: style);

      return Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(text, maxLines: expand ? null : widget.maxLines, style: style),
            GestureDetector(
              onTap: () {
                expand = !expand;
                (context as Element).markNeedsBuild();
              },
              child: Text(
                expand ? '收起' : '展开',
                style: widget.markerStyle,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildAtText() {
    return LayoutBuilder(builder: (_, size) {
      final tp = TextPainter(
        text: TextSpan(text: '回复 @${widget.text}：', style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
      );
      tp.layout(maxWidth: size.maxWidth);

      if (!tp.didExceedMaxLines) return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '回复 '),
            TextSpan(text: '@${widget.atName}', style: widget.markerStyle),
            TextSpan(text: '：${widget.text}'),
          ],
        ),
        style: style,
      );

      return Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '回复 '),
                  TextSpan(text: '@${widget.atName}', style: widget.markerStyle),
                  TextSpan(text: '：${widget.text}'),
                ],
              ),
              maxLines: expand ? null : widget.maxLines,
              style: style,
            ),
            GestureDetector(
              onTap: () {
                expand = !expand;
                (context as Element).markNeedsBuild();
              },
              child: Text(
                expand ? '收起' : '展开',
                style: widget.markerStyle,
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  build(context) => widget.atName == '' ? buildOrdinaryText() : buildAtText();
}
