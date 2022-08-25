import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class Contacts with _$Contacts {

  factory Contacts({
     String? phone,
  String? mobile,
  }) = _Contacts;

  factory Contacts.fromJson(Map<String, dynamic> json) => _$ContactsFromJson(json);
}