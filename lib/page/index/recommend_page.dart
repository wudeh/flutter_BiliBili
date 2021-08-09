import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api/api.dart';
import '../../http/http.dart';
import '../../model/recommend_model.dart';
import '../common/extend_img.dart';
import '../../route/navigator_util.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage({Key? key}) : super(key: key);

  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  List<Items> recommendData = [];

  late StreamController _streamController = StreamController.broadcast();

  ScrollController _scrollController = new ScrollController();

  bool isRequest = false;

  @override
  void initState() {
    super.initState();
    _streamController.add('loading');
    getData();
    // 到底加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100.w) {
        if (isRequest == true) {
          return;
        }
        print('到底了');
        isRequest = true;
        getDataUp();
      }
    });
    
  }

  // 请求推荐数据，下拉
  Future getData() async {
    String res = await HttpRequest.getInstance().get(Api.recommend);
    RecommendModel a = RecommendModel.fromJson(jsonDecode(res));
    List<Items> b = [];
    b.addAll(a.data!.items!);
    b.addAll(recommendData);
    recommendData.clear();
    recommendData.addAll(b);
    _streamController.add(recommendData);


    
  }

  // 请求推荐数据，上拉
  void getDataUp() async {
    String res = await HttpRequest.getInstance().get(Api.recommend);
    RecommendModel a = RecommendModel.fromJson(jsonDecode(res));
    recommendData.addAll(a.data!.items!);
    _streamController.add(recommendData);
    isRequest = false;
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case (ConnectionState.waiting):
              return Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ), 
              );
              break;
            case ConnectionState.active:
              if(snapshot.data == 'loading'){
                return CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              );
              }else {
                return Container(
                  padding: EdgeInsets.only(left: 12.w),
                  margin: EdgeInsets.only(bottom: 250.w),
                  height: 800.w,
                  color: Color.fromRGBO(0, 0, 0, 0.02),
                  child: RefreshIndicator(
                    color: Theme.of(context).primaryColor,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      controller: _scrollController,
                      children: [
                        Wrap(
                      direction: Axis.horizontal,
                      spacing: 10.w,
                      runSpacing: 10.w,
                      children: recommendData.map<Widget>((e) {
                        return Material(
                          color: Colors.white,
                          child: Ink(
                            color: Colors.white, 
                            child: InkWell(
                              onLongPress: () {
                                // 长按弹出底部信息
                                showModalBottomSheet(
                                  context: context, 
                                  builder: (context) {
                                    return Container(
                                      height: 330.h,
                                      padding: EdgeInsets.all(10.w),
                                      child: ListView(
                                        children: e.threePointV2!.map<Widget>((e){
                                          // 添加到稍候再看
                                          if(e.type == 'watch_later') {
                                            return Row(
                                              children: [
                                                ExtenedImage(width: 20.w,height: 20.w,img: e.icon!, notCircle: false,),
                                                SizedBox(width: 20.w,),
                                                Text(e.title!)
                                              ],
                                            );
                                          }else if(e.type == 'feedback'){
                                            // 反馈
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(e.title!),
                                                SizedBox(width: 8.w,),
                                                Text('(选择后将优化首页此类内容)')
                                                  ], 
                                                )
                                              ],
                                            );
                                          }else {
                                            return Center(
                                              child: Text('不感兴趣'),
                                            );
                                          }
                                        }).toList(), 
                                      ),
                                    );
                                  }
                                  
                                  );
                              }, 
                              onTap: () {
                                // 跳转到视频播放页
                                NavigatorUtil.gotoVideoPage(context, e.playerArgs!.aid!.toString(), e.playerArgs!.cid.toString());
                              },
                              child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: 170.w,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(10.w),
                            // boxShadow: [
                            //   BoxShadow(
                            //     offset: Offset(1, 1),//x,y轴
                            //     color: Colors.black26,//投影颜色
                            //     blurRadius: 1//投影距离
                            //   )
                            // ]
                            // border: Border.all(width: 1,color: Colors.black)
                          ),
                          child: Column(
                            children: [
                              // 封面
                              Stack(
                                children: [
                                  ExtenedImage(width: 180.w, height: 106.w, img: e.cover!,notCircle: true,),
                                  // 播放量，弹幕量，时长
                                  Positioned(
                                    bottom: 0, 
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(8.w), 
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // 播放量
                                            Row(
                                              children: [
                                                Icon(Icons.live_tv_outlined,size: 14.sp,color: Colors.white,),
                                                SizedBox(width: 3.w),
                                                Text(e.coverLeftText1!, style: TextStyle(fontSize: 12.sp,color: Colors.white),)
                                              ], 
                                            ),
                                            SizedBox(width: 8.w,),
                                            // 弹幕量
                                            Row(
                                              children: [
                                                Icon(Icons.message_outlined,size: 12.sp,color: Colors.white,),
                                                SizedBox(width: 3.w),
                                                Text(e.coverLeftText2!, style: TextStyle(fontSize: 12.sp,color: Colors.white),)
                                              ], 
                                            ),
                                          ], 
                                        ),
                                        Text(e.coverRightText!, style: TextStyle(fontSize: 12.sp,color: Colors.white),)
                                      ], 
                                    ),
                                    ),
                                  )
                                ], 
                              ),
                              // 标题
                              Container(
                                height: 42.sp, 
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left:3.w, right: 3.w, top: 1.w,bottom: 1.w),
                                child: Text(e.title!,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13.sp),),
                              ),
                              // up 信息
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 8.w,),
                                      Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26
                                      ),
                                      borderRadius: BorderRadius.circular(3.w)
                                    ), 
                                    child: Text('UP', style: TextStyle(fontSize: 12.sp,color: Colors.black38),),
                                  ),
                                  SizedBox(width: 8.w,),
                                  Container(
                                    width: 110.w,
                                    child: Text(e.args!.upName!,maxLines: 1,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp,color: Colors.black38),), 
                                  ),
                                    ],
                                  ),
                                  Icon(Icons.more_vert, color: Colors.black38,)
                                ], 
                              )
                            ], 
                          ),
                        ),
                            ),
                          ),
                        );
                      }).toList(),//存放数据的列表
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Theme.of(context).primaryColor,
                      ), 
                    )
                      ], 
                    ),
                  onRefresh: getData
                ),
                );
              }
            default:
             return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
