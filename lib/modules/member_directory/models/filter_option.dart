import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class OptionFilter {
  List<OptionFormFilter>? data;

  OptionFilter({this.data});

  OptionFilter.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OptionFormFilter>[];
      json['data'].forEach((v) {
        data!.add(OptionFormFilter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionFormFilter {
  int? id;
  String? display;
  String? displayKhmer;
  bool? isSelected = false;
  int? selectedNumber;

  OptionFormFilter({
    this.id,
    this.display,
    this.displayKhmer,
    this.isSelected,
    this.selectedNumber,
  });

  OptionFormFilter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
    displayKhmer = json['display_khmer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    data['display_khmer'] = displayKhmer;
    return data;
  }
}

class SearchData {
  List<OptionFormFilter>? data;
  Links? links;
  Meta? meta;

  SearchData({this.data, this.links, this.meta});

  SearchData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OptionFormFilter>[];
      json['data'].forEach((v) {
        data!.add(OptionFormFilter.fromJson(v));
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
