import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExtenedImage extends StatefulWidget {
  double width;
  double? height;
  String img;
  bool notCircle; // 是不是圆形图片
  bool haveBorderRadius; // 要不要圆角

  ExtenedImage({Key? key,required this.width,this.height,required this.img,required this.notCircle, this.haveBorderRadius = true}) : super(key: key);

  _ExtenedImageState createState() => _ExtenedImageState();
}

class _ExtenedImageState extends State<ExtenedImage> {

  @override
  Widget build(BuildContext context) {
    return widget.img != "" ? ExtendedImage.network(
                widget.img,
                width: widget.width,
                fit: BoxFit.contain,
                shape: widget.notCircle ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: widget.haveBorderRadius ? BorderRadius.all(Radius.circular(10.0.w)) : BorderRadius.all(Radius.circular(0)),
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return Image.asset(
                        "assets/images/loading.png",
                        width: widget.width,
                        height: widget.height,
                      );
                      break;
                    ///if you don't want override completed widget
                    ///please return null or state.completedWidget
                    //return null;
                    //return state.completedWidget;
                    case LoadState.completed:
                      return ExtendedRawImage(
                          image: state.extendedImageInfo?.image,
                          width: widget.width,
                          height: widget.height,
                          fit: BoxFit.fitWidth,
                        );
                      break;
                    case LoadState.failed:
                      return GestureDetector(
                        child: Center(child: Icon(Icons.error_outline),),
                        onTap: () {
                          state.reLoadImage();
                        },
                      );
                      break;
                  }
                },
              ) : Image.asset(
                        "assets/images/loading.png",
                        width: widget.width,
                        height: widget.height,
                      );
  }
}