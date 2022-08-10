class RegisteredMember {
  List<RegistrationEventData>? data;
  Links? links;
  Meta? meta;

  RegisteredMember({this.data, this.links, this.meta});

  RegisteredMember.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RegistrationEventData>[];
      json['data'].forEach((v) {
        data!.add(RegistrationEventData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class RegistrationEventData {
  int? id;
  String? event;
  bool? isCicMember;
  String? participantName;
  String? companyName;
  String? position;
  String? phoneNumber;
  String? email;
  String? referralMember;
  bool? checkIn;
  String? checkInDate;
  String? image;

  RegistrationEventData(
      {this.id,
      this.event,
      this.isCicMember,
      this.participantName,
      this.companyName,
      this.position,
      this.phoneNumber,
      this.email,
      this.referralMember,
      this.checkIn,
      this.checkInDate,
      this.image});

  RegistrationEventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    event = json['event'];
    isCicMember = json['is_cic_member'];
    participantName = json['participant_name'];
    companyName = json['company_name'];
    position = json['position'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    referralMember = json['referral_member'];
    checkIn = json['check_in'];
    checkInDate = json['check_in_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['event'] = event;
    data['is_cic_member'] = isCicMember;
    data['participant_name'] = participantName;
    data['company_name'] = companyName;
    data['position'] = position;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['referral_member'] = referralMember;
    data['check_in'] = checkIn;
    data['check_in_date'] = checkInDate;
    data['image'] = image;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
