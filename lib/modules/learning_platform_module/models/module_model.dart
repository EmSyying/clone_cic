class Modules {
  int? id;
  String? title;
  int? video;
  String? image;

  Modules({this.id, this.title, this.video, this.image});

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['video'] = video;
    data['image'] = image;
    return data;
  }
}
