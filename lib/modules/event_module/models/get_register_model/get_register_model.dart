import 'package:freezed_annotation/freezed_annotation.dart';

import '../guest_model/guest_model.dart';

part 'get_register_model.freezed.dart';
part 'get_register_model.g.dart';

@freezed
class GetRegisterModel with _$GetRegisterModel {
  factory GetRegisterModel({
    int? id,
    String? name,
    String? event,
    @JsonKey(name: 'host_at') final String? hostAt,
    String? date,
    @JsonKey(name: 'from_time') final String? fromTime,
    @JsonKey(name: 'to_time') final String? toTime,
    String? place,
    String? location,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'livestream_link') final String? livestreamLink,
    List<GuestListModel>? guest,
  }) = _GetRegisterModel;

  factory GetRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$GetRegisterModelFromJson(json);
}
