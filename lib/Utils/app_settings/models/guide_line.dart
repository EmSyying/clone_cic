class Guideline {
  String? key;
  String? label;
  String? description;
  bool? active;

  Guideline({this.key, this.label, this.description, this.active});

  Guideline.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    label = json['label'];
    description = json['description'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['label'] = label;
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}
