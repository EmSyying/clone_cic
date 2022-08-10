import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Address extends Equatable {
  String? code;
  String? name;

  Address({this.code, this.name});

  Address.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [code, name];
}
