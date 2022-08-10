import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class ScheduleModelList with _$ScheduleModelList {
  factory ScheduleModelList(
      {String? titel,
      @JsonKey(name: 'payment_date') String? paymentDate,
      String? time,
      String? interest,
      String? status}) = _ScheduleModelList;

  factory ScheduleModelList.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelListFromJson(json);
}
