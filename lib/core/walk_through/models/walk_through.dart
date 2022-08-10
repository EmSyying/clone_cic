class TermAndCondition {
  ContactUs? contactUs;
  Copyrights? copyrights;
  TermAndConditions? termAndConditions;
  PrivacyAndPolicies? privacyAndPolicies;

  TermAndCondition(
      {this.contactUs,
      this.copyrights,
      this.termAndConditions,
      this.privacyAndPolicies});

  TermAndCondition.fromJson(Map<String, dynamic> json) {
    contactUs = json['contact_us'] != null
        ? ContactUs.fromJson(json['contact_us'])
        : null;
    copyrights = json['copyrights'] != null
        ? Copyrights.fromJson(json['copyrights'])
        : null;
    termAndConditions = json['term_and_conditions'] != null
        ? TermAndConditions.fromJson(json['term_and_conditions'])
        : null;
    privacyAndPolicies = json['privacy_and_policies'] != null
        ? PrivacyAndPolicies.fromJson(json['privacy_and_policies'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contactUs != null) {
      data['contact_us'] = contactUs!.toJson();
    }
    if (copyrights != null) {
      data['copyrights'] = copyrights!.toJson();
    }
    if (termAndConditions != null) {
      data['term_and_conditions'] = termAndConditions!.toJson();
    }
    if (privacyAndPolicies != null) {
      data['privacy_and_policies'] = privacyAndPolicies!.toJson();
    }
    return data;
  }
}

class ContactUs {
  String? companyKhmerName;
  String? companyEnglishName;
  String? companyHeadOffice;
  String? companyPhone;
  String? logo;

  ContactUs(
      {this.companyKhmerName,
      this.companyEnglishName,
      this.companyHeadOffice,
      this.companyPhone,
      this.logo});

  ContactUs.fromJson(Map<String, dynamic> json) {
    companyKhmerName = json['company_khmer_name'] ?? '';
    companyEnglishName = json['company_english_name'] ?? '';
    companyHeadOffice = json['company_head_office'] ?? '';
    companyPhone = json['company_phone'] ?? '';
    logo = json['logo'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_khmer_name'] = companyKhmerName;
    data['company_english_name'] = companyEnglishName;
    data['company_head_office'] = companyHeadOffice;
    data['company_phone'] = companyPhone;
    data['logo'] = logo;
    return data;
  }
}

class Copyrights {
  String? copyrightKhmer;
  String? copyrightEnglish;

  Copyrights({this.copyrightKhmer, this.copyrightEnglish});

  Copyrights.fromJson(Map<String, dynamic> json) {
    copyrightKhmer = json['copyright_khmer'] ?? '';
    copyrightEnglish = json['copyright_english'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['copyright_khmer'] = copyrightKhmer;
    data['copyright_english'] = copyrightEnglish;
    return data;
  }
}

class TermAndConditions {
  String? termAndConditionKhmer;
  String? termAndConditionEnglish;

  TermAndConditions({this.termAndConditionKhmer, this.termAndConditionEnglish});

  TermAndConditions.fromJson(Map<String, dynamic> json) {
    termAndConditionKhmer = json['term_and_condition_khmer'] ?? '';
    termAndConditionEnglish = json['term_and_condition_english'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term_and_condition_khmer'] = termAndConditionKhmer;
    data['term_and_condition_english'] = termAndConditionEnglish;
    return data;
  }
}

class PrivacyAndPolicies {
  String? privacyAndPolicyKhmer;
  String? privacyAndPolicyEnglish;

  PrivacyAndPolicies(
      {this.privacyAndPolicyKhmer, this.privacyAndPolicyEnglish});

  PrivacyAndPolicies.fromJson(Map<String, dynamic> json) {
    privacyAndPolicyKhmer = json['privacy_and_policy_khmer'] ?? '';
    privacyAndPolicyEnglish = json['privacy_and_policy_english'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privacy_and_policy_khmer'] = privacyAndPolicyKhmer;
    data['privacy_and_policy_english'] = privacyAndPolicyEnglish;
    return data;
  }
}
