import 'package:flutter/material.dart';

class EventCalendar {
  int? year;
  List<Month>? month;

  EventCalendar({this.year, this.month});

  EventCalendar.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    if (json['month'] != null) {
      month = <Month>[];
      json['month'].forEach((v) {
        month!.add(Month.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    if (month != null) {
      data['month'] = month!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Month {
  String? name;
  String? date;
  GlobalKey? key;

  Month({this.name, this.date, this.key});

  Month.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['date'] = date;
    return data;
  }
}
