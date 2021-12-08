import 'package:bilibili/util/MyMath.dart';

class BannerItem{
  String? pic;
  String? id;
  String? postition;
  String? title;
  String? link;
  BannerItem({this.id,this.link,this.pic,this.postition,this.title});
  BannerItem.fromJson(Map<String ,dynamic> jsondata){
    pic=jsondata["pic"];
    id=jsondata["id"];
    postition=jsondata["postition"];
    title=jsondata["title"];
    link=jsondata["link"];
  }
}
class Banners{
  List<BannerItem>? list;
  Banners.fromJson(Map<String,dynamic> jd){
    list=[];
    for(Map<String,dynamic> item in jd["banner"]){
      list?.add(BannerItem.fromJson(item));
    }
  }
}
class LivePartition{
  int? id;
  String? name;
  String? icon;
  List<LiveItem>? lives=[];
  LivePartition.fromJson(Map<String,dynamic> jsondata){
    id=jsondata["partition"]["id"];
    name=jsondata["partition"]["name"];
    icon=jsondata["partition"]["sub_icon"]["icon"];
    for(Map<String,dynamic> i in jsondata["lives"]){
      lives?.add(LiveItem.fromJson(i));
    }
  }
}
class LiveItem{
  String? id;
  int? roomid;
  int? uid;
  String? title;
  String? uname;
  String? user_cover;
  String? system_cover;
  String? face;
  String? area_name;
  String? parent_name;
  int? online;
  LiveItem({this.roomid,this.uid,this.title,this.uname,this.user_cover,this.area_name,this.face,this.online,this.parent_name,this.system_cover,});
  LiveItem.fromJson(Map<String ,dynamic> jsondata){
    roomid=jsondata["roomid"];
    uid=jsondata["uid"];
    title=jsondata["title"];
    uname=jsondata["uname"];
    user_cover=jsondata["user_cover"];
    system_cover=jsondata["system_cover"];
    face=jsondata["face"];
    area_name=jsondata["area_name"];
    parent_name=jsondata["parent_name"];
    online=jsondata["online"];
    id=MyMath.getrandomhash();
  }
}
class AreaCard{
  List<AreaItem> list;
  AreaCard(this.list);
}
class AreaItem{
  String cover;
  String title;
  AreaItem(this.cover,this.title);
}
