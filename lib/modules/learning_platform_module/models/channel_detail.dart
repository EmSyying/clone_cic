import 'package:cicgreenloan/modules/learning_platform_module/models/module_model.dart';

class ChannelDetail {
  Data? data;

  ChannelDetail({this.data});

  ChannelDetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  int? numberOfModule;
  List<Modules>? modules;
  String? image;

  Data(
      {this.id,
      this.title,
      this.description,
      this.numberOfModule,
      this.modules,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    numberOfModule = json['number_of_module'];
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(Modules.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['number_of_module'] = numberOfModule;
    if (modules != null) {
      data['modules'] = modules!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    return data;
  }
}
