import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_group_by_year.model.freezed.dart';
part 'reports_group_by_year.model.g.dart';

@freezed
class ReportGroupByYearModel with _$ReportGroupByYearModel {
  factory ReportGroupByYearModel({
    int? id,
    String? type,
    String? category,
    String? title,
    @JsonKey(name: 'short_description') String? shortDescription,
    @JsonKey(name: 'published_at') String? publishedAt,
    String? color,
    String? cover,
    @JsonKey(name: 'attached_file') String? attachedFile,
    String? url,
  }) = _ReportGroupByYearModel;

  factory ReportGroupByYearModel.fromJson(Map<String, dynamic> json) =>
      _$ReportGroupByYearModelFromJson(json);
}
