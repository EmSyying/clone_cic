class SlideModel {
  String? title;
  String? description;
  String? module;
  String? type;
  String? status;
  String? image;
  List<Button>? button;

  SlideModel(
      {this.title,
      this.description,
      this.module,
      this.type,
      this.status,
      this.image,
      this.button});

  SlideModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    module = json['module'];
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
    data['module'] = module;
    data['type'] = type;
    data['status'] = status;
    data['image'] = image;
    if (button != null) {
      data['button'] = button!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Button {
  String? icon;
  String? label;
  String? target;

  Button({this.icon, this.label, this.target});

  Button.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    label = json['label'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['label'] = label;
    data['target'] = target;
    return data;
  }
}
