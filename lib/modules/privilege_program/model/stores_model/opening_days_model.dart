import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_days_model.freezed.dart';
part 'opening_days_model.g.dart';

@freezed
class OpeningDaysModel with _$OpeningDaysModel {
  factory OpeningDaysModel({
    @JsonKey(name: 'day_name') String? dayName,
    @JsonKey(name: 'shift_a_hours') String? shiftAHours,
    @JsonKey(name: 'shift_b_hours') String? shiftBHours,
  }) = _OpeningDaysModel;

  factory OpeningDaysModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningDaysModelFromJson(json);
}
