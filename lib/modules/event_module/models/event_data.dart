class EventData {
  int? id;
  String? title;
  String? eventBy;
  String? startDate;
  String? endDate;
  String? date;
  String? fromTime;
  String? toTime;
  String? description;
  List<String>? registerProfile;
  int? registerNumber;
  String? cover;
  String? thumbnail;
  String? hostAt;
  String? livestreamLink;
  String? place;
  String? location;
  double? latitude;
  double? longitude;
  String? posted;
  bool? isInterested;
  bool? isUnterest;
  int? interested;
  int? uninterested;
  String? contactOrganiser;
  String? telegramLink;
  bool? isCheckin;
  bool? isRegister;
  bool? isOpen;

  EventData(
      {this.id,
      this.title,
      this.eventBy,
      this.startDate,
      this.endDate,
      this.date,
      this.fromTime,
      this.toTime,
      this.description,
      this.registerProfile,
      this.registerNumber,
      this.cover,
      this.thumbnail,
      this.hostAt,
      this.livestreamLink,
      this.place,
      this.location,
      this.latitude,
      this.longitude,
      this.posted,
      this.isInterested,
      this.interested,
      this.uninterested,
      this.contactOrganiser,
      this.isCheckin,
      this.telegramLink,
      this.isUnterest,
      this.isRegister,
      this.isOpen});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? '';
    eventBy = json['event_by'];
    startDate = json['start_date'] ?? '';
    endDate = json['end_date'] ?? '';
    date = json['date'] ?? '';
    fromTime = json['from_time'] ?? '';
    toTime = json['to_time'] ?? '';
    description = json['description'] ?? '';
    registerProfile = json['register_profile'].cast<String>();
    registerNumber = json['register_number'];
    cover = json['cover'] ?? '';
    thumbnail = json['thumbnail'] ?? '';
    hostAt = json['host_at'] ?? '';
    livestreamLink = json['livestream_link'] ?? '';
    place = json['place'] ?? '';
    location = json['location'] ?? '';
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
    isCheckin = json['is_checked_in'];
    posted = json['posted'] ?? '';
    isInterested = json['is_interested'];
    isUnterest = json['is_uninterested'];
    interested = json['interested'];
    uninterested = json['uninterested'];
    contactOrganiser = json['contact_organiser'] ?? '';
    telegramLink = json['telegram_link'] ?? '';
    isRegister = json['is_register'] ?? '';
    isOpen = json['is_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['event_by'] = eventBy;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['date'] = date;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['description'] = description;
    data['register_profile'] = registerProfile;
    data['register_number'] = registerNumber;
    data['cover'] = cover;
    data['thumbnail'] = thumbnail;
    data['host_at'] = hostAt;
    data['livestream_link'] = livestreamLink;
    data['place'] = place;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['posted'] = posted;
    data['is_interested'] = isInterested;
    data['is_uninterested'] = uninterested;
    data['interested'] = interested;
    data['uninterested'] = uninterested;
    data['contact_organiser'] = contactOrganiser;
    data['telegram_link'] = telegramLink;
    return data;
  }
}
