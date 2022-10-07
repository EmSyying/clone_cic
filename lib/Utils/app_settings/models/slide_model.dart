class SlideModel {
  String? title;
  String? description;
  String? module;
  String? type;
  String? status;
  String? image;
  Button? button;

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
    button = json['button'] != null ? Button.fromJson(json['button']) : null;
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
      data['button'] = button!.toJson();
    }
    return data;
  }
}

class Button {
  String? label;
  String? icon;
  String? target;

  Button({this.label, this.icon, this.target});

  Button.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    icon = json['icon'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['icon'] = icon;
    data['target'] = target;
    return data;
  }
}
