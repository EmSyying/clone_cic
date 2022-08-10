import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class VideoTrading {
  List<VideoData>? data;
  Links? links;
  Meta? meta;

  VideoTrading({this.data, this.links, this.meta});

  VideoTrading.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VideoData>[];
      json['data'].forEach((v) {
        data!.add(VideoData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class VideoData {
  int? id;
  String? title;
  String? videoType;
  String? video;
  String? duration;
  String? description;
  String? channel;
  String? module;
  String? publishDate;

  VideoData(
      {this.id,
      this.title,
      this.videoType,
      this.video,
      this.duration,
      this.description,
      this.channel,
      this.module,
      this.publishDate});

  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoType = json['video_type'];
    video = json['video'];
    duration = json['duration'];
    description = json['description'];
    channel = json['channel'];
    module = json['module'];
    publishDate = json['publish_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['video_type'] = videoType;
    data['video'] = video;
    data['duration'] = duration;
    data['description'] = description;
    data['channel'] = channel;
    data['module'] = module;
    data['publish_date'] = publishDate;
    return data;
  }
}
