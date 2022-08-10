class TermAndConditions {
  String? termAndConditionKhmer;
  String? termAndConditionEnglish;

  TermAndConditions({this.termAndConditionKhmer, this.termAndConditionEnglish});

  TermAndConditions.fromJson(Map<String, dynamic> json) {
    termAndConditionKhmer = json['term_and_condition_khmer'];
    termAndConditionEnglish = json['term_and_condition_english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term_and_condition_khmer'] = termAndConditionKhmer;
    data['term_and_condition_english'] = termAndConditionEnglish;
    return data;
  }
}
