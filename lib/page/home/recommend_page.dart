import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import '../../api/api.dart';
import '../../http/http.dart';
import '../../model/recommend_model.dart';
import '../common/extend_img.dart';
import '../../route/navigator_util.dart';

final GlobalKey<_RecommendPageState> recommendPageKey = GlobalKey();

// 首页推荐页
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

  RefreshController _refreshController =
      RefreshController(initialRefresh: true); // 进入立刻刷新

  @override
  void initState() {
    super.initState();
    // getData();
    // 到底加载更多
    // _scrollController.addListener(() {
    //   // print(_scrollController.position.pixels);
    //   //   print(_scrollController.position.maxScrollExtent);
    //   if (_scrollController.position.pixels >=
    //       _scrollController.position.maxScrollExtent - 10.w) {

    //     if (isRequest == true) {
    //       return;
    //     }
    //     print('里面的监听到底了');
    //     isRequest = true;
    //     getDataUp();
    //   }
    // });
  }

  // 请求推荐数据，下拉
  Future getData() async {
    print("下拉更多");
    Map<String, dynamic> res =
        await HttpRequest.getInstance().get(Api.recommend);
    RecommendModel a = RecommendModel.fromJson(res);
    List<Items> b = [];
    b.addAll(a.data!.items!);
    b.addAll(recommendData);
    recommendData.clear();
    recommendData.addAll(b);
    setState(() {
      
    });
    _refreshController.refreshCompleted();
  }

  // 请求推荐数据，上拉
  void getDataUp() async {
    print("上拉更多");
    // if (isRequest) return;
    isRequest = true;
    Map<String, dynamic> res =
        await HttpRequest.getInstance().get(Api.recommend);
    RecommendModel a = RecommendModel.fromJson(res);
    recommendData.addAll(a.data!.items!);
    setState(() {
      
    });
    isRequest = false;
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                  padding: EdgeInsets.only(left: 12.w),
                  // color: Color.fromRGBO(0, 0, 0, 0.02),
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    // color: Theme.of(context).primaryColor,

                    controller: _refreshController,
                    onLoading: getDataUp,
                    onRefresh: getData,
                    child: ListView(
                      key: UniqueKey(),
                      // scrollDirection: Axis.vertical,
                      // controller: _scrollController,
                      physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
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
                                              children: e.threePointV2!
                                                  .map<Widget>((e) {
                                                // 添加到稍候再看
                                                if (e.type == 'watch_later') {
                                                  return Row(
                                                    children: [
                                                      ExtenedImage(
                                                        width: 20.w,
                                                        height: 20.w,
                                                        img: e.icon!,
                                                        notCircle: false,
                                                      ),
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                      Text(e.title!)
                                                    ],
                                                  );
                                                } else if (e.type ==
                                                    'feedback') {
                                                  // 反馈
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(e.title!),
                                                          SizedBox(
                                                            width: 8.w,
                                                          ),
                                                          Text('(选择后将优化首页此类内容)')
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                } else {
                                                  return Center(
                                                    child: Text('不感兴趣'),
                                                  );
                                                }
                                              }).toList(),
                                            ),
                                          );
                                        });
                                  },
                                  onTap: () {
                                    print(e.playerArgs);
                                    // 跳转到视频播放页
                                    NavigatorUtil.gotoVideoPage(
                                        context,
                                        e.playerArgs!.aid!.toString(),
                                        e.playerArgs!.cid.toString());
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
                                            ExtenedImage(
                                              width: 180.w,
                                              height: 106.w,
                                              img: e.cover!,
                                              notCircle: true,
                                            ),
                                            // 播放量，弹幕量，时长
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                padding: EdgeInsets.all(8.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // 播放量
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .live_tv_outlined,
                                                              size: 14.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                                width: 3.w),
                                                            Text(
                                                              e.coverLeftText1!,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                        // 弹幕量
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .message_outlined,
                                                              size: 12.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                                width: 3.w),
                                                            Text(
                                                              e.coverLeftText2!,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      e.coverRightText!,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.white),
                                                    )
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
                                          padding: EdgeInsets.only(
                                              left: 3.w,
                                              right: 3.w,
                                              top: 1.w,
                                              bottom: 1.w),
                                          child: Text(
                                            e.title!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13.sp),
                                          ),
                                        ),
                                        // up 信息
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.w)),
                                                  child: Text(
                                                    'UP',
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.black38),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Container(
                                                  width: 110.w,
                                                  child: Text(
                                                    e.args!.upName!,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.black38),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.more_vert,
                                              color: Colors.black38,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(), //存放数据的列表
                        )
                      ],
                    ),
                    // onRefresh: getData
                  ),
                )
             
    );
  }
}
