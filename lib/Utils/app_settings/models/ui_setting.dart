class UISetting {
  String? type;
  String? key;
  String? label;
  String? route;
  String? icons;
  String? activeIcons;
  String? description;

  UISetting(
      {this.type,
      this.key,
      this.label,
      this.route,
      this.icons,
      this.activeIcons,
      this.description});

  UISetting.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    key = json['key'];
    label = json['label'];
    route = json['route'];
    icons = json['icons'];
    activeIcons = json['active_icons'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['key'] = key;
    data['label'] = label;
    data['route'] = route;
    data['icons'] = icons;
    data['active_icons'] = activeIcons;
    data['description'] = description;
    return data;
  }
}
