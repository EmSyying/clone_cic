class SlideModel {
  SlideModel({
    this.title,
    this.description,
    this.type,
    this.status,
    this.image,
  });

  String? title;
  String? description;
  String? type;
  String? status;
  String? image;

  factory SlideModel.fromJson(Map<String, dynamic> json) => SlideModel(
        title: json["title"],
        description: json["description"],
        type: json["type"],
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "type": type,
        "status": status,
        "image": image,
      };
}
