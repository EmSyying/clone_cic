class ApplicationCardModel {
  List<ApplicationData>? data;
  // Links? links;
  // Meta? meta;

  ApplicationCardModel({this.data});

  ApplicationCardModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ApplicationData>[];
      json['data'].forEach((v) {
        data!.add(ApplicationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ApplicationData {
  int? id;
  int? step;
  String? companyName;
  String? status;
  int? countDownDate; // add expire date
  String? updatedAt;
  String? createdAt;

  ApplicationData(
      {this.id,
      this.step,
      this.countDownDate,
      this.companyName,
      this.status,
      this.updatedAt,
      this.createdAt});

  ApplicationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    step = json['step'];
    countDownDate = json['count_down_save_draft'];
    companyName = json['company_name'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['step'] = step;
    data['count_down_save_draft'] = countDownDate;
    data['company_name'] = companyName;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}

// class Links {
//   String? first;
//   String? last;
//   Null prev;
//   Null next;

//   Links({this.first, this.last, this.prev, this.next});

//   Links.fromJson(Map<String, dynamic> json) {
//     first = json['first'];
//     last = json['last'];
//     prev = json['prev'];
//     next = json['next'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['first'] = first;
//     data['last'] = last;
//     data['prev'] = this.prev;
//     data['next'] = this.next;
//     return data;
//   }
// }

// class Meta {
//   int? currentPage;
//   int? from;
//   int? lastPage;
//   String? path;
//   int? perPage;
//   int? to;
//   int? total;

//   Meta(
//       {this.currentPage,
//       this.from,
//       this.lastPage,
//       this.path,
//       this.perPage,
//       this.to,
//       this.total});

//   Meta.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['current_page'] = currentPage;
//     data['from'] = from;
//     data['last_page'] = lastPage;
//     data['path'] = path;
//     data['per_page'] = perPage;
//     data['to'] = to;
//     data['total'] = total;
//     return data;
//   }
// }
