import 'package:freezed_annotation/freezed_annotation.dart';
part 'guide_model.freezed.dart';
part 'guide_model.g.dart';

@freezed
class GuideModel with _$GuideModel {
  factory GuideModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "title_en") final String? title,
    @JsonKey(name: "title_kh") final String? titleKh,
    @JsonKey(name: "content_en") final String? description,
    @JsonKey(name: "content_kh") final String? contentKh,
    dynamic key,
  }) = _GuideModel;
  factory GuideModel.fromJson(Map<String, dynamic> json) =>
      _$GuideModelFromJson(json);
}
