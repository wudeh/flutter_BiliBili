// 视频简介处的信息部分 model 生成失败


// import 'dart:convert';
// import 'dart:developer';
// void tryCatch(Function? f)
//       { try {f?.call();}
//       catch (e, stack)
//        {
//         log('$e'); 
//   log('$stack');
//         }
//         }
// class FFConvert {
//   FFConvert._();
//   static T? Function<T extends Object?>(dynamic value) convert =
//       <T>(dynamic value) {
//     if (value == null) {
//       return null;
//     }
//     return json.decode(value.toString()) as T?;
//   };
// }

// T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
//   if (value is T) {
//     return value;
//   }
//   try {
//     if (value != null) {
//       final String valueS = value.toString();
//       if ('' is T) {
//         return valueS as T;
//       } else if (0 is T) {
//         return int.parse(valueS) as T;
//       } else if (0.0 is T) {
//         return double.parse(valueS) as T;
//       } else if (false is T) {
//         if (valueS == '0' || valueS == '1') {
//           return (valueS == '1') as T;
//         }
//         return (valueS == 'true') as T;
//       } else {
//         return FFConvert.convert<T>(value);
//       }
//     }
//   } catch (e, stackTrace) {
//     log('asT<$T>', error: e, stackTrace: stackTrace);
//     return defaultValue;
//   }

//   return defaultValue;
// }
 

// class Root {

//     Root({
// this.code,
// this.message,
// this.ttl,
// this.data,
//     });

//   factory Root.fromJson(Map<String, dynamic> jsonRes)=>Root(
//     code : asT<int?>(jsonRes['code']),
//     message : asT<String?>(jsonRes['message']),
//     ttl : asT<int?>(jsonRes['ttl']),
//     data :jsonRes['data']==null?null: Data.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])!),);

//   int? code;
//   String? message;
//   int? ttl;
//   Data? data;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'code': code,
//         'message': message,
//         'ttl': ttl,
//         'data': data,
// };

// Root clone() => Root.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Data {

//     Data({
// this.aid,
// this.videos,
// this.tid,
// this.tname,
// this.copyright,
// this.pic,
// this.title,
// this.pubdate,
// this.ctime,
// this.desc,
// this.state,
// this.duration,
// this.missionId,
// this.rights,
// this.owner,
// this.stat,
// this.dynamic,
// this.cid,
// this.dimension,
// this.shortLinkV2,
// this.firstFrame,
// this.pages,
// this.ownerExt,
// this.reqUser,
// this.tag,
// this.tIcon,
// this.elec,
// this.relates,
// this.dislikeReasons,
// this.dislikeReasonsV2,
// this.dmSeg,
// this.paster,
// this.cms,
// this.cmConfig,
// this.activityUrl,
// this.shortLink,
// this.playParam,
// this.label,
// this.config,
// this.shareSubtitle,
// this.bvid,
// this.likeCustom,
//     });

//   factory Data.fromJson(Map<String, dynamic> jsonRes){


//  final  List<Pages>? pages = jsonRes['pages'] is List ? <Pages>[]: null; 
//     if(pages!=null) {
//  for (final dynamic item in jsonRes['pages']!) { if (item != null) { tryCatch(() { pages.add(Pages.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }


//  final  List<Tag>? tag = jsonRes['tag'] is List ? <Tag>[]: null; 
//     if(tag!=null) {
//  for (final dynamic item in jsonRes['tag']!) { if (item != null) { tryCatch(() { tag.add(Tag.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }


//  final  List<Relates>? relates = jsonRes['relates'] is List ? <Relates>[]: null; 
//     if(relates!=null) {
//  for (final dynamic item in jsonRes['relates']!) { if (item != null) { tryCatch(() { relates.add(Relates.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }


//  final  List<Dislike_reasons>? dislikeReasons = jsonRes['dislike_reasons'] is List ? <Dislike_reasons>[]: null; 
//     if(dislikeReasons!=null) {
//  for (final dynamic item in jsonRes['dislike_reasons']!) { if (item != null) { tryCatch(() { dislikeReasons.add(Dislike_reasons.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }


//  final  List<Cms>? cms = jsonRes['cms'] is List ? <Cms>[]: null; 
//     if(cms!=null) {
//  for (final dynamic item in jsonRes['cms']!) { if (item != null) { tryCatch(() { cms.add(Cms.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }
// return Data(
//     aid : asT<int?>(jsonRes['aid']),
//     videos : asT<int?>(jsonRes['videos']),
//     tid : asT<int?>(jsonRes['tid']),
//     tname : asT<String?>(jsonRes['tname']),
//     copyright : asT<int?>(jsonRes['copyright']),
//     pic : asT<String?>(jsonRes['pic']),
//     title : asT<String?>(jsonRes['title']),
//     pubdate : asT<int?>(jsonRes['pubdate']),
//     ctime : asT<int?>(jsonRes['ctime']),
//     desc : asT<String?>(jsonRes['desc']),
//     state : asT<int?>(jsonRes['state']),
//     duration : asT<int?>(jsonRes['duration']),
//     missionId : asT<int?>(jsonRes['mission_id']),
//     rights :jsonRes['rights']==null?null: Rights.fromJson(asT<Map<String, dynamic>>(jsonRes['rights'])!),
//     owner :jsonRes['owner']==null?null: Owner.fromJson(asT<Map<String, dynamic>>(jsonRes['owner'])!),
//     stat :jsonRes['stat']==null?null: Stat.fromJson(asT<Map<String, dynamic>>(jsonRes['stat'])!),
//     dynamic : asT<String?>(jsonRes['dynamic']),
//     cid : asT<int?>(jsonRes['cid']),
//     dimension :jsonRes['dimension']==null?null: Dimension.fromJson(asT<Map<String, dynamic>>(jsonRes['dimension'])!),
//     shortLinkV2 : asT<String?>(jsonRes['short_link_v2']),
//     firstFrame : asT<String?>(jsonRes['first_frame']),
//  pages:pages,
//     ownerExt :jsonRes['owner_ext']==null?null: Owner_ext.fromJson(asT<Map<String, dynamic>>(jsonRes['owner_ext'])!),
//     reqUser :jsonRes['req_user']==null?null: Req_user.fromJson(asT<Map<String, dynamic>>(jsonRes['req_user'])!),
//  tag:tag,
//     tIcon :jsonRes['t_icon']==null?null: T_icon.fromJson(asT<Map<String, dynamic>>(jsonRes['t_icon'])!),
//     elec :jsonRes['elec']==null?null: Elec.fromJson(asT<Map<String, dynamic>>(jsonRes['elec'])!),
//  relates:relates,
//  dislikeReasons:dislikeReasons,
//     dislikeReasonsV2 :jsonRes['dislike_reasons_v2']==null?null: Dislike_reasons_v2.fromJson(asT<Map<String, dynamic>>(jsonRes['dislike_reasons_v2'])!),
//     dmSeg : asT<int?>(jsonRes['dm_seg']),
//     paster :jsonRes['paster']==null?null: Paster.fromJson(asT<Map<String, dynamic>>(jsonRes['paster'])!),
//  cms:cms,
//     cmConfig :jsonRes['cm_config']==null?null: Cm_config.fromJson(asT<Map<String, dynamic>>(jsonRes['cm_config'])!),
//     activityUrl : asT<String?>(jsonRes['activity_url']),
//     shortLink : asT<String?>(jsonRes['short_link']),
//     playParam : asT<int?>(jsonRes['play_param']),
//     label :jsonRes['label']==null?null: Label.fromJson(asT<Map<String, dynamic>>(jsonRes['label'])!),
//     config :jsonRes['config']==null?null: Config.fromJson(asT<Map<String, dynamic>>(jsonRes['config'])!),
//     shareSubtitle : asT<String?>(jsonRes['share_subtitle']),
//     bvid : asT<String?>(jsonRes['bvid']),
//     likeCustom :jsonRes['like_custom']==null?null: Like_custom.fromJson(asT<Map<String, dynamic>>(jsonRes['like_custom'])!),);}

//   int? aid;
//   int? videos;
//   int? tid;
//   String? tname;
//   int? copyright;
//   String? pic;
//   String? title;
//   int? pubdate;
//   int? ctime;
//   String? desc;
//   int? state;
//   int? duration;
//   int? missionId;
//   Rights? rights;
//   Owner? owner;
//   Stat? stat;
//   String? dynamic;
//   int? cid;
//   Dimension? dimension;
//   String? shortLinkV2;
//   String? firstFrame;
//   List<Pages>? pages;
//   Owner_ext? ownerExt;
//   Req_user? reqUser;
//   List<Tag>? tag;
//   T_icon? tIcon;
//   Elec? elec;
//   List<Relates>? relates;
//   List<Dislike_reasons>? dislikeReasons;
//   Dislike_reasons_v2? dislikeReasonsV2;
//   int? dmSeg;
//   Paster? paster;
//   List<Cms>? cms;
//   Cm_config? cmConfig;
//   String? activityUrl;
//   String? shortLink;
//   int? playParam;
//   Label? label;
//   Config? config;
//   String? shareSubtitle;
//   String? bvid;
//   Like_custom? likeCustom;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'aid': aid,
//         'videos': videos,
//         'tid': tid,
//         'tname': tname,
//         'copyright': copyright,
//         'pic': pic,
//         'title': title,
//         'pubdate': pubdate,
//         'ctime': ctime,
//         'desc': desc,
//         'state': state,
//         'duration': duration,
//         'mission_id': missionId,
//         'rights': rights,
//         'owner': owner,
//         'stat': stat,
//         'dynamic': dynamic,
//         'cid': cid,
//         'dimension': dimension,
//         'short_link_v2': shortLinkV2,
//         'first_frame': firstFrame,
//         'pages': pages,
//         'owner_ext': ownerExt,
//         'req_user': reqUser,
//         'tag': tag,
//         't_icon': tIcon,
//         'elec': elec,
//         'relates': relates,
//         'dislike_reasons': dislikeReasons,
//         'dislike_reasons_v2': dislikeReasonsV2,
//         'dm_seg': dmSeg,
//         'paster': paster,
//         'cms': cms,
//         'cm_config': cmConfig,
//         'activity_url': activityUrl,
//         'short_link': shortLink,
//         'play_param': playParam,
//         'label': label,
//         'config': config,
//         'share_subtitle': shareSubtitle,
//         'bvid': bvid,
//         'like_custom': likeCustom,
// };

// Data clone() => Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Rights {

//     Rights({
// this.bp,
// this.elec,
// this.download,
// this.movie,
// this.pay,
// this.hd5,
// this.noReprint,
// this.autoplay,
// this.ugcPay,
// this.isCooperation,
// this.ugcPayPreview,
// this.noBackground,
//     });

//   factory Rights.fromJson(Map<String, dynamic> jsonRes)=>Rights(
//     bp : asT<int?>(jsonRes['bp']),
//     elec : asT<int?>(jsonRes['elec']),
//     download : asT<int?>(jsonRes['download']),
//     movie : asT<int?>(jsonRes['movie']),
//     pay : asT<int?>(jsonRes['pay']),
//     hd5 : asT<int?>(jsonRes['hd5']),
//     noReprint : asT<int?>(jsonRes['no_reprint']),
//     autoplay : asT<int?>(jsonRes['autoplay']),
//     ugcPay : asT<int?>(jsonRes['ugc_pay']),
//     isCooperation : asT<int?>(jsonRes['is_cooperation']),
//     ugcPayPreview : asT<int?>(jsonRes['ugc_pay_preview']),
//     noBackground : asT<int?>(jsonRes['no_background']),);

//   int? bp;
//   int? elec;
//   int? download;
//   int? movie;
//   int? pay;
//   int? hd5;
//   int? noReprint;
//   int? autoplay;
//   int? ugcPay;
//   int? isCooperation;
//   int? ugcPayPreview;
//   int? noBackground;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'bp': bp,
//         'elec': elec,
//         'download': download,
//         'movie': movie,
//         'pay': pay,
//         'hd5': hd5,
//         'no_reprint': noReprint,
//         'autoplay': autoplay,
//         'ugc_pay': ugcPay,
//         'is_cooperation': isCooperation,
//         'ugc_pay_preview': ugcPayPreview,
//         'no_background': noBackground,
// };

// Rights clone() => Rights.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Owner {

//     Owner({
// this.mid,
// this.name,
// this.face,
//     });

//   factory Owner.fromJson(Map<String, dynamic> jsonRes)=>Owner(
//     mid : asT<int?>(jsonRes['mid']),
//     name : asT<String?>(jsonRes['name']),
//     face : asT<String?>(jsonRes['face']),);

//   int? mid;
//   String? name;
//   String? face;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'mid': mid,
//         'name': name,
//         'face': face,
// };

// Owner clone() => Owner.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Stat {

//     Stat({
// this.aid,
// this.view,
// this.danmaku,
// this.reply,
// this.favorite,
// this.coin,
// this.share,
// this.nowRank,
// this.hisRank,
// this.like,
// this.dislike,
//     });

//   factory Stat.fromJson(Map<String, dynamic> jsonRes)=>Stat(
//     aid : asT<int?>(jsonRes['aid']),
//     view : asT<int?>(jsonRes['view']),
//     danmaku : asT<int?>(jsonRes['danmaku']),
//     reply : asT<int?>(jsonRes['reply']),
//     favorite : asT<int?>(jsonRes['favorite']),
//     coin : asT<int?>(jsonRes['coin']),
//     share : asT<int?>(jsonRes['share']),
//     nowRank : asT<int?>(jsonRes['now_rank']),
//     hisRank : asT<int?>(jsonRes['his_rank']),
//     like : asT<int?>(jsonRes['like']),
//     dislike : asT<int?>(jsonRes['dislike']),);

//   int? aid;
//   int? view;
//   int? danmaku;
//   int? reply;
//   int? favorite;
//   int? coin;
//   int? share;
//   int? nowRank;
//   int? hisRank;
//   int? like;
//   int? dislike;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'aid': aid,
//         'view': view,
//         'danmaku': danmaku,
//         'reply': reply,
//         'favorite': favorite,
//         'coin': coin,
//         'share': share,
//         'now_rank': nowRank,
//         'his_rank': hisRank,
//         'like': like,
//         'dislike': dislike,
// };

// Stat clone() => Stat.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Dimension {

//     Dimension({
// this.width,
// this.height,
// this.rotate,
//     });

//   factory Dimension.fromJson(Map<String, dynamic> jsonRes)=>Dimension(
//     width : asT<int?>(jsonRes['width']),
//     height : asT<int?>(jsonRes['height']),
//     rotate : asT<int?>(jsonRes['rotate']),);

//   int? width;
//   int? height;
//   int? rotate;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'width': width,
//         'height': height,
//         'rotate': rotate,
// };

// Dimension clone() => Dimension.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Pages {

//     Pages({
// this.cid,
// this.page,
// this.from,
// this.part,
// this.duration,
// this.vid,
// this.weblink,
// this.dimension,
// this.firstFrame,
// this.metas,
// this.dmlink,
// this.downloadTitle,
// this.downloadSubtitle,
//     });

//   factory Pages.fromJson(Map<String, dynamic> jsonRes){


//  final  List<Metas>? metas = jsonRes['metas'] is List ? <Metas>[]: null; 
//     if(metas!=null) {
//  for (final dynamic item in jsonRes['metas']!) { if (item != null) { tryCatch(() { metas.add(Metas.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }
// return Pages(
//     cid : asT<int?>(jsonRes['cid']),
//     page : asT<int?>(jsonRes['page']),
//     from : asT<String?>(jsonRes['from']),
//     part : asT<String?>(jsonRes['part']),
//     duration : asT<int?>(jsonRes['duration']),
//     vid : asT<String?>(jsonRes['vid']),
//     weblink : asT<String?>(jsonRes['weblink']),
//     dimension :jsonRes['dimension']==null?null: Dimension.fromJson(asT<Map<String, dynamic>>(jsonRes['dimension'])!),
//     firstFrame : asT<String?>(jsonRes['first_frame']),
//  metas:metas,
//     dmlink : asT<String?>(jsonRes['dmlink']),
//     downloadTitle : asT<String?>(jsonRes['download_title']),
//     downloadSubtitle : asT<String?>(jsonRes['download_subtitle']),);}

//   int? cid;
//   int? page;
//   String? from;
//   String? part;
//   int? duration;
//   String? vid;
//   String? weblink;
//   Dimension? dimension;
//   String? firstFrame;
//   List<Metas>? metas;
//   String? dmlink;
//   String? downloadTitle;
//   String? downloadSubtitle;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'cid': cid,
//         'page': page,
//         'from': from,
//         'part': part,
//         'duration': duration,
//         'vid': vid,
//         'weblink': weblink,
//         'dimension': dimension,
//         'first_frame': firstFrame,
//         'metas': metas,
//         'dmlink': dmlink,
//         'download_title': downloadTitle,
//         'download_subtitle': downloadSubtitle,
// };

// Pages clone() => Pages.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }


// class Metas {

//     Metas({
// this.quality,
// this.format,
// this.size,
//     });

//   factory Metas.fromJson(Map<String, dynamic> jsonRes)=>Metas(
//     quality : asT<int?>(jsonRes['quality']),
//     format : asT<String?>(jsonRes['format']),
//     size : asT<int?>(jsonRes['size']),);

//   int? quality;
//   String? format;
//   int? size;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'quality': quality,
//         'format': format,
//         'size': size,
// };

// Metas clone() => Metas.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Owner_ext {

//     Owner_ext({
// this.officialVerify,
// this.vip,
// this.assists,
// this.fans,
// this.arcCount,
//     });

//   factory Owner_ext.fromJson(Map<String, dynamic> jsonRes){


//  final  List<int>? assists = jsonRes['assists'] is List ? <int>[]: null; 
//     if(assists!=null) {
//  for (final dynamic item in jsonRes['assists']!) { if (item != null) { tryCatch(() { assists.add(asT<int>(item)!);  });  }}
//     }
// return Owner_ext(
//     officialVerify :jsonRes['official_verify']==null?null: Official_verify.fromJson(asT<Map<String, dynamic>>(jsonRes['official_verify'])!),
//     vip :jsonRes['vip']==null?null: Vip.fromJson(asT<Map<String, dynamic>>(jsonRes['vip'])!),
//  assists:assists,
//     fans : asT<int?>(jsonRes['fans']),
//     arcCount : asT<String?>(jsonRes['arc_count']),);}

//   Official_verify? officialVerify;
//   Vip? vip;
//   List<int>? assists;
//   int? fans;
//   String? arcCount;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'official_verify': officialVerify,
//         'vip': vip,
//         'assists': assists,
//         'fans': fans,
//         'arc_count': arcCount,
// };

// Owner_ext clone() => Owner_ext.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Official_verify {

//     Official_verify({
// this.type,
// this.desc,
//     });

//   factory Official_verify.fromJson(Map<String, dynamic> jsonRes)=>Official_verify(
//     type : asT<int?>(jsonRes['type']),
//     desc : asT<String?>(jsonRes['desc']),);

//   int? type;
//   String? desc;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'type': type,
//         'desc': desc,
// };

// Official_verify clone() => Official_verify.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Vip {

//     Vip({
// this.vipType,
// this.vipDueDate,
// this.dueRemark,
// this.accessStatus,
// this.vipStatus,
// this.vipStatusWarn,
// this.themeType,
// this.label,
//     });

//   factory Vip.fromJson(Map<String, dynamic> jsonRes)=>Vip(
//     vipType : asT<int?>(jsonRes['vipType']),
//     vipDueDate : asT<int?>(jsonRes['vipDueDate']),
//     dueRemark : asT<String?>(jsonRes['dueRemark']),
//     accessStatus : asT<int?>(jsonRes['accessStatus']),
//     vipStatus : asT<int?>(jsonRes['vipStatus']),
//     vipStatusWarn : asT<String?>(jsonRes['vipStatusWarn']),
//     themeType : asT<int?>(jsonRes['themeType']),
//     label :jsonRes['label']==null?null: Label.fromJson(asT<Map<String, dynamic>>(jsonRes['label'])!),);

//   int? vipType;
//   int? vipDueDate;
//   String? dueRemark;
//   int? accessStatus;
//   int? vipStatus;
//   String? vipStatusWarn;
//   int? themeType;
//   Label? label;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'vipType': vipType,
//         'vipDueDate': vipDueDate,
//         'dueRemark': dueRemark,
//         'accessStatus': accessStatus,
//         'vipStatus': vipStatus,
//         'vipStatusWarn': vipStatusWarn,
//         'themeType': themeType,
//         'label': label,
// };

// Vip clone() => Vip.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Label {

//     Label({
// this.path,
// this.text,
// this.labelTheme,
// this.textColor,
// this.bgStyle,
// this.bgColor,
// this.borderColor,
//     });

//   factory Label.fromJson(Map<String, dynamic> jsonRes)=>Label(
//     path : asT<String?>(jsonRes['path']),
//     text : asT<String?>(jsonRes['text']),
//     labelTheme : asT<String?>(jsonRes['label_theme']),
//     textColor : asT<String?>(jsonRes['text_color']),
//     bgStyle : asT<int?>(jsonRes['bg_style']),
//     bgColor : asT<String?>(jsonRes['bg_color']),
//     borderColor : asT<String?>(jsonRes['border_color']),);

//   String? path;
//   String? text;
//   String? labelTheme;
//   String? textColor;
//   int? bgStyle;
//   String? bgColor;
//   String? borderColor;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'path': path,
//         'text': text,
//         'label_theme': labelTheme,
//         'text_color': textColor,
//         'bg_style': bgStyle,
//         'bg_color': bgColor,
//         'border_color': borderColor,
// };

// Label clone() => Label.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Req_user {

//     Req_user({
// this.attention,
// this.guestAttention,
//     });

//   factory Req_user.fromJson(Map<String, dynamic> jsonRes)=>Req_user(
//     attention : asT<int?>(jsonRes['attention']),
//     guestAttention : asT<int?>(jsonRes['guest_attention']),);

//   int? attention;
//   int? guestAttention;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'attention': attention,
//         'guest_attention': guestAttention,
// };

// Req_user clone() => Req_user.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Tag {

//     Tag({
// this.tagId,
// this.tagName,
// this.cover,
// this.likes,
// this.hates,
// this.liked,
// this.hated,
// this.attribute,
// this.isActivity,
// this.uri,
// this.tagType,
//     });

//   factory Tag.fromJson(Map<String, dynamic> jsonRes)=>Tag(
//     tagId : asT<int?>(jsonRes['tag_id']),
//     tagName : asT<String?>(jsonRes['tag_name']),
//     cover : asT<String?>(jsonRes['cover']),
//     likes : asT<int?>(jsonRes['likes']),
//     hates : asT<int?>(jsonRes['hates']),
//     liked : asT<int?>(jsonRes['liked']),
//     hated : asT<int?>(jsonRes['hated']),
//     attribute : asT<int?>(jsonRes['attribute']),
//     isActivity : asT<int?>(jsonRes['is_activity']),
//     uri : asT<String?>(jsonRes['uri']),
//     tagType : asT<String?>(jsonRes['tag_type']),);

//   int? tagId;
//   String? tagName;
//   String? cover;
//   int? likes;
//   int? hates;
//   int? liked;
//   int? hated;
//   int? attribute;
//   int? isActivity;
//   String? uri;
//   String? tagType;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'tag_id': tagId,
//         'tag_name': tagName,
//         'cover': cover,
//         'likes': likes,
//         'hates': hates,
//         'liked': liked,
//         'hated': hated,
//         'attribute': attribute,
//         'is_activity': isActivity,
//         'uri': uri,
//         'tag_type': tagType,
// };

// Tag clone() => Tag.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class T_icon {

//     T_icon({
// this.act,
// this.new,
//     });

//   factory T_icon.fromJson(Map<String, dynamic> jsonRes)=>T_icon(
//     act :jsonRes['act']==null?null: Act.fromJson(asT<Map<String, dynamic>>(jsonRes['act'])!),
//     new :jsonRes['new']==null?null: New.fromJson(asT<Map<String, dynamic>>(jsonRes['new'])!),);

//   Act? act;
//   New? new;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'act': act,
//         'new': new,
// };

// T_icon clone() => T_icon.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Act {

//     Act({
// this.icon,
//     });

//   factory Act.fromJson(Map<String, dynamic> jsonRes)=>Act(
//     icon : asT<String?>(jsonRes['icon']),);

//   String? icon;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'icon': icon,
// };

// Act clone() => Act.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class New {

//     New({
// this.icon,
//     });

//   factory New.fromJson(Map<String, dynamic> jsonRes)=>New(
//     icon : asT<String?>(jsonRes['icon']),);

//   String? icon;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'icon': icon,
// };

// New clone() => New.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Elec {

//     Elec({
// this.show,
// this.total,
// this.count,
// this.elecNum,
// this.list,
// this.elecSet,
//     });

//   factory Elec.fromJson(Map<String, dynamic> jsonRes){


//  final  List<List>? list = jsonRes['list'] is List ? <List>[]: null; 
//     if(list!=null) {
//  for (final dynamic item in jsonRes['list']!) { if (item != null) { tryCatch(() { list.add(List.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }
// return Elec(
//     show : asT<bool?>(jsonRes['show']),
//     total : asT<int?>(jsonRes['total']),
//     count : asT<int?>(jsonRes['count']),
//     elecNum : asT<int?>(jsonRes['elec_num']),
//  list:list,
//     elecSet :jsonRes['elec_set']==null?null: Elec_set.fromJson(asT<Map<String, dynamic>>(jsonRes['elec_set'])!),);}

//   bool? show;
//   int? total;
//   int? count;
//   int? elecNum;
//   List<List>? list;
//   Elec_set? elecSet;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'show': show,
//         'total': total,
//         'count': count,
//         'elec_num': elecNum,
//         'list': list,
//         'elec_set': elecSet,
// };

// Elec clone() => Elec.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class List {

//     List({
// this.payMid,
// this.rank,
// this.trendType,
// this.message,
// this.mid,
// this.vipInfo,
// this.uname,
// this.avatar,
//     });

//   factory List.fromJson(Map<String, dynamic> jsonRes)=>List(
//     payMid : asT<int?>(jsonRes['pay_mid']),
//     rank : asT<int?>(jsonRes['rank']),
//     trendType : asT<int?>(jsonRes['trend_type']),
//     message : asT<String?>(jsonRes['message']),
//     mid : asT<int?>(jsonRes['mid']),
//     vipInfo :jsonRes['vip_info']==null?null: Vip_info.fromJson(asT<Map<String, dynamic>>(jsonRes['vip_info'])!),
//     uname : asT<String?>(jsonRes['uname']),
//     avatar : asT<String?>(jsonRes['avatar']),);

//   int? payMid;
//   int? rank;
//   int? trendType;
//   String? message;
//   int? mid;
//   Vip_info? vipInfo;
//   String? uname;
//   String? avatar;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'pay_mid': payMid,
//         'rank': rank,
//         'trend_type': trendType,
//         'message': message,
//         'mid': mid,
//         'vip_info': vipInfo,
//         'uname': uname,
//         'avatar': avatar,
// };

// List clone() => List.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Vip_info {

//     Vip_info({
// this.vipType,
// this.vipStatus,
// this.vipDueMsec,
//     });

//   factory Vip_info.fromJson(Map<String, dynamic> jsonRes)=>Vip_info(
//     vipType : asT<int?>(jsonRes['vipType']),
//     vipStatus : asT<int?>(jsonRes['vipStatus']),
//     vipDueMsec : asT<int?>(jsonRes['vipDueMsec']),);

//   int? vipType;
//   int? vipStatus;
//   int? vipDueMsec;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'vipType': vipType,
//         'vipStatus': vipStatus,
//         'vipDueMsec': vipDueMsec,
// };

// Vip_info clone() => Vip_info.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Elec_set {

//     Elec_set({
// this.elecTheme,
// this.rmbRate,
// this.integrityRate,
// this.roundMode,
// this.elecList,
//     });

//   factory Elec_set.fromJson(Map<String, dynamic> jsonRes){


//  final  List<Elec_list>? elecList = jsonRes['elec_list'] is List ? <Elec_list>[]: null; 
//     if(elecList!=null) {
//  for (final dynamic item in jsonRes['elec_list']!) { if (item != null) { tryCatch(() { elecList.add(Elec_list.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }
// return Elec_set(
//     elecTheme : asT<int?>(jsonRes['elec_theme']),
//     rmbRate : asT<int?>(jsonRes['rmb_rate']),
//     integrityRate : asT<int?>(jsonRes['integrity_rate']),
//     roundMode : asT<int?>(jsonRes['round_mode']),
//  elecList:elecList,);}

//   int? elecTheme;
//   int? rmbRate;
//   int? integrityRate;
//   int? roundMode;
//   List<Elec_list>? elecList;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'elec_theme': elecTheme,
//         'rmb_rate': rmbRate,
//         'integrity_rate': integrityRate,
//         'round_mode': roundMode,
//         'elec_list': elecList,
// };

// Elec_set clone() => Elec_set.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Elec_list {

//     Elec_list({
// this.title,
// this.elecNum,
// this.isCustomize,
//     });

//   factory Elec_list.fromJson(Map<String, dynamic> jsonRes)=>Elec_list(
//     title : asT<String?>(jsonRes['title']),
//     elecNum : asT<int?>(jsonRes['elec_num']),
//     isCustomize : asT<int?>(jsonRes['is_customize']),);

//   String? title;
//   int? elecNum;
//   int? isCustomize;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'title': title,
//         'elec_num': elecNum,
//         'is_customize': isCustomize,
// };

// Elec_list clone() => Elec_list.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Relates {

//     Relates({
// this.aid,
// this.pic,
// this.title,
// this.owner,
// this.stat,
// this.duration,
// this.goto,
// this.param,
// this.uri,
// this.cid,
// this.adIndex,
// this.srcId,
// this.requestId,
// this.isAdLoc,
// this.clientIp,
// this.cardIndex,
// this.trackid,
//     });

//   factory Relates.fromJson(Map<String, dynamic> jsonRes)=>Relates(
//     aid : asT<int?>(jsonRes['aid']),
//     pic : asT<String?>(jsonRes['pic']),
//     title : asT<String?>(jsonRes['title']),
//     owner :jsonRes['owner']==null?null: Owner.fromJson(asT<Map<String, dynamic>>(jsonRes['owner'])!),
//     stat :jsonRes['stat']==null?null: Stat.fromJson(asT<Map<String, dynamic>>(jsonRes['stat'])!),
//     duration : asT<int?>(jsonRes['duration']),
//     goto : asT<String?>(jsonRes['goto']),
//     param : asT<String?>(jsonRes['param']),
//     uri : asT<String?>(jsonRes['uri']),
//     cid : asT<int?>(jsonRes['cid']),
//     adIndex : asT<int?>(jsonRes['ad_index']),
//     srcId : asT<int?>(jsonRes['src_id']),
//     requestId : asT<String?>(jsonRes['request_id']),
//     isAdLoc : asT<bool?>(jsonRes['is_ad_loc']),
//     clientIp : asT<String?>(jsonRes['client_ip']),
//     cardIndex : asT<int?>(jsonRes['card_index']),
//     trackid : asT<String?>(jsonRes['trackid']),);

//   int? aid;
//   String? pic;
//   String? title;
//   Owner? owner;
//   Stat? stat;
//   int? duration;
//   String? goto;
//   String? param;
//   String? uri;
//   int? cid;
//   int? adIndex;
//   int? srcId;
//   String? requestId;
//   bool? isAdLoc;
//   String? clientIp;
//   int? cardIndex;
//   String? trackid;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'aid': aid,
//         'pic': pic,
//         'title': title,
//         'owner': owner,
//         'stat': stat,
//         'duration': duration,
//         'goto': goto,
//         'param': param,
//         'uri': uri,
//         'cid': cid,
//         'ad_index': adIndex,
//         'src_id': srcId,
//         'request_id': requestId,
//         'is_ad_loc': isAdLoc,
//         'client_ip': clientIp,
//         'card_index': cardIndex,
//         'trackid': trackid,
// };

// Relates clone() => Relates.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }



// class Dislike_reasons {

//     Dislike_reasons({
// this.reasonId,
// this.reasonName,
//     });

//   factory Dislike_reasons.fromJson(Map<String, dynamic> jsonRes)=>Dislike_reasons(
//     reasonId : asT<int?>(jsonRes['reason_id']),
//     reasonName : asT<String?>(jsonRes['reason_name']),);

//   int? reasonId;
//   String? reasonName;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'reason_id': reasonId,
//         'reason_name': reasonName,
// };

// Dislike_reasons clone() => Dislike_reasons.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Dislike_reasons_v2 {

//     Dislike_reasons_v2({
// this.title,
// this.subtitle,
// this.reasons,
//     });

//   factory Dislike_reasons_v2.fromJson(Map<String, dynamic> jsonRes){


//  final  List<Reasons>? reasons = jsonRes['reasons'] is List ? <Reasons>[]: null; 
//     if(reasons!=null) {
//  for (final dynamic item in jsonRes['reasons']!) { if (item != null) { tryCatch(() { reasons.add(Reasons.fromJson(asT<Map<String,dynamic>>(item)!));  });  }}
//     }
// return Dislike_reasons_v2(
//     title : asT<String?>(jsonRes['title']),
//     subtitle : asT<String?>(jsonRes['subtitle']),
//  reasons:reasons,);}

//   String? title;
//   String? subtitle;
//   List<Reasons>? reasons;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'title': title,
//         'subtitle': subtitle,
//         'reasons': reasons,
// };

// Dislike_reasons_v2 clone() => Dislike_reasons_v2.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Reasons {

//     Reasons({
// this.id,
// this.mid,
// this.name,
//     });

//   factory Reasons.fromJson(Map<String, dynamic> jsonRes)=>Reasons(
//     id : asT<int?>(jsonRes['id']),
//     mid : asT<int?>(jsonRes['mid']),
//     name : asT<String?>(jsonRes['name']),);

//   int? id;
//   int? mid;
//   String? name;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'id': id,
//         'mid': mid,
//         'name': name,
// };

// Reasons clone() => Reasons.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Paster {

//     Paster({
// this.aid,
// this.cid,
// this.duration,
// this.type,
// this.allowJump,
// this.url,
//     });

//   factory Paster.fromJson(Map<String, dynamic> jsonRes)=>Paster(
//     aid : asT<int?>(jsonRes['aid']),
//     cid : asT<int?>(jsonRes['cid']),
//     duration : asT<int?>(jsonRes['duration']),
//     type : asT<int?>(jsonRes['type']),
//     allowJump : asT<int?>(jsonRes['allow_jump']),
//     url : asT<String?>(jsonRes['url']),);

//   int? aid;
//   int? cid;
//   int? duration;
//   int? type;
//   int? allowJump;
//   String? url;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'aid': aid,
//         'cid': cid,
//         'duration': duration,
//         'type': type,
//         'allow_jump': allowJump,
//         'url': url,
// };

// Paster clone() => Paster.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Cms {

//     Cms({
// this.requestId,
// this.rscId,
// this.srcId,
// this.isAdLoc,
// this.clientIp,
// this.index,
// this.adInfo,
//     });

//   factory Cms.fromJson(Map<String, dynamic> jsonRes)=>Cms(
//     requestId : asT<String?>(jsonRes['request_id']),
//     rscId : asT<int?>(jsonRes['rsc_id']),
//     srcId : asT<int?>(jsonRes['src_id']),
//     isAdLoc : asT<bool?>(jsonRes['is_ad_loc']),
//     clientIp : asT<String?>(jsonRes['client_ip']),
//     index : asT<int?>(jsonRes['index']),
//     adInfo : asT<Object?>(jsonRes['ad_info']),);

//   String? requestId;
//   int? rscId;
//   int? srcId;
//   bool? isAdLoc;
//   String? clientIp;
//   int? index;
//   Object? adInfo;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'request_id': requestId,
//         'rsc_id': rscId,
//         'src_id': srcId,
//         'is_ad_loc': isAdLoc,
//         'client_ip': clientIp,
//         'index': index,
//         'ad_info': adInfo,
// };

// Cms clone() => Cms.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Cm_config {

//     Cm_config({
// this.adsControl,
//     });

//   factory Cm_config.fromJson(Map<String, dynamic> jsonRes)=>Cm_config(
//     adsControl :jsonRes['ads_control']==null?null: Ads_control.fromJson(asT<Map<String, dynamic>>(jsonRes['ads_control'])!),);

//   Ads_control? adsControl;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'ads_control': adsControl,
// };

// Cm_config clone() => Cm_config.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Ads_control {

//     Ads_control({
// this.hasDanmu,
//     });

//   factory Ads_control.fromJson(Map<String, dynamic> jsonRes)=>Ads_control(
//     hasDanmu : asT<int?>(jsonRes['has_danmu']),);

//   int? hasDanmu;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'has_danmu': hasDanmu,
// };

// Ads_control clone() => Ads_control.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Label {

//     Label({
// this.type,
// this.uri,
// this.icon,
// this.iconNight,
// this.iconWidth,
// this.iconHeight,
//     });

//   factory Label.fromJson(Map<String, dynamic> jsonRes)=>Label(
//     type : asT<int?>(jsonRes['type']),
//     uri : asT<String?>(jsonRes['uri']),
//     icon : asT<String?>(jsonRes['icon']),
//     iconNight : asT<String?>(jsonRes['icon_night']),
//     iconWidth : asT<int?>(jsonRes['icon_width']),
//     iconHeight : asT<int?>(jsonRes['icon_height']),);

//   int? type;
//   String? uri;
//   String? icon;
//   String? iconNight;
//   int? iconWidth;
//   int? iconHeight;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'type': type,
//         'uri': uri,
//         'icon': icon,
//         'icon_night': iconNight,
//         'icon_width': iconWidth,
//         'icon_height': iconHeight,
// };

// Label clone() => Label.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Config {

//     Config({
// this.relatesTitle,
// this.shareStyle,
// this.recThreePointStyle,
// this.isAbsoluteTime,
//     });

//   factory Config.fromJson(Map<String, dynamic> jsonRes)=>Config(
//     relatesTitle : asT<String?>(jsonRes['relates_title']),
//     shareStyle : asT<int?>(jsonRes['share_style']),
//     recThreePointStyle : asT<int?>(jsonRes['rec_three_point_style']),
//     isAbsoluteTime : asT<bool?>(jsonRes['is_absolute_time']),);

//   String? relatesTitle;
//   int? shareStyle;
//   int? recThreePointStyle;
//   bool? isAbsoluteTime;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'relates_title': relatesTitle,
//         'share_style': shareStyle,
//         'rec_three_point_style': recThreePointStyle,
//         'is_absolute_time': isAbsoluteTime,
// };

// Config clone() => Config.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }

// class Like_custom {

//     Like_custom({
// this.likeSwitch,
// this.fullToHalfProgress,
// this.nonFullProgress,
// this.updateCount,
//     });

//   factory Like_custom.fromJson(Map<String, dynamic> jsonRes)=>Like_custom(
//     likeSwitch : asT<bool?>(jsonRes['like_switch']),
//     fullToHalfProgress : asT<int?>(jsonRes['full_to_half_progress']),
//     nonFullProgress : asT<int?>(jsonRes['non_full_progress']),
//     updateCount : asT<int?>(jsonRes['update_count']),);

//   bool? likeSwitch;
//   int? fullToHalfProgress;
//   int? nonFullProgress;
//   int? updateCount;
  
// @override
// String  toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'like_switch': likeSwitch,
//         'full_to_half_progress': fullToHalfProgress,
//         'non_full_progress': nonFullProgress,
//         'update_count': updateCount,
// };

// Like_custom clone() => Like_custom.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);

// }