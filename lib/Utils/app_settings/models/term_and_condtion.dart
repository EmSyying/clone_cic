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

class PrivacyPolicy {
  String? privacyPolicyKhmer;
  String? privacyPolicyEnglish;

  PrivacyPolicy({this.privacyPolicyEnglish, this.privacyPolicyKhmer});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    privacyPolicyKhmer = json['privacy_and_policy_khmer'];
    privacyPolicyEnglish = json['privacy_and_policy_english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privacy_and_policy_khmer'] = privacyPolicyKhmer;
    data['privacy_and_policy_english'] = privacyPolicyEnglish;
    return data;
  }
}
