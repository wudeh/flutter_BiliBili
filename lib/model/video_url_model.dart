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

class VideoUrlModel {
  VideoUrlModel({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  factory VideoUrlModel.fromJson(Map<String, dynamic> jsonRes) => VideoUrlModel(
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

  VideoUrlModel clone() => VideoUrlModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Data {
  Data({
    this.quality,
    this.format,
    this.timelength,
    this.acceptFormat,
    this.acceptDescription,
    this.acceptQuality,
    this.videoCodecid,
    this.fnver,
    this.fnval,
    this.videoProject,
    this.dash,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? acceptDescription =
        jsonRes['accept_description'] is List ? <String>[] : null;
    if (acceptDescription != null) {
      for (final dynamic item in jsonRes['accept_description']!) {
        if (item != null) {
          tryCatch(() {
            acceptDescription.add(asT<String>(item)!);
          });
        }
      }
    }

    final List<int>? acceptQuality =
        jsonRes['accept_quality'] is List ? <int>[] : null;
    if (acceptQuality != null) {
      for (final dynamic item in jsonRes['accept_quality']!) {
        if (item != null) {
          tryCatch(() {
            acceptQuality.add(asT<int>(item)!);
          });
        }
      }
    }
    return Data(
      quality: asT<int?>(jsonRes['quality']),
      format: asT<String?>(jsonRes['format']),
      timelength: asT<int?>(jsonRes['timelength']),
      acceptFormat: asT<String?>(jsonRes['accept_format']),
      acceptDescription: acceptDescription,
      acceptQuality: acceptQuality,
      videoCodecid: asT<int?>(jsonRes['video_codecid']),
      fnver: asT<int?>(jsonRes['fnver']),
      fnval: asT<int?>(jsonRes['fnval']),
      videoProject: asT<bool?>(jsonRes['video_project']),
      dash: jsonRes['dash'] == null
          ? null
          : Dash.fromJson(asT<Map<String, dynamic>>(jsonRes['dash'])!),
    );
  }

  int? quality;
  String? format;
  int? timelength;
  String? acceptFormat;
  List<String>? acceptDescription;
  List<int>? acceptQuality;
  int? videoCodecid;
  int? fnver;
  int? fnval;
  bool? videoProject;
  Dash? dash;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'quality': quality,
        'format': format,
        'timelength': timelength,
        'accept_format': acceptFormat,
        'accept_description': acceptDescription,
        'accept_quality': acceptQuality,
        'video_codecid': videoCodecid,
        'fnver': fnver,
        'fnval': fnval,
        'video_project': videoProject,
        'dash': dash,
      };

  Data clone() =>
      Data.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Dash {
  Dash({
    this.video,
    this.audio,
  });

  factory Dash.fromJson(Map<String, dynamic> jsonRes) {
    final List<Video>? video = jsonRes['video'] is List ? <Video>[] : null;
    if (video != null) {
      for (final dynamic item in jsonRes['video']!) {
        if (item != null) {
          tryCatch(() {
            video.add(Video.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Audio>? audio = jsonRes['audio'] is List ? <Audio>[] : null;
    if (audio != null) {
      for (final dynamic item in jsonRes['audio']!) {
        if (item != null) {
          tryCatch(() {
            audio.add(Audio.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return Dash(
      video: video,
      audio: audio,
    );
  }

  List<Video>? video;
  List<Audio>? audio;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'video': video,
        'audio': audio,
      };

  Dash clone() =>
      Dash.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Video {
  Video({
    this.id,
    this.baseUrl,
    this.backupUrl,
    this.bandwidth,
    this.codecid,
    this.size,
  });

  factory Video.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? backupUrl =
        jsonRes['backup_url'] is List ? <String>[] : null;
    if (backupUrl != null) {
      for (final dynamic item in jsonRes['backup_url']!) {
        if (item != null) {
          tryCatch(() {
            backupUrl.add(asT<String>(item)!);
          });
        }
      }
    }
    return Video(
      id: asT<int?>(jsonRes['id']),
      baseUrl: asT<String?>(jsonRes['base_url']),
      backupUrl: backupUrl,
      bandwidth: asT<int?>(jsonRes['bandwidth']),
      codecid: asT<int?>(jsonRes['codecid']),
      size: asT<int?>(jsonRes['size']),
    );
  }

  int? id;
  String? baseUrl;
  List<String>? backupUrl;
  int? bandwidth;
  int? codecid;
  int? size;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'base_url': baseUrl,
        'backup_url': backupUrl,
        'bandwidth': bandwidth,
        'codecid': codecid,
        'size': size,
      };

  Video clone() =>
      Video.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class Audio {
  Audio({
    this.id,
    this.baseUrl,
    this.backupUrl,
    this.bandwidth,
    this.codecid,
    this.size,
  });

  factory Audio.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? backupUrl =
        jsonRes['backup_url'] is List ? <String>[] : null;
    if (backupUrl != null) {
      for (final dynamic item in jsonRes['backup_url']!) {
        if (item != null) {
          tryCatch(() {
            backupUrl.add(asT<String>(item)!);
          });
        }
      }
    }
    return Audio(
      id: asT<int?>(jsonRes['id']),
      baseUrl: asT<String?>(jsonRes['base_url']),
      backupUrl: backupUrl,
      bandwidth: asT<int?>(jsonRes['bandwidth']),
      codecid: asT<int?>(jsonRes['codecid']),
      size: asT<int?>(jsonRes['size']),
    );
  }

  int? id;
  String? baseUrl;
  List<String>? backupUrl;
  int? bandwidth;
  int? codecid;
  int? size;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'base_url': baseUrl,
        'backup_url': backupUrl,
        'bandwidth': bandwidth,
        'codecid': codecid,
        'size': size,
      };

  Audio clone() =>
      Audio.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
