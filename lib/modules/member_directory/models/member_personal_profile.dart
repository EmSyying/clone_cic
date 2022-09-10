import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:equatable/equatable.dart';

class CustomerGender {
  int? id;
  String? display;
  String? displayKhmer;

  CustomerGender({this.id, this.display, this.displayKhmer});

  CustomerGender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
    displayKhmer = json['display_khmer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    data['display_khmer'] = displayKhmer;
    return data;
  }
}

// ignore: must_be_immutable
class CurrentAddress extends Equatable {
  Address? city;
  Address? district;
  Address? commune;
  Address? village;

  CurrentAddress({this.city, this.district, this.commune, this.village});

  CurrentAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? Address.fromJson(json['city']) : null;
    district =
        json['district'] != null ? Address.fromJson(json['district']) : null;
    commune =
        json['commune'] != null ? Address.fromJson(json['commune']) : null;
    village =
        json['village'] != null ? Address.fromJson(json['village']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (commune != null) {
      data['commune'] = commune!.toJson();
    }
    if (village != null) {
      data['village'] = village!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [city, district, commune, village];
}

class City {
  String? code;
  String? name;

  City({this.code, this.name});

  City.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
