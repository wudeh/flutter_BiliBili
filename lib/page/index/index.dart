import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './recommend_page.dart';
import './live_broadcast/live_broadcast_page.dart';
import './hot_rank.dart';
import './like_animation.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.index = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          // primary: true,
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
              borderRadius: BorderRadius.circular(30.w) 
            ),
            alignment: Alignment.centerLeft,
            child: Icon(Icons.search, color: Colors.black26,),
          ),
          actions: [
            Icon(Icons.gamepad_outlined,color: Colors.black45,),
            SizedBox(width: 20.w,),
            Icon(Icons.email_outlined,color: Colors.black45),
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
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            color: Colors.blueAccent,
            // clipBehavior: Clip.none,
            height: 740.w,
            child: TabBarView(controller: _tabController, children: [
              LiveBroadcastPage(),
              RecommendPage(),
              HotRankPage(),
              LikeAnimationPage()
            ]),
          ),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((context, index) {
        //     return Text('$index');
        //   }, childCount: 50),
        // )
      ],
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
