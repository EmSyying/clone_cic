import 'package:freezed_annotation/freezed_annotation.dart';

part 'fif_detail_model.freezed.dart';
part 'fif_detail_model.g.dart';

@freezed
class FiFDetailModel with _$FiFDetailModel {
  factory FiFDetailModel({
    final String? list,
  }) = _FiFDetailModel;

  factory FiFDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FiFDetailModelFromJson(json);
}
