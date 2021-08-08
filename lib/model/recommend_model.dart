import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class RecommendModel {
  RecommendModel({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  factory RecommendModel.fromJson(Map<String, dynamic> jsonRes) =>
      RecommendModel(
        code: asT<int?>(jsonRes['code']),
        message: asT<String?>(jsonRes['message']),
        ttl: asT<int?>(jsonRes['ttl']),
        data: jsonRes['data'] == null
            ? null
            : Data.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])!),
      );

  int? code;
  String? message;
  int? ttl;
  Data? data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'ttl': ttl,
        'data': data,
      };

  RecommendModel clone() => RecommendModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Data {
  Data({
    this.items,
    this.config,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<Items>? items = jsonRes['items'] is List ? <Items>[] : null;
    if (items != null) {
      for (final dynamic item in jsonRes['items']!) {
        if (item != null) {
          items.add(Items.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Data(
      items: items,
      config: jsonRes['config'] == null
          ? null
          : Config.fromJson(asT<Map<String, dynamic>>(jsonRes['config'])!),
    );
  }

  List<Items>? items;
  Config? config;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'items': items,
        'config': config,
      };

  Data clone() =>
      Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Items {
  Items({
    this.cardType,
    this.cardGoto,
    this.goto,
    this.param,
    this.cover,
    this.title,
    this.uri,
    this.threePoint,
    this.args,
    this.playerArgs,
    this.idx,
    this.threePointV2,
    this.coverLeftText1,
    this.coverLeftIcon1,
    this.coverLeft1ContentDescription,
    this.coverLeftText2,
    this.coverLeftIcon2,
    this.coverLeft2ContentDescription,
    this.coverRightText,
    this.coverRightContentDescription,
    this.descButton,
    this.canPlay,
  });

  factory Items.fromJson(Map<String, dynamic> jsonRes) {
    final List<Three_point_v2>? threePointV2 =
        jsonRes['three_point_v2'] is List ? <Three_point_v2>[] : null;
    if (threePointV2 != null) {
      for (final dynamic item in jsonRes['three_point_v2']!) {
        if (item != null) {
          threePointV2
              .add(Three_point_v2.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Items(
      cardType: asT<String?>(jsonRes['card_type']),
      cardGoto: asT<String?>(jsonRes['card_goto']),
      goto: asT<String?>(jsonRes['goto']),
      param: asT<String?>(jsonRes['param']),
      cover: asT<String?>(jsonRes['cover']),
      title: asT<String?>(jsonRes['title']),
      uri: asT<String?>(jsonRes['uri']),
      threePoint: jsonRes['three_point'] == null
          ? null
          : Three_point.fromJson(
              asT<Map<String, dynamic>>(jsonRes['three_point'])!),
      args: jsonRes['args'] == null
          ? null
          : Args.fromJson(asT<Map<String, dynamic>>(jsonRes['args'])!),
      playerArgs: jsonRes['player_args'] == null
          ? null
          : Player_args.fromJson(
              asT<Map<String, dynamic>>(jsonRes['player_args'])!),
      idx: asT<int?>(jsonRes['idx']),
      threePointV2: threePointV2,
      coverLeftText1: asT<String?>(jsonRes['cover_left_text_1']),
      coverLeftIcon1: asT<int?>(jsonRes['cover_left_icon_1']),
      coverLeft1ContentDescription:
          asT<String?>(jsonRes['cover_left_1_content_description']),
      coverLeftText2: asT<String?>(jsonRes['cover_left_text_2']),
      coverLeftIcon2: asT<int?>(jsonRes['cover_left_icon_2']),
      coverLeft2ContentDescription:
          asT<String?>(jsonRes['cover_left_2_content_description']),
      coverRightText: asT<String?>(jsonRes['cover_right_text']),
      coverRightContentDescription:
          asT<String?>(jsonRes['cover_right_content_description']),
      descButton: jsonRes['desc_button'] == null
          ? null
          : Desc_button.fromJson(
              asT<Map<String, dynamic>>(jsonRes['desc_button'])!),
      canPlay: asT<int?>(jsonRes['can_play']),
    );
  }

  String? cardType;
  String? cardGoto;
  String? goto;
  String? param;
  String? cover;
  String? title;
  String? uri;
  Three_point? threePoint;
  Args? args;
  Player_args? playerArgs;
  int? idx;
  List<Three_point_v2>? threePointV2;
  String? coverLeftText1;
  int? coverLeftIcon1;
  String? coverLeft1ContentDescription;
  String? coverLeftText2;
  int? coverLeftIcon2;
  String? coverLeft2ContentDescription;
  String? coverRightText;
  String? coverRightContentDescription;
  Desc_button? descButton;
  int? canPlay;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'card_type': cardType,
        'card_goto': cardGoto,
        'goto': goto,
        'param': param,
        'cover': cover,
        'title': title,
        'uri': uri,
        'three_point': threePoint,
        'args': args,
        'player_args': playerArgs,
        'idx': idx,
        'three_point_v2': threePointV2,
        'cover_left_text_1': coverLeftText1,
        'cover_left_icon_1': coverLeftIcon1,
        'cover_left_1_content_description': coverLeft1ContentDescription,
        'cover_left_text_2': coverLeftText2,
        'cover_left_icon_2': coverLeftIcon2,
        'cover_left_2_content_description': coverLeft2ContentDescription,
        'cover_right_text': coverRightText,
        'cover_right_content_description': coverRightContentDescription,
        'desc_button': descButton,
        'can_play': canPlay,
      };

  Items clone() =>
      Items.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Three_point {
  Three_point({
    this.dislikeReasons,
    this.feedbacks,
    this.watchLater,
  });

  factory Three_point.fromJson(Map<String, dynamic> jsonRes) {
    final List<Dislike_reasons>? dislikeReasons =
        jsonRes['dislike_reasons'] is List ? <Dislike_reasons>[] : null;
    if (dislikeReasons != null) {
      for (final dynamic item in jsonRes['dislike_reasons']!) {
        if (item != null) {
          dislikeReasons
              .add(Dislike_reasons.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }

    final List<Feedbacks>? feedbacks =
        jsonRes['feedbacks'] is List ? <Feedbacks>[] : null;
    if (feedbacks != null) {
      for (final dynamic item in jsonRes['feedbacks']!) {
        if (item != null) {
          feedbacks.add(Feedbacks.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Three_point(
      dislikeReasons: dislikeReasons,
      feedbacks: feedbacks,
      watchLater: asT<int?>(jsonRes['watch_later']),
    );
  }

  List<Dislike_reasons>? dislikeReasons;
  List<Feedbacks>? feedbacks;
  int? watchLater;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dislike_reasons': dislikeReasons,
        'feedbacks': feedbacks,
        'watch_later': watchLater,
      };

  Three_point clone() => Three_point.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Dislike_reasons {
  Dislike_reasons({
    this.id,
    this.name,
    this.toast,
  });

  factory Dislike_reasons.fromJson(Map<String, dynamic> jsonRes) =>
      Dislike_reasons(
        id: asT<int?>(jsonRes['id']),
        name: asT<String?>(jsonRes['name']),
        toast: asT<String?>(jsonRes['toast']),
      );

  int? id;
  String? name;
  String? toast;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'toast': toast,
      };

  Dislike_reasons clone() => Dislike_reasons.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Feedbacks {
  Feedbacks({
    this.id,
    this.name,
    this.toast,
  });

  factory Feedbacks.fromJson(Map<String, dynamic> jsonRes) => Feedbacks(
        id: asT<int?>(jsonRes['id']),
        name: asT<String?>(jsonRes['name']),
        toast: asT<String?>(jsonRes['toast']),
      );

  int? id;
  String? name;
  String? toast;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'toast': toast,
      };

  Feedbacks clone() => Feedbacks.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Args {
  Args({
    this.upId,
    this.upName,
    this.rid,
    this.rname,
    this.tid,
    this.tname,
    this.aid,
  });

  factory Args.fromJson(Map<String, dynamic> jsonRes) => Args(
        upId: asT<int?>(jsonRes['up_id']),
        upName: asT<String?>(jsonRes['up_name']),
        rid: asT<int?>(jsonRes['rid']),
        rname: asT<String?>(jsonRes['rname']),
        tid: asT<int?>(jsonRes['tid']),
        tname: asT<String?>(jsonRes['tname']),
        aid: asT<int?>(jsonRes['aid']),
      );

  int? upId;
  String? upName;
  int? rid;
  String? rname;
  int? tid;
  String? tname;
  int? aid;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'up_id': upId,
        'up_name': upName,
        'rid': rid,
        'rname': rname,
        'tid': tid,
        'tname': tname,
        'aid': aid,
      };

  Args clone() =>
      Args.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Player_args {
  Player_args({
    this.aid,
    this.cid,
    this.type,
    this.duration,
  });

  factory Player_args.fromJson(Map<String, dynamic> jsonRes) => Player_args(
        aid: asT<int?>(jsonRes['aid']),
        cid: asT<int?>(jsonRes['cid']),
        type: asT<String?>(jsonRes['type']),
        duration: asT<int?>(jsonRes['duration']),
      );

  int? aid;
  int? cid;
  String? type;
  int? duration;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'aid': aid,
        'cid': cid,
        'type': type,
        'duration': duration,
      };

  Player_args clone() => Player_args.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Three_point_v2 {
  Three_point_v2({
    this.title,
    this.type,
    this.icon,
  });

  factory Three_point_v2.fromJson(Map<String, dynamic> jsonRes) =>
      Three_point_v2(
        title: asT<String?>(jsonRes['title']),
        type: asT<String?>(jsonRes['type']),
        icon: asT<String?>(jsonRes['icon']),
      );

  String? title;
  String? type;
  String? icon;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'type': type,
        'icon': icon,
      };

  Three_point_v2 clone() => Three_point_v2.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Desc_button {
  Desc_button({
    this.text,
    this.uri,
    this.event,
    this.type,
    this.eventV2,
  });

  factory Desc_button.fromJson(Map<String, dynamic> jsonRes) => Desc_button(
        text: asT<String?>(jsonRes['text']),
        uri: asT<String?>(jsonRes['uri']),
        event: asT<String?>(jsonRes['event']),
        type: asT<int?>(jsonRes['type']),
        eventV2: asT<String?>(jsonRes['event_v2']),
      );

  String? text;
  String? uri;
  String? event;
  int? type;
  String? eventV2;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'uri': uri,
        'event': event,
        'type': type,
        'event_v2': eventV2,
      };

  Desc_button clone() => Desc_button.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Config {
  Config({
    this.column,
    this.autoplayCard,
    this.feedCleanAbtest,
    this.homeTransferTest,
    this.autoRefreshTime,
    this.showInlineDanmaku,
    this.toast,
    this.isBackToHomepage,
  });

  factory Config.fromJson(Map<String, dynamic> jsonRes) => Config(
        column: asT<int?>(jsonRes['column']),
        autoplayCard: asT<int?>(jsonRes['autoplay_card']),
        feedCleanAbtest: asT<int?>(jsonRes['feed_clean_abtest']),
        homeTransferTest: asT<int?>(jsonRes['home_transfer_test']),
        autoRefreshTime: asT<int?>(jsonRes['auto_refresh_time']),
        showInlineDanmaku: asT<int?>(jsonRes['show_inline_danmaku']),
        toast: asT<Object?>(jsonRes['toast']),
        isBackToHomepage: asT<bool?>(jsonRes['is_back_to_homepage']),
      );

  int? column;
  int? autoplayCard;
  int? feedCleanAbtest;
  int? homeTransferTest;
  int? autoRefreshTime;
  int? showInlineDanmaku;
  Object? toast;
  bool? isBackToHomepage;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'column': column,
        'autoplay_card': autoplayCard,
        'feed_clean_abtest': feedCleanAbtest,
        'home_transfer_test': homeTransferTest,
        'auto_refresh_time': autoRefreshTime,
        'show_inline_danmaku': showInlineDanmaku,
        'toast': toast,
        'is_back_to_homepage': isBackToHomepage,
      };

  Config clone() =>
      Config.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
