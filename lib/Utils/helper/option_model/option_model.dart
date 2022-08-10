import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Optionmodel extends Equatable {
  int? id;
  String? displayKhmer;
  String? display;
  String? sign;
  String? name;

  Optionmodel({this.id, this.display, this.sign});

  Optionmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
    sign = json['sign'];
    name = json['name'];
    displayKhmer = json['display_khmer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    data['sign'] = sign;
    data['name'] = name;
    data['display_khmer'] = displayKhmer;
    return data;
  }

  @override
  List<Object?> get props => [name, id, display, displayKhmer];
}
