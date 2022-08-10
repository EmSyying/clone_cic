class DocumentationModel {
  int? id;
  String? type;
  String? category;
  String? title;
  String? shortDescription;
  String? publishedAt;
  String? cover;
  String? attachedFile;
  String? url;

  DocumentationModel(
      {this.id,
      this.type,
      this.category,
      this.title,
      this.shortDescription,
      this.publishedAt,
      this.cover,
      this.attachedFile,
      this.url});

  DocumentationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    category = json['category'];
    title = json['title'];
    shortDescription = json['short_description'];
    publishedAt = json['published_at'];
    cover = json['cover'];
    attachedFile = json['attached_file'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['category'] = category;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['published_at'] = publishedAt;
    data['cover'] = cover;
    data['attached_file'] = attachedFile;
    data['url'] = url;
    return data;
  }
}
