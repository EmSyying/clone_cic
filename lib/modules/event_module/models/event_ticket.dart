class EventTicket {
  bool? success;
  String? message;
  Ticket? ticket;

  EventTicket({this.success, this.message, this.ticket});

  EventTicket.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    ticket = json['ticket'] != null ? Ticket.fromJson(json['ticket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (ticket != null) {
      data['ticket'] = ticket!.toJson();
    }
    return data;
  }
}

class Ticket {
  int? id;
  String? name;
  String? event;
  String? hostAt;
  String? date;
  String? fromTime;
  String? toTime;
  String? place;
  String? location;
  double? latitude;
  double? longitude;
  String? livestreamLink;

  Ticket(
      {this.id,
      this.name,
      this.event,
      this.hostAt,
      this.date,
      this.fromTime,
      this.toTime,
      this.place,
      this.location,
      this.latitude,
      this.longitude,
      this.livestreamLink});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    event = json['event'];
    hostAt = json['host_at'];
    date = json['date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    livestreamLink = json['livestream_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['event'] = event;
    data['host_at'] = hostAt;
    data['date'] = date;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['livestream_link'] = livestreamLink;
    return data;
  }
}
