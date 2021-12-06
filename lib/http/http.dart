 
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class HttpRequest {
  Dio dio = new Dio();
  static HttpRequest instance = HttpRequest();

  static HttpRequest getInstance() {
    if (null == instance) instance = HttpRequest();
    return instance;
  }

  // 构造实体类
  HttpRequest() {
    print('构造方法执行了');
    var options = BaseOptions(
      //请求基地址,可以包含子路径
      // baseUrl: _baseUrl,
      //连接服务器超时时间，单位是毫秒.
      // connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      // receiveTimeout: 15000,
      //Http请求头.
      // headers: {"user-agent": "Mozilla/5.0 BiliDroid/6310200 (bbcallen@gmail.com) tv.danmaku.bili/6310200 (Linux; U; Android 10; zh_CN; ONEPLUS A6000; Build/QKQ1.190716.003; Cronet/81.0.4044.156)"},
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
      contentType: 'application/json',
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      // responseType: ResponseType.json,
    );
    dio.options = options;
    // 为空才赋值
    // instance = new HttpRequest();
    // dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (response, handler) {
      // Do something with response data
      print('响应拦截');
      print(response);
      return handler.next(response); // continue
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onError: (DioError e, handler) {
      // Do something with response error
      showToast("网络错误");
      // return handler.next(e); //continue
      // var res = "{'code': '400', 'msg': '请求错误'}" as Response;
      return handler.reject(e);
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    }));
  }

  Future<Map<String, dynamic>> get(String url) async {
    final res = await dio.get(url);
    return jsonDecode(res.toString());
  }

  Future<Map<String, dynamic>> getMap(String url) async {
    Response res = await dio.get(url);
    return res.data;
  }

  Future<dynamic> post(String url, data) async {
    Response res = await dio.post(url, data: data);
    return res.data;
  }

  void download(url, savePath) async {
    Response response = await dio.download(url, savePath);
  }


}
