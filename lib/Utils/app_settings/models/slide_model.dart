import '../../../modules/notification_modules/models/notification_data.dart';

class SlideModel {
  String? title;
  String? description;
  String? type;
  String? status;
  String? image;
  List<Button>? button;

  SlideModel(
      {this.title,
      this.description,
      this.type,
      this.status,
      this.image,
      this.button});

  SlideModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
    if (json['button'] != null) {
      button = <Button>[];
      json['button'].forEach((v) {
        button!.add(Button.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['status'] = status;
    data['image'] = image;
    if (button != null) {
      data['button'] = button!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
