class Purpose {
  int? id;
  String? display;

  Purpose({this.id, this.display});

  Purpose.fromJson(Map<String, dynamic> json) {
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
