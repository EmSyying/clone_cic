import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_model.freezed.dart';
part 'guest_model.g.dart';

@freezed
class GuestListModel with _$GuestListModel {
  factory GuestListModel({
    final int? id,
    @JsonKey(name: 'participant_name') final String? participantName,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    final String? relationship,
    @Default(false) final bool? isCheckBox,
  }) = _GuestListModel;

  factory GuestListModel.fromJson(Map<String, dynamic> json) =>
      _$GuestListModelFromJson(json);
}
