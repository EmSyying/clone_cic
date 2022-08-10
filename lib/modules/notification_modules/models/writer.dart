class Written {
  String? profile;
  String? name;
  String? position;
  String? company;

  Written({this.profile, this.name, this.position, this.company});

  Written.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
    name = json['name'];
    position = json['position'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile'] = profile;
    data['name'] = name;
    data['position'] = position;
    data['company'] = company;
    return data;
  }
}
