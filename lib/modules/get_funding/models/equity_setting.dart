import 'package:freezed_annotation/freezed_annotation.dart';

part 'equity_setting.freezed.dart';
part 'equity_setting.g.dart';

@freezed
class EquitySetting with _$EquitySetting {
  factory EquitySetting(
      {@JsonKey(name: "min_equity_amount") final int? minEquityAmount,
      @JsonKey(name: "max_equity_amount") final int? maxEquityAmount,
      @JsonKey(name: "equity_message") final String? message}) = _EquitySetting;

  factory EquitySetting.fromJson(Map<String, dynamic> json) =>
      _$EquitySettingFromJson(json);
}
