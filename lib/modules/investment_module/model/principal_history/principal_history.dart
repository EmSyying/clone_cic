import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_history.freezed.dart';
part 'principal_history.g.dart';

@freezed
class PrincipalHistory with _$PrincipalHistory {
  factory PrincipalHistory({
    String? type,
    String? label,
    String? date,
    @JsonKey(name: 'color_code') String? colorCode,
    @JsonKey(name: 'investment_amount') String? investmentAmount,
  }) = _PrincipalHistory;

  factory PrincipalHistory.fromJson(Map<String, dynamic> json) =>
      _$PrincipalHistoryFromJson(json);
}
