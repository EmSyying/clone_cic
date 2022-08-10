import 'package:cicgreenloan/modules/learning_platform_module/models/channel_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class ChannelModel {
  List<ChannelData>? data;
  Links? links;
  Meta? meta;

  ChannelModel({this.data, this.links, this.meta});

  ChannelModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ChannelData>[];
      json['data'].forEach((v) {
        data!.add(ChannelData.fromJson(v));
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
