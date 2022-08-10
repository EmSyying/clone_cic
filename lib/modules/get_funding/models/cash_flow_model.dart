class FileForm {
  String? type;
  String? mimeType;
  String? url;

  FileForm({this.type, this.mimeType, this.url});

  FileForm.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mimeType = json['mime_type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['mime_type'] = mimeType;
    data['url'] = url;
    return data;
  }
}
