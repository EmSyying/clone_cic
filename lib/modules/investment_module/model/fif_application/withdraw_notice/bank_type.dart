import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_type.freezed.dart';
part 'bank_type.g.dart';

@freezed
class BankType with _$BankType {
  factory BankType({
    int? id,
    @JsonKey(name: 'bank_name') String? bankName,
  }) = _BankType;

  factory BankType.fromJson(Map<String, dynamic> json) =>
      _$BankTypeFromJson(json);
}
