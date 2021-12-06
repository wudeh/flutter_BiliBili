import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'page/home/index.dart';
import './route/application.dart';
import 'package:fluro/fluro.dart';
import './route/routes.dart';

void main() {
  // 路由配置
  var router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => OKToast(
                child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: '哔哩哔哩',
              theme: ThemeData(
                primaryColor: Color.fromRGBO(251, 114, 153, 1),
                //要支持下面这个需要使用第一种初始化方式
                textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
              ),
              home: MyHomePage(title: '哔哩哔哩'),
              //注册路由表
              onGenerateRoute: Application.router.generator,
            )));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 底部导航按钮数组
  // final List<BottomNavigationBarItem> bottomTabs = [
  //   BottomNavigationBarItem(
  //        // 使用asset图片，也可以使用系统提供的图片，如Icons.home等
  //       icon: Image.asset(
  //         'images/home_unselected.png',
  //         width: 18,
  //         height: 18,
  //       ),
  //       activeIcon: Image.asset(
  //         'images/home_selected.png',
  //         width: 18,
  //         height: 18,
  //       ),
  //       label: '首页'),
  // ];
  // 模块容器数组
  final List<Widget> tabPages = [
    IndexPage(),
    Center(
      child: Text('动态，还没写'),
    ),
    Center(
      child: Text('会员购，写不了'),
    ),
    Center(
      child: Text('我的，还没写'),
    ),
  ];
  // 当前选择index
  int currentIndex = 0;
  // 当前页
  late Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = tabPages[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabPages,
      ),
      bottomNavigationBar: Container(
        height: 50.w,
        color: Colors.white70,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            // 首页
            Expanded(
              // flex: 1,
              child: Material(
                child: Ink(
                  color: Colors.white70,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                        currentPage = tabPages[currentIndex];
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentIndex == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        Text(
                          '首页',
                          style: TextStyle(
                            color: currentIndex == 0
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // 动态
            Expanded(
              child: Material(
                child: Ink(
                  color: Colors.white12,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                        currentPage = tabPages[currentIndex];
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.music_video_outlined,
                            color: currentIndex == 1
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                        Text('动态',
                            style: TextStyle(
                              color: currentIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // 中间的上传稿件按钮
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.w)),
                    child: Center(
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // 会员购
            Expanded(
              child: Material(
                child: Ink(
                  color: Colors.white12,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                        currentPage = tabPages[currentIndex];
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.card_giftcard,
                            color: currentIndex == 2
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                        Text('会员购',
                            style: TextStyle(
                              color: currentIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // 我的
            Expanded(
              child: Material(
                child: Ink(
                  color: Colors.white12,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                        currentPage = tabPages[currentIndex];
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.tv,
                            color: currentIndex == 3
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                        Text('我的',
                            style: TextStyle(
                              color: currentIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
