import 'package:cicgreenloan/modules/learning_platform_module/models/module_model.dart';

class VideoPost {
  int? id;
  String? title;
  String? videoType;
  String? video;
  String? duration;
  String? description;
  String? trainer;
  String? channel;
  Modules? module;
  late bool saved;
  String? publishDate;
  String? image;

  VideoPost(
      {this.id,
      this.title,
      this.videoType,
      this.video,
      this.duration,
      this.description,
      this.trainer,
      this.channel,
      this.module,
      this.saved = false,
      this.publishDate,
      this.image});

  VideoPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoType = json['video_type'];
    video = json['video'];
    duration = json['duration'];
    description = json['description'];
    trainer = json['trainer'];
    channel = json['channel'];
    module = json['module'] != null ? Modules.fromJson(json['module']) : null;
    saved = json['saved'];
    publishDate = json['publish_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['video_type'] = videoType;
    data['video'] = video;
    data['duration'] = duration;
    data['description'] = description;
    data['trainer'] = trainer;
    data['channel'] = channel;
    if (module != null) {
      data['module'] = module!.toJson();
    }
    data['saved'] = saved;
    data['publish_date'] = publishDate;
    data['image'] = image;
    return data;
  }
}
