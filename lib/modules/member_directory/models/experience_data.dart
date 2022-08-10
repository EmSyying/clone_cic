import 'package:cicgreenloan/modules/member_directory/models/employee_type.dart';

class ExperienceData {
  int? id;
  int? memberId;
  String? title;
  EmploymentType? employmentType;
  String? companyName;
  String? location;
  String? startDate;
  String? endDate;
  String? description;

  ExperienceData(
      {this.id,
      this.memberId,
      this.title,
      this.employmentType,
      this.companyName,
      this.location,
      this.startDate,
      this.endDate,
      this.description});

  ExperienceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    title = json['title'];
    employmentType = json['employment_type'] != null
        ? EmploymentType.fromJson(json['employment_type'])
        : null;
    companyName = json['company_name'];
    location = json['location'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['title'] = title;
    if (employmentType != null) {
      data['employment_type'] = employmentType!.toJson();
    }
    data['company_name'] = companyName;
    data['location'] = location;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    return data;
  }
}
