import 'dart:convert';
import 'dart:developer';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();
  static T? Function<T extends Object?>(dynamic value) convert =
      <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

class UserInfoModel {
  UserInfoModel({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> jsonRes) => UserInfoModel(
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

  UserInfoModel clone() => UserInfoModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Data {
  Data({
    this.mid,
    this.name,
    this.sex,
    this.face,
    this.faceNft,
    this.sign,
    this.rank,
    this.level,
    this.jointime,
    this.moral,
    this.silence,
    this.coins,
    this.fansBadge,
    this.fansMedal,
    this.official,
    this.vip,
    this.pendant,
    this.nameplate,
    this.userHonourInfo,
    this.isFollowed,
    this.topPhoto,
    this.theme,
    this.sysNotice,
    this.liveRoom,
    this.birthday,
    this.school,
    this.profession,
    this.tags,
    this.series,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) => Data(
        mid: asT<int?>(jsonRes['mid']),
        name: asT<String?>(jsonRes['name']),
        sex: asT<String?>(jsonRes['sex']),
        face: asT<String?>(jsonRes['face']),
        faceNft: asT<int?>(jsonRes['face_nft']),
        sign: asT<String?>(jsonRes['sign']),
        rank: asT<int?>(jsonRes['rank']),
        level: asT<int?>(jsonRes['level']),
        jointime: asT<int?>(jsonRes['jointime']),
        moral: asT<int?>(jsonRes['moral']),
        silence: asT<int?>(jsonRes['silence']),
        coins: asT<int?>(jsonRes['coins']),
        fansBadge: asT<bool?>(jsonRes['fans_badge']),
        fansMedal: jsonRes['fans_medal'] == null
            ? null
            : Fans_medal.fromJson(
                asT<Map<String, dynamic>>(jsonRes['fans_medal'])!),
        official: jsonRes['official'] == null
            ? null
            : Official.fromJson(
                asT<Map<String, dynamic>>(jsonRes['official'])!),
        vip: jsonRes['vip'] == null
            ? null
            : Vip.fromJson(asT<Map<String, dynamic>>(jsonRes['vip'])!),
        pendant: jsonRes['pendant'] == null
            ? null
            : Pendant.fromJson(asT<Map<String, dynamic>>(jsonRes['pendant'])!),
        nameplate: jsonRes['nameplate'] == null
            ? null
            : Nameplate.fromJson(
                asT<Map<String, dynamic>>(jsonRes['nameplate'])!),
        userHonourInfo: jsonRes['user_honour_info'] == null
            ? null
            : User_honour_info.fromJson(
                asT<Map<String, dynamic>>(jsonRes['user_honour_info'])!),
        isFollowed: asT<bool?>(jsonRes['is_followed']),
        topPhoto: asT<String?>(jsonRes['top_photo']),
        theme: asT<Object?>(jsonRes['theme']),
        sysNotice: asT<Object?>(jsonRes['sys_notice']),
        liveRoom: jsonRes['live_room'] == null
            ? null
            : Live_room.fromJson(
                asT<Map<String, dynamic>>(jsonRes['live_room'])!),
        birthday: asT<String?>(jsonRes['birthday']),
        school: jsonRes['school'] == null
            ? null
            : School.fromJson(asT<Map<String, dynamic>>(jsonRes['school'])!),
        profession: jsonRes['profession'] == null
            ? null
            : Profession.fromJson(
                asT<Map<String, dynamic>>(jsonRes['profession'])!),
        tags: asT<Object?>(jsonRes['tags']),
        series: jsonRes['series'] == null
            ? null
            : Series.fromJson(asT<Map<String, dynamic>>(jsonRes['series'])!),
      );

  int? mid;
  String? name;
  String? sex;
  String? face;
  int? faceNft;
  String? sign;
  int? rank;
  int? level;
  int? jointime;
  int? moral;
  int? silence;
  int? coins;
  bool? fansBadge;
  Fans_medal? fansMedal;
  Official? official;
  Vip? vip;
  Pendant? pendant;
  Nameplate? nameplate;
  User_honour_info? userHonourInfo;
  bool? isFollowed;
  String? topPhoto;
  Object? theme;
  Object? sysNotice;
  Live_room? liveRoom;
  String? birthday;
  School? school;
  Profession? profession;
  Object? tags;
  Series? series;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mid': mid,
        'name': name,
        'sex': sex,
        'face': face,
        'face_nft': faceNft,
        'sign': sign,
        'rank': rank,
        'level': level,
        'jointime': jointime,
        'moral': moral,
        'silence': silence,
        'coins': coins,
        'fans_badge': fansBadge,
        'fans_medal': fansMedal,
        'official': official,
        'vip': vip,
        'pendant': pendant,
        'nameplate': nameplate,
        'user_honour_info': userHonourInfo,
        'is_followed': isFollowed,
        'top_photo': topPhoto,
        'theme': theme,
        'sys_notice': sysNotice,
        'live_room': liveRoom,
        'birthday': birthday,
        'school': school,
        'profession': profession,
        'tags': tags,
        'series': series,
      };

  Data clone() =>
      Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Fans_medal {
  Fans_medal({
    this.show,
    this.wear,
    this.medal,
  });

  factory Fans_medal.fromJson(Map<String, dynamic> jsonRes) => Fans_medal(
        show: asT<bool?>(jsonRes['show']),
        wear: asT<bool?>(jsonRes['wear']),
        medal: jsonRes['medal'] == null
            ? null
            : Medal.fromJson(asT<Map<String, dynamic>>(jsonRes['medal'])!),
      );

  bool? show;
  bool? wear;
  Medal? medal;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'show': show,
        'wear': wear,
        'medal': medal,
      };

  Fans_medal clone() => Fans_medal.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Medal {
  Medal({
    this.uid,
    this.targetId,
    this.medalId,
    this.level,
    this.medalName,
    this.medalColor,
    this.intimacy,
    this.nextIntimacy,
    this.dayLimit,
    this.medalColorStart,
    this.medalColorEnd,
    this.medalColorBorder,
    this.isLighted,
    this.lightStatus,
    this.wearingStatus,
    this.score,
  });

  factory Medal.fromJson(Map<String, dynamic> jsonRes) => Medal(
        uid: asT<int?>(jsonRes['uid']),
        targetId: asT<int?>(jsonRes['target_id']),
        medalId: asT<int?>(jsonRes['medal_id']),
        level: asT<int?>(jsonRes['level']),
        medalName: asT<String?>(jsonRes['medal_name']),
        medalColor: asT<int?>(jsonRes['medal_color']),
        intimacy: asT<int?>(jsonRes['intimacy']),
        nextIntimacy: asT<int?>(jsonRes['next_intimacy']),
        dayLimit: asT<int?>(jsonRes['day_limit']),
        medalColorStart: asT<int?>(jsonRes['medal_color_start']),
        medalColorEnd: asT<int?>(jsonRes['medal_color_end']),
        medalColorBorder: asT<int?>(jsonRes['medal_color_border']),
        isLighted: asT<int?>(jsonRes['is_lighted']),
        lightStatus: asT<int?>(jsonRes['light_status']),
        wearingStatus: asT<int?>(jsonRes['wearing_status']),
        score: asT<int?>(jsonRes['score']),
      );

  int? uid;
  int? targetId;
  int? medalId;
  int? level;
  String? medalName;
  int? medalColor;
  int? intimacy;
  int? nextIntimacy;
  int? dayLimit;
  int? medalColorStart;
  int? medalColorEnd;
  int? medalColorBorder;
  int? isLighted;
  int? lightStatus;
  int? wearingStatus;
  int? score;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'target_id': targetId,
        'medal_id': medalId,
        'level': level,
        'medal_name': medalName,
        'medal_color': medalColor,
        'intimacy': intimacy,
        'next_intimacy': nextIntimacy,
        'day_limit': dayLimit,
        'medal_color_start': medalColorStart,
        'medal_color_end': medalColorEnd,
        'medal_color_border': medalColorBorder,
        'is_lighted': isLighted,
        'light_status': lightStatus,
        'wearing_status': wearingStatus,
        'score': score,
      };

  Medal clone() =>
      Medal.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Official {
  Official({
    this.role,
    this.title,
    this.desc,
    this.type,
  });

  factory Official.fromJson(Map<String, dynamic> jsonRes) => Official(
        role: asT<int?>(jsonRes['role']),
        title: asT<String?>(jsonRes['title']),
        desc: asT<String?>(jsonRes['desc']),
        type: asT<int?>(jsonRes['type']),
      );

  int? role;
  String? title;
  String? desc;
  int? type;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'role': role,
        'title': title,
        'desc': desc,
        'type': type,
      };

  Official clone() => Official.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Vip {
  Vip({
    this.type,
    this.status,
    this.dueDate,
    this.vipPayType,
    this.themeType,
    this.label,
    this.avatarSubscript,
    this.nicknameColor,
    this.role,
    this.avatarSubscriptUrl,
  });

  factory Vip.fromJson(Map<String, dynamic> jsonRes) => Vip(
        type: asT<int?>(jsonRes['type']),
        status: asT<int?>(jsonRes['status']),
        dueDate: asT<int?>(jsonRes['due_date']),
        vipPayType: asT<int?>(jsonRes['vip_pay_type']),
        themeType: asT<int?>(jsonRes['theme_type']),
        label: jsonRes['label'] == null
            ? null
            : Label.fromJson(asT<Map<String, dynamic>>(jsonRes['label'])!),
        avatarSubscript: asT<int?>(jsonRes['avatar_subscript']),
        nicknameColor: asT<String?>(jsonRes['nickname_color']),
        role: asT<int?>(jsonRes['role']),
        avatarSubscriptUrl: asT<String?>(jsonRes['avatar_subscript_url']),
      );

  int? type;
  int? status;
  int? dueDate;
  int? vipPayType;
  int? themeType;
  Label? label;
  int? avatarSubscript;
  String? nicknameColor;
  int? role;
  String? avatarSubscriptUrl;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'status': status,
        'due_date': dueDate,
        'vip_pay_type': vipPayType,
        'theme_type': themeType,
        'label': label,
        'avatar_subscript': avatarSubscript,
        'nickname_color': nicknameColor,
        'role': role,
        'avatar_subscript_url': avatarSubscriptUrl,
      };

  Vip clone() =>
      Vip.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Label {
  Label({
    this.path,
    this.text,
    this.labelTheme,
    this.textColor,
    this.bgStyle,
    this.bgColor,
    this.borderColor,
  });

  factory Label.fromJson(Map<String, dynamic> jsonRes) => Label(
        path: asT<String?>(jsonRes['path']),
        text: asT<String?>(jsonRes['text']),
        labelTheme: asT<String?>(jsonRes['label_theme']),
        textColor: asT<String?>(jsonRes['text_color']),
        bgStyle: asT<int?>(jsonRes['bg_style']),
        bgColor: asT<String?>(jsonRes['bg_color']),
        borderColor: asT<String?>(jsonRes['border_color']),
      );

  String? path;
  String? text;
  String? labelTheme;
  String? textColor;
  int? bgStyle;
  String? bgColor;
  String? borderColor;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'path': path,
        'text': text,
        'label_theme': labelTheme,
        'text_color': textColor,
        'bg_style': bgStyle,
        'bg_color': bgColor,
        'border_color': borderColor,
      };

  Label clone() =>
      Label.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Pendant {
  Pendant({
    this.pid,
    this.name,
    this.image,
    this.expire,
    this.imageEnhance,
    this.imageEnhanceFrame,
  });

  factory Pendant.fromJson(Map<String, dynamic> jsonRes) => Pendant(
        pid: asT<int?>(jsonRes['pid']),
        name: asT<String?>(jsonRes['name']),
        image: asT<String?>(jsonRes['image']),
        expire: asT<int?>(jsonRes['expire']),
        imageEnhance: asT<String?>(jsonRes['image_enhance']),
        imageEnhanceFrame: asT<String?>(jsonRes['image_enhance_frame']),
      );

  int? pid;
  String? name;
  String? image;
  int? expire;
  String? imageEnhance;
  String? imageEnhanceFrame;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pid': pid,
        'name': name,
        'image': image,
        'expire': expire,
        'image_enhance': imageEnhance,
        'image_enhance_frame': imageEnhanceFrame,
      };

  Pendant clone() => Pendant.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Nameplate {
  Nameplate({
    this.nid,
    this.name,
    this.image,
    this.imageSmall,
    this.level,
    this.condition,
  });

  factory Nameplate.fromJson(Map<String, dynamic> jsonRes) => Nameplate(
        nid: asT<int?>(jsonRes['nid']),
        name: asT<String?>(jsonRes['name']),
        image: asT<String?>(jsonRes['image']),
        imageSmall: asT<String?>(jsonRes['image_small']),
        level: asT<String?>(jsonRes['level']),
        condition: asT<String?>(jsonRes['condition']),
      );

  int? nid;
  String? name;
  String? image;
  String? imageSmall;
  String? level;
  String? condition;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nid': nid,
        'name': name,
        'image': image,
        'image_small': imageSmall,
        'level': level,
        'condition': condition,
      };

  Nameplate clone() => Nameplate.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class User_honour_info {
  User_honour_info({
    this.mid,
    this.colour,
    this.tags,
  });

  factory User_honour_info.fromJson(Map<String, dynamic> jsonRes) {
    final List<Object>? tags = jsonRes['tags'] is List ? <Object>[] : null;
    if (tags != null) {
      for (final dynamic item in jsonRes['tags']!) {
        if (item != null) {
          tryCatch(() {
            tags.add(asT<Object>(item)!);
          });
        }
      }
    }
    return User_honour_info(
      mid: asT<int?>(jsonRes['mid']),
      colour: asT<Object?>(jsonRes['colour']),
      tags: tags,
    );
  }

  int? mid;
  Object? colour;
  List<Object>? tags;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mid': mid,
        'colour': colour,
        'tags': tags,
      };

  User_honour_info clone() => User_honour_info.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Live_room {
  Live_room({
    this.roomStatus,
    this.liveStatus,
    this.url,
    this.title,
    this.cover,
    this.online,
    this.roomid,
    this.roundStatus,
    this.broadcastType,
  });

  factory Live_room.fromJson(Map<String, dynamic> jsonRes) => Live_room(
        roomStatus: asT<int?>(jsonRes['roomStatus']),
        liveStatus: asT<int?>(jsonRes['liveStatus']),
        url: asT<String?>(jsonRes['url']),
        title: asT<String?>(jsonRes['title']),
        cover: asT<String?>(jsonRes['cover']),
        online: asT<int?>(jsonRes['online']),
        roomid: asT<int?>(jsonRes['roomid']),
        roundStatus: asT<int?>(jsonRes['roundStatus']),
        broadcastType: asT<int?>(jsonRes['broadcast_type']),
      );

  int? roomStatus;
  int? liveStatus;
  String? url;
  String? title;
  String? cover;
  int? online;
  int? roomid;
  int? roundStatus;
  int? broadcastType;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'roomStatus': roomStatus,
        'liveStatus': liveStatus,
        'url': url,
        'title': title,
        'cover': cover,
        'online': online,
        'roomid': roomid,
        'roundStatus': roundStatus,
        'broadcast_type': broadcastType,
      };

  Live_room clone() => Live_room.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class School {
  School({
    this.name,
  });

  factory School.fromJson(Map<String, dynamic> jsonRes) => School(
        name: asT<String?>(jsonRes['name']),
      );

  String? name;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
      };

  School clone() =>
      School.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Profession {
  Profession({
    this.name,
  });

  factory Profession.fromJson(Map<String, dynamic> jsonRes) => Profession(
        name: asT<String?>(jsonRes['name']),
      );

  String? name;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
      };

  Profession clone() => Profession.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Series {
  Series({
    this.userUpgradeStatus,
    this.showUpgradeWindow,
  });

  factory Series.fromJson(Map<String, dynamic> jsonRes) => Series(
        userUpgradeStatus: asT<int?>(jsonRes['user_upgrade_status']),
        showUpgradeWindow: asT<bool?>(jsonRes['show_upgrade_window']),
      );

  int? userUpgradeStatus;
  bool? showUpgradeWindow;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'user_upgrade_status': userUpgradeStatus,
        'show_upgrade_window': showUpgradeWindow,
      };

  Series clone() =>
      Series.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
