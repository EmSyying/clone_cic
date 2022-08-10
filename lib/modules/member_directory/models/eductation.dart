import 'package:cicgreenloan/Utils/helper/option_model/option_form.dart';
import 'package:cicgreenloan/modules/ut_trading/models/link.dart';
import 'package:cicgreenloan/modules/ut_trading/models/meta.dart';

class EducationModel {
  List<EducationData>? data;
  Links? links;
  Meta? meta;

  EducationModel({this.data, this.links, this.meta});

  EducationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EducationData>[];
      json['data'].forEach((v) {
        data!.add(EducationData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class EducationData {
  int? id;
  int? memberId;
  String? school;
  OptionForm? degree;
  OptionForm? fieldOfStudy;
  String? startDate;
  String? endDate;
  String? grade;
  String? description;

  EducationData(
      {this.id,
      this.memberId,
      this.school,
      this.degree,
      this.fieldOfStudy,
      this.startDate,
      this.endDate,
      this.grade,
      this.description});

  EducationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    school = json['school'];
    degree =
        json['degree'] != null ? OptionForm.fromJson(json['degree']) : null;
    fieldOfStudy = json['field_of_study'] != null
        ? OptionForm.fromJson(json['field_of_study'])
        : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    grade = json['grade'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['school'] = school;
    if (degree != null) {
      data['degree'] = degree!.toJson();
    }
    if (fieldOfStudy != null) {
      data['field_of_study'] = fieldOfStudy!.toJson();
    }
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['grade'] = grade;
    data['description'] = description;
    return data;
  }
}
