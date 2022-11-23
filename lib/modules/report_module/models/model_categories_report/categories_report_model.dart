import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_report_model.freezed.dart';
part 'categories_report_model.g.dart';

@freezed
class CategorieReportModel with _$CategorieReportModel {
  factory CategorieReportModel({
    int? id,
    String? category,
    @JsonKey(name: 'report_count') int? reportCount,
    String? color,
    String? icon,
  }) = _CategorieReportModel;

  factory CategorieReportModel.fromJson(Map<String, dynamic> json) =>
      _$CategorieReportModelFromJson(json);
}
