class Setting {
  String? brightCardColor;
  String? brightAccentColor;
  String? brightSecondColor;
  String? brightPrimaryColor;
  String? darkCardColor;
  String? darkAccentColor;
  String? darkSecondColor;
  String? darkPrimaryColor;
  String? applicationLogo;
  String? firebaseToken;
  String? googleMapsKey;
  String? applicationVersion;
  String? applicationNewVersion;
  String? iosInk;
  String? androidLink;
  String? applicationType;
  String? applicationName;
  bool? enableDirectTrading;
  bool? enablePinCode;
  String? serviceAgreement;
  Password? password;
  AboutApp? aboutApp;
  String? userToken;

  Setting(
      {this.brightCardColor,
      this.brightAccentColor,
      this.brightSecondColor,
      this.brightPrimaryColor,
      this.darkCardColor,
      this.darkAccentColor,
      this.darkSecondColor,
      this.darkPrimaryColor,
      this.applicationLogo,
      this.firebaseToken,
      this.googleMapsKey,
      this.applicationVersion,
      this.applicationNewVersion,
      this.iosInk,
      this.androidLink,
      this.applicationType,
      this.applicationName,
      this.enableDirectTrading,
      this.enablePinCode,
      this.serviceAgreement,
      this.password,
      this.aboutApp,
      this.userToken});

  Setting.fromJson(Map<String, dynamic> json) {
    brightCardColor = json['bright_card_color'];
    brightAccentColor = json['bright_accent_color'];
    brightSecondColor = json['bright_second_color'];
    brightPrimaryColor = json['bright_primary_color'];
    darkCardColor = json['dark_card_color'];
    darkAccentColor = json['dark_accent_color'];
    darkSecondColor = json['dark_second_color'];
    darkPrimaryColor = json['dark_primary_color'];
    applicationLogo = json['application_logo'];
    firebaseToken = json['firebase_token'];
    googleMapsKey = json['google_maps_key'];
    applicationVersion = json['application_version'];
    applicationNewVersion = json['application_new_version'];
    iosInk = json['ios_ink'];
    androidLink = json['android_link'];
    applicationType = json['application_type'];
    applicationName = json['application_name'];
    enableDirectTrading = json['enable_direct_trading'];
    enablePinCode = json['enable_pin_code'];
    serviceAgreement = json['service_agreement'];
    password =
        json['password'] != null ? Password.fromJson(json['password']) : null;
    aboutApp =
        json['about_app'] != null ? AboutApp.fromJson(json['about_app']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bright_card_color'] = brightCardColor;
    data['bright_accent_color'] = brightAccentColor;
    data['bright_second_color'] = brightSecondColor;
    data['bright_primary_color'] = brightPrimaryColor;
    data['dark_card_color'] = darkCardColor;
    data['dark_accent_color'] = darkAccentColor;
    data['dark_second_color'] = darkSecondColor;
    data['dark_primary_color'] = darkPrimaryColor;
    data['application_logo'] = applicationLogo;
    data['firebase_token'] = firebaseToken;
    data['google_maps_key'] = googleMapsKey;
    data['application_version'] = applicationVersion;
    data['application_new_version'] = applicationNewVersion;
    data['ios_ink'] = iosInk;
    data['android_link'] = androidLink;
    data['application_type'] = applicationType;
    data['application_name'] = applicationName;
    data['enable_direct_trading'] = enableDirectTrading;
    data['enable_pin_code'] = enablePinCode;
    data['service_agreement'] = serviceAgreement;
    if (password != null) {
      data['password'] = password!.toJson();
    }
    if (aboutApp != null) {
      data['about_app'] = aboutApp!.toJson();
    }
    return data;
  }
}

class Password {
  String? passwordMinLength;
  String? passwordRequiredLowercase;
  String? passwordRequiredUppercase;
  String? passwordRequiredSpecialCharacters;

  Password(
      {this.passwordMinLength,
      this.passwordRequiredLowercase,
      this.passwordRequiredUppercase,
      this.passwordRequiredSpecialCharacters});

  Password.fromJson(Map<String, dynamic> json) {
    passwordMinLength = json['password_min_length'];
    passwordRequiredLowercase = json['password_required_lowercase'];
    passwordRequiredUppercase = json['password_required_uppercase'];
    passwordRequiredSpecialCharacters =
        json['password_required_special_characters'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password_min_length'] = passwordMinLength;
    data['password_required_lowercase'] = passwordRequiredLowercase;
    data['password_required_uppercase'] = passwordRequiredUppercase;
    data['password_required_special_characters'] =
        passwordRequiredSpecialCharacters;
    return data;
  }
}

class AboutApp {
  String? aboutAppKhmer;
  String? aboutAppEnglish;

  AboutApp({this.aboutAppKhmer, this.aboutAppEnglish});

  AboutApp.fromJson(Map<String, dynamic> json) {
    aboutAppKhmer = json['about_app_khmer'];
    aboutAppEnglish = json['about_app_english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['about_app_khmer'] = aboutAppKhmer;
    data['about_app_english'] = aboutAppEnglish;
    return data;
  }
}
