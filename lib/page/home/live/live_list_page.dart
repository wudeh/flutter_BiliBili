import 'package:bilibili/page/common/extend_img.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:bilibili/icons/bilibili_icons.dart';
import "package:bilibili/model/LiveItem.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './live_play_page.dart';
// import 'package:flutter_MyBilibili/pages/me/LoginPage.dart';
import 'package:bilibili/util/MyMath.dart';
import 'package:bilibili/api/live_api.dart';
import '../../common/LineTools.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 首页的直播
class LiveListViewPage extends StatefulWidget {
  @override
  _LiveListViewPageState createState() => _LiveListViewPageState();
}

class _LiveListViewPageState extends State<LiveListViewPage>
    with AutomaticKeepAliveClientMixin<LiveListViewPage> {
  final List _list = [];
  ScrollController _listviewscrollController =
      ScrollController(); //listview的控制器
  RefreshController _refreshController=RefreshController(initialRefresh: true);
  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }
  @override
  void initState() {
    super.initState();
  }
  
  
 
  Future<void> _onRefresh() async {
    _list.clear();
    _list.addAll(await LiveApi.getLiveList());
    if (this.mounted) {
      _refreshController.refreshCompleted();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //直播按钮
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "我要直播",
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.pink[300],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: _refreshController.isRefresh == false
            ? buildLiveListView()
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget buildLiveListView() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _listviewscrollController,
      itemCount: _list.length,
      itemBuilder: (context, i) {
        if (_list[i] is LivePartition) {
          return buildLivePartition(_list[i]);
        } else if (_list[i] is Banners) {
          return buildBanners(_list[i]);
        } else if (_list[i] is AreaCard) {
          return buildAreaCard(_list[i]);
        } else {
          return Container();
        }
      },
    );
  }

  buildAreaCard(AreaCard areaCard) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5),
            itemCount: areaCard.list.length,
            itemBuilder: (context, i) {
              return Container(
                  child: Tab(
                // icon: Image.network(
                //   areaCard.list[i].cover,
                //   fit: BoxFit.fitWidth,
                // ),
                icon: ExtenedImage(
                  width: 40.w,
                  img: areaCard.list[i].cover,
                  notCircle: true,
                ),
                child: Text(
                  areaCard.list[i].title,
                  style: TextStyle(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ));
            },
          ),
        ),
        DrawLine.GreyLine(),
      ],
    );
  }

  buildLivePartition(LivePartition partition) {
    return Column(
      children: <Widget>[
        Container(
          // height: 40,
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text("${partition.name}"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 7, right: 7),
          child: GridView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                crossAxisCount: 2,
                childAspectRatio: 1.1),
            itemCount: partition.lives.length,
            itemBuilder: (BuildContext contex, int i) {
              return buildCard(partition.lives[i]);
            },
          ),
        ),
        DrawLine.GreyLine(),
      ],
    );
  }

  buildCard(LiveItem carditem) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => LivePlayPage(
        //       carditem.roomid.toString(),
        //       cover: carditem.face!,
        //       userName: carditem.uname!,
        //     ),
        //   ),
        // );
      },
      child: Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        // child: Image.network(
                        //   carditem.user_cover! + "@320w_200h",
                        //   fit: BoxFit.cover,
                        // ),
                        child: ExtenedImage(
                          width: 180.w,
                          img: carditem.user_cover!,
                          notCircle: true,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Color.fromRGBO(0, 0, 0, 0),
                                Colors.black45
                              ])),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  carditem.uname!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  maxLines: 1,
                                ),
                              ),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 18,
                                color: Colors.white,
                              ),
                              Text(
                                MyMath.intToString(carditem.online!),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  carditem.title!,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                  child: Text(
                    "${carditem.area_name}",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                    maxLines: 1,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  // 轮播图
  buildBanners(Banners banners) {
    return Container(
      height: 115.w,
      margin: EdgeInsets.only(left:10.w, top:10.w, right:10.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: Swiper(
          autoplay: true,
          itemCount: banners.list!.length,
          itemBuilder: (context, i) {
            return Container(
              child: ExtenedImage(
                width: 356.w,
                height: 94.w,
                img: banners.list![i].pic!,
                notCircle: true,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
