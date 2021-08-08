import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


import './application.dart';
import './routes.dart';
import '../../../util/fluro_convert.dart';

// 路由工具类
class NavigatorUtil {
  // 跳转首页方法
  // static void gotoHomePage(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.home, replace: true);
  // }

  // 跳转商品详情页方法
  // static void gotoGoodsDetailPage(BuildContext context, String goodsId,{bool newViewPage=false}) {
  //   if(newViewPage){
  //     context.navigator.push(SwipeablePageRoute(builder: (_)=>HaoDanKuDetailItem(goodsId: goodsId,)));
  //   }else{
  //     Application.router
  //         .navigateTo(context, '${Routes.goodsDetail}?goods_id=$goodsId');
  //   }

  // }

  // 跳转到错误页面
  static void gotoErrorPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.error);
  }

  // 跳转到视频播放页面
  static void gotoVideoPage(BuildContext context, String aid, String cid) {
    Application.router.navigateTo(context, Routes.video + '?aid=$aid&cid=$cid', transition: TransitionType.material);
  }

//跳转到商品列表页面
  // static void gotoGoodslistPage(BuildContext context,
  //     {String? subcid, String? cids, String? brand, String? title,String? showCates}) {
  //   if (title != null) {
  //     title = FluroConvertUtils.fluroCnParamsEncode(title);
  //   }
  //   Application.router.navigateTo(context,
  //       '${Routes.goodsList}?subcid=${subcid ?? ''}&cids=${cids ?? ''}&brand=${brand ?? ''}&title=${title ?? ''}&showCates=${showCates??'0'}');
  // }

  //跳转到钉钉抢页面
  // static void goTODdqPage() {
  //   Get.to(()=>DdqIndexHome());
  // }

  // // 跳转到登入页面
  // static void gotoUserLoginPage(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.userLoginPgae);
  // }

  // // 跳转到发布动态页面
  // static void goetoWhitePage(BuildContext context){
  //   Application.router.navigateTo(context, Routes.white);
  // }

  // // 跳转到绑定订单页面
  // static void gotoOrderAddIndexPage(BuildContext context){
  //   Application.router.navigateTo(context, Routes.orderAdd);
  // }

  // static void gotoOrderAllIndexPage(BuildContext context,String _stype){
  //   Application.router.navigateTo(context, '${Routes.orderAll}${'?stype=$_stype'}');
  // }

  // // 前往好单库商品详情页面
  // static void gotoHaodankuGoodsDetailPage(BuildContext context,String? goodsId){
  //   Application.router.navigateTo(context, '${Routes.hdkDetail}${'?goods_id=$goodsId'}');
  // }

  /// 跳转到搜索页面
  ///
  /// [worlds] 初始化搜索关键字
  // void toSearchPage({String? worlds}){
  //   Get.to(() => SearchPage(
  //     initSearchKeyWord: worlds??'',
  //   ));
  // }
}