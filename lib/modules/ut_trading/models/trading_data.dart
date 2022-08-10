import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class InquiryData {
  List<InquiryModel>? data;
  Links? links;
  Meta? meta;

  InquiryData({this.data, this.links, this.meta});

  InquiryData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <InquiryModel>[];
      json['data'].forEach((v) {
        data!.add(InquiryModel.fromJson(v));
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
