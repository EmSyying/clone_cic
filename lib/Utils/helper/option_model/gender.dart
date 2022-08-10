class GenderOption {
  int? id;
  String? display;
  bool? isSelect = false;

  GenderOption({this.id, this.display});

  GenderOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    return data;
  }
}
