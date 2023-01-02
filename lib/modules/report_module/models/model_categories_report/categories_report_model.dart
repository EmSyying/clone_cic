import 'package:flutter/material.dart';

class CategorieReportModel {
  int? id;
  String? category;
  int? reportCount;
  String? color;
  String? icon;
  String? guideline;
  GlobalKey? key;

  CategorieReportModel(
      {this.id,
      this.category,
      this.reportCount,
      this.color,
      this.icon,
      this.guideline});

  CategorieReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    reportCount = json['report_count'];
    color = json['color'];
    icon = json['icon'];
    guideline = json['guideline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['report_count'] = reportCount;
    data['color'] = color;
    data['icon'] = icon;
    data['guideline'] = guideline;
    return data;
  }
}
