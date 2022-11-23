import 'package:freezed_annotation/freezed_annotation.dart';

import '../model_detail_report/reports_group_by_year.model.dart';

part 'list_report_model.freezed.dart';
part 'list_report_model.g.dart';

@freezed
class ListReportModel with _$ListReportModel {
  factory ListReportModel({
    int? date,
    List<ReportGroupByYearModel>? reports,
  }) = _ListReportModel;

  factory ListReportModel.fromJson(Map<String, dynamic> json) =>
      _$ListReportModelFromJson(json);
}
