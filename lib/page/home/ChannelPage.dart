import 'package:bilibili/page/common/extend_img.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:bilibili/model/ChannelItem.dart';
import 'package:bilibili/api/GetUtilBilibili.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

// 首页频道
class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  List<ChannelItem> channellist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChannelList();
  }

  getChannelList() async {
    channellist.addAll(await GetUtilBilibili.getChannelList());
    setState(() {});
  }

  Future<void> _onrefresh() async {
    channellist.clear();
    channellist.addAll(await GetUtilBilibili.getChannelList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return buildChannelGridView();
  }

  Widget buildChannelGridView() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.theme.primaryColor,
          elevation: 0.0,
          title: Text("频道"),
          centerTitle: true,
        ),
        body: channellist.isEmpty ? Center(child: CircularProgressIndicator(color: Get.theme.primaryColor,),) : GridView.builder(
            itemCount: channellist.length,
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, i) {
              return ChannelCard(item: channellist[i]);
            },
          ),
        );
  }
}

class ChannelCard extends StatelessWidget {
  ChannelItem item;
  ChannelCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Center(
            child: Column(
              children: <Widget>[
                // Container(
                //   //图标
                //   height: 35,
                //   width: 35,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(image: NetworkImage(item.logo!))),
                // ),
                ExtenedImage(
                  width: 35.w,
                  height: 35.w,
                  img: item.logo!,
                  notCircle: true,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.name!,
                  style: TextStyle(letterSpacing: 3, fontSize: 12),
                ) //文字
              ],
            ),
          ),
        );
  }
}
