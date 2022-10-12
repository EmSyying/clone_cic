import 'package:freezed_annotation/freezed_annotation.dart';

part 'invester.freezed.dart';
part 'invester.g.dart';

@freezed
class InvesterModel with _$InvesterModel {
  factory InvesterModel({
    @JsonKey(name: 'invester_id') String? investerId,
    @JsonKey(name: 'invester_name') String? investerName,
  }) = _InvesterModel;

  factory InvesterModel.fromJson(Map<String, dynamic> json) =>
      _$InvesterModelFromJson(json);
}
