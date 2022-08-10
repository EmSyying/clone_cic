class DocumentType {
  int? id;
  String? display;

  DocumentType({this.id, this.display});

  DocumentType.fromJson(Map<String, dynamic> json) {
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

class ReportForm {
  List<DocumentTypes>? documentTypes;

  ReportForm({this.documentTypes});

  ReportForm.fromJson(Map<String, dynamic> json) {
    if (json['document_types'] != null) {
      documentTypes = <DocumentTypes>[];
      json['document_types'].forEach((v) {
        documentTypes!.add(DocumentTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documentTypes != null) {
      data['document_types'] = documentTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DocumentTypes {
  int? id;
  String? display;
  List<DocumentType>? children;

  DocumentTypes({this.id, this.display, this.children});

  DocumentTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
    if (json['children'] != null) {
      children = <DocumentType>[];
      json['children'].forEach((v) {
        children!.add(DocumentType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
