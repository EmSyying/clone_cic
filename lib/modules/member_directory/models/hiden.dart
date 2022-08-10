class Hiden {
  int? memberId;
  String? page;
  String? field;
  int? createdBy;
  int? active;
  String? updatedAt;
  String? createdAt;
  int? id;

  Hiden(
      {this.memberId,
      this.page,
      this.field,
      this.createdBy,
      this.active,
      this.updatedAt,
      this.createdAt,
      this.id});

  Hiden.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    page = json['page'];
    field = json['field'];
    createdBy = json['created_by'];
    active = json['active'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['page'] = page;
    data['field'] = field;
    data['created_by'] = createdBy;
    data['active'] = active;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
