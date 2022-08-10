import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_center.freezed.dart';
part 'call_center.g.dart';

@freezed
class CallCenterModel with _$CallCenterModel {
  factory CallCenterModel({
    String? link,
    String? phone,
  }) = _CallCenterModel;

  factory CallCenterModel.fromJson(Map<String, dynamic> json) =>
      _$CallCenterModelFromJson(json);
}
