import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_check_in_model.freezed.dart';
part 'event_check_in_model.g.dart';

@freezed
class CheckInModel with _$CheckInModel {
  factory CheckInModel({
    final int? id,
    final String? value,
    final String? display,
    final String? event,
// final Location? location,
    @JsonKey(name: 'start_date') final String? startDate,
    @JsonKey(name: 'end_date') final String? endDate,
    @JsonKey(name: 'is_cic_member') final bool? isCicMember,
    @JsonKey(name: 'participant_name') final String? participantName,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    @JsonKey(name: 'referral_member') final String? referralMember,
    @JsonKey(name: 'check_in') final bool? checkIn,
    @JsonKey(name: 'check_in_date') final String? checkInDate,
  }) = _CheckInModel;

  factory CheckInModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInModelFromJson(json);
}
