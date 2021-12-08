import 'dart:math';

import 'package:bilibili/page/home/hot_list_page.dart';
import 'package:bilibili/page/home/live/live_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'recommend_page.dart';
import '../index/live_broadcast/live_broadcast_page.dart';
import '../index/like_animation.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  ScrollController _scrollController = new ScrollController();

  // GlobalKey<ExtendedNestedScrollViewState> nestScrollKey = GlobalKey();

  // ScrollController get innerController {
  //   return nestScrollKey.currentState!.innerController;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.index = 1;
    // 页面渲染完成后才能获取 key 里面的 scrollcontroller
    // SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    //   print("开始监听");
    //   innerController.addListener(() {
    //     if (innerController.position.pixels >=
    //             innerController.position.maxScrollExtent - 5.w &&
    //         _tabController.index == 1) {
    //       print(innerController.position.pixels);
    //       print(innerController.position.maxScrollExtent);
    //       recommendPageKey.currentState!.getDataUp();
    //     }
    //   });
    // });
    // 到底加载更多
    // _scrollController.addListener(() {
    //   print(_scrollController.position.pixels);
    //   print(_scrollController.position.maxScrollExtent);
    //   if (_scrollController.position.pixels >=
    //       _scrollController.position.maxScrollExtent - 5.w && _tabController.index == 1) {
    //       print(_scrollController.position.pixels);
    //       print(_scrollController.position.maxScrollExtent);
    //       recommendPageKey.currentState!.getDataUp();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExtendedNestedScrollView(
      // key: nestScrollKey,
      // 设置吸顶 widget 的高度 + 状态栏高度，解决滑动后距离不正确
      pinnedHeaderSliverHeightBuilder: () {
        return 50.h + MediaQuery.of(context).padding.top;
      },
      // 避免 body 里面的 tabbarview 缓存的 tab 滑动后互相影响位置
      onlyOneScrollInBody: true,
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            // primary: true,
            elevation: 0,
            // pinned: true,
            floating: true, // 只要下拉就会跟着下拉 251 114 153
            // backgroundColor: Color.fromRGBO(251, 114, 153, 1),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            leading: IconButton(
              onPressed: () {
                print('object');
              },
              icon: Container(
                width: 40.w,
                height: 40.w,
                // padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    color: Color.fromRGBO(251, 114, 153, 1)),
                child: Center(
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Container(
              width: 200.w,
              height: 30.w,
              padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30.w)),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.search,
                color: Colors.black26,
              ),
            ),
            actions: [
              Icon(
                Icons.gamepad_outlined,
                color: Colors.black45,
              ),
              SizedBox(
                width: 20.w,
              ),
              Icon(Icons.email_outlined, color: Colors.black45),
              SizedBox(width: 10.w)
            ],
          ),
          SliverPersistentHeader(
            pinned: true, //是否固定在顶部
            floating:
                false, // 为 true 时吸顶会定位到顶部，不管上面有没有存在另一个吸顶的组件；false 时会吸顶到上面吸顶组件的下面
            delegate: _SliverAppBarDelegate(
                minHeight: 50.h, //收起的高度
                maxHeight: 50.h, //展开的最大高度
                child: Container(
                  padding: EdgeInsets.only(left: 16.w),
                  height: 50.h,
                  width: 375.w,
                  color: Colors.white,
                  child: Row(
                    children: [
                      // 首页 tabbar
                      Container(
                        width: 300.w,
                        child: TabBar(
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Theme.of(context).primaryColor,
                            labelStyle: TextStyle(color: Colors.white),
                            tabs: <Widget>[
                              Tab(text: '直播'),
                              Tab(text: '推荐'),
                              Tab(text: '热门'),
                              Tab(text: '追番'),
                            ]),
                      ),
                      Icon(Icons.list)
                    ],
                  ),
                )),
          ),
          // SliverToBoxAdapter(
          // GlowNotificationWidget push_to_refresh_header.dart ff_annotation_route_library.dart loading_more_list.dart
          // )
        ];
      },
      body: TabBarView(controller: _tabController, children: [
        LiveListViewPage(),
        RecommendPage(key: recommendPageKey),
        HotListPage(),
        LikeAnimationPage(key: UniqueKey(),)
      ]),
    ));
  }
}

// 吸顶组件
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
