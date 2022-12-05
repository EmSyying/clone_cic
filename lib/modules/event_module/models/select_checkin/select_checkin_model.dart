import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_checkin_model.freezed.dart';
part 'select_checkin_model.g.dart';

@freezed
class SelectCheckInModel with _$SelectCheckInModel {
  factory SelectCheckInModel({
    @JsonKey(name: "guest_id") int? guestId,
  }) = _SelectCheckInModel;

  factory SelectCheckInModel.fromJson(Map<String, dynamic> json) =>
      _$SelectCheckInModelFromJson(json);
}
