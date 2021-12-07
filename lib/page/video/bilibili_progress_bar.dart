import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class BilibiliVideoProgressBar extends StatefulWidget {
  BilibiliVideoProgressBar(this.videoController,
      {required ChewieProgressColors colors,
      required this.audioController,
      required this.onDragEnd,
      required this.onDragStart,
      required this.onDragUpdate,
      required this.onSeekToRelativePosition})
      : colors = colors ?? ChewieProgressColors();

  final VideoPlayerController videoController;
  final VideoPlayerController audioController;
  final ChewieProgressColors colors;
  final Function() onDragStart;
  final Function() onDragEnd;
  final Function() onDragUpdate;
  final Function(Duration posstion) onSeekToRelativePosition;

  @override
  _VideoProgressBarState createState() {
    return _VideoProgressBarState();
  }
}

class _VideoProgressBarState extends State<BilibiliVideoProgressBar> {
  _VideoProgressBarState() {
    listener = () {
      if(mounted){
        setState(() {
        });
      }
    };
  }

  late VoidCallback listener;
  bool _controllerWasPlaying = false;
  bool _isDrag = false;
  
  Duration _duration = Duration(seconds:1);

  VideoPlayerController get videoController => widget.videoController;
  VideoPlayerController get audioController => widget.audioController;

  @override
  void initState() {
    super.initState();
    listener = () {
      if(mounted){
        setState(() {
        });
      }
    };
    videoController.addListener(listener);
  }

  @override
  void deactivate() {
    videoController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    void seekToRelativePosition(Offset globalPosition) {
      final box = context.findRenderObject() as RenderBox;
      final Offset tapPos = box.globalToLocal(globalPosition);
      final double relative = tapPos.dx / box.size.width;
      final Duration position = videoController.value.duration * relative;
      //print("videoController.seekTo($position)");
      videoController.seekTo(position);
      if (widget.onSeekToRelativePosition != null) {
        widget.onSeekToRelativePosition(position);
      }
    }
    Duration _calDuration(Offset offset){
      final box = context.findRenderObject() as RenderBox;
      final Offset tapPos = box.globalToLocal(offset);
      final double relative = tapPos.dx / box.size.width;
      return videoController.value.duration * relative;

    }

    return GestureDetector(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: CustomPaint(
            painter: _ProgressBarPainter(
              videoController.value,
              widget.colors,
            ),
          ),
        ),
      ),
      onHorizontalDragStart: (DragStartDetails details) {
        // if (!videoController.value.initialized) {
        //   return;
        // }
        // _controllerWasPlaying = videoController.value.isPlaying;
        // if (_controllerWasPlaying) {
        //   videoController.pause();
        // }
        // if (audioController?.value?.isPlaying??false) {
        //   audioController.pause();
        // }
        if (widget.onDragStart != null) {
          widget.onDragStart();
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        // if (!videoController.value.initialized) {
        //   return;
        // }
        // _duration=_calDuration(details.globalPosition);
        // _isDrag=true;
        if (widget.onDragUpdate != null) {
          widget.onDragUpdate();
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) async{
        // await videoController.seekTo(_duration);
        // await audioController?.seekTo(_duration);
        // if(!videoController.value.isPlaying){
        //   await videoController.play();
        // }
        // if(audioController!=null&&!audioController.value.isPlaying){
        //   await audioController.play();
        // }
        // if (widget.onDragEnd != null) {
        //   widget.onDragEnd();
        // }
        // _isDrag=false;
      },
      onTapDown: (TapDownDetails details) async{
        print("onTapDown");
        if (!videoController.value.isInitialized) {
          return;
        }
        await audioController.pause();
        _duration=_calDuration(details.globalPosition);
        await videoController.seekTo(_duration);
        await audioController?.seekTo(_duration);
        if(!videoController.value.isPlaying){
          await videoController.play();
        }
        if(audioController!=null&&!audioController.value.isPlaying){
          await audioController.play();
        }
        print("change ok");
      },
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  _ProgressBarPainter(this.value, this.colors,);

  VideoPlayerValue value;
  ChewieProgressColors colors;

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final height = 2.0;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, size.height / 2),
          Offset(size.width, size.height / 2 + height),
        ),
        Radius.circular(4.0),
      ),
      colors.backgroundPaint,
    );
    if (!value.isInitialized) {
      return;
    }
    final double playedPartPercent =
        value.position.inMilliseconds / value.duration.inMilliseconds;
    final double playedPart =
        playedPartPercent > 1 ? size.width : playedPartPercent * size.width;
    for (DurationRange range in value.buffered) {
      final double start = range.startFraction(value.duration) * size.width;
      final double end = range.endFraction(value.duration) * size.width;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromPoints(
            Offset(start, size.height / 2),
            Offset(end, size.height / 2 + height),
          ),
          Radius.circular(4.0),
        ),
        colors.bufferedPaint,
      );
    }
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, size.height / 2),
          Offset(playedPart, size.height / 2 + height),
        ),
        Radius.circular(4.0),
      ),
      colors.playedPaint,
    );
    canvas.drawCircle(
      Offset(playedPart, size.height / 2 + height / 2),
      height * 3,
      colors.handlePaint,
    );
  }
}
