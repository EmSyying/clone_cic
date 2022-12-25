import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/member_directory/models/personal_profile_model.dart/personal_profile_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class MemberData {
  List<PersonalProfile>? data;
  Links? links;
  Meta? meta;

  MemberData({this.data, this.links, this.meta});

  MemberData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PersonalProfile>[];
      json['data'].forEach((v) {
        data!.add(PersonalProfile.fromJson(v));
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
