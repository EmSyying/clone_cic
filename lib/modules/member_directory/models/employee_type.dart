class EmploymentType {
  int? id;
  String? display;
  String? displayKhmer;

  EmploymentType({this.id, this.display, this.displayKhmer});

  EmploymentType.fromJson(Map<String, dynamic> json) {
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
