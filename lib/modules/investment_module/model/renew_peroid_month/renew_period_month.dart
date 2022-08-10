import 'package:freezed_annotation/freezed_annotation.dart';

part 'renew_period_month.freezed.dart';
part 'renew_period_month.g.dart';

@freezed
class RenewPeroidMonth with _$RenewPeroidMonth {
  factory RenewPeroidMonth({
    List<String>? renewPeriodList,
  }) = _RenewPeroidMonth;

  factory RenewPeroidMonth.fromJson(Map<String, dynamic> json) =>
      _$RenewPeroidMonthFromJson(json);
}
