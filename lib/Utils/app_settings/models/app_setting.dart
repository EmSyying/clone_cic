class AppSetting {
  String? applicationName;
  String? applicationVersion;
  String? googleMapsKey;
  String? firebaseToken;
  String? applicationLogo;
  String? brightPrimaryColor;
  String? brightSecondColor;
  String? brightAccentColor;
  String? brightCardColor;
  String? darkPrimaryColor;
  String? darkSecondColor;
  String? darkAccentColor;
  String? darkCardColor;
  String? applicationNewVersion;
  String? applicationType;
  String? androidLink;
  String? iosInk;
  AboutApp? aboutApp;
  Password? password;
  String? userToken;

  AppSetting(
      {this.applicationName,
      this.applicationVersion,
      this.googleMapsKey,
      this.firebaseToken,
      this.applicationLogo,
      this.brightPrimaryColor,
      this.brightSecondColor,
      this.brightAccentColor,
      this.brightCardColor,
      this.darkPrimaryColor,
      this.darkSecondColor,
      this.darkAccentColor,
      this.darkCardColor,
      this.applicationNewVersion,
      this.applicationType,
      this.androidLink,
      this.iosInk,
      this.aboutApp,
      this.password,
      this.userToken});

  AppSetting.fromJson(Map<String, dynamic> json) {
    applicationName = json['application_name'];
    applicationVersion = json['application_version'];
    googleMapsKey = json['google_maps_key'];
    firebaseToken = json['firebase_token'];
    applicationLogo = json['application_logo'];
    brightPrimaryColor = json['bright_primary_color'];
    brightSecondColor = json['bright_second_color'];
    brightAccentColor = json['bright_accent_color'];
    brightCardColor = json['bright_card_color'];
    darkPrimaryColor = json['dark_primary_color'];
    darkSecondColor = json['dark_second_color'];
    darkAccentColor = json['dark_accent_color'];
    darkCardColor = json['dark_card_color'];
    applicationNewVersion = json['application_new_version'];
    applicationType = json['application_type'];
    androidLink = json['android_link'];
    iosInk = json['ios_ink'];
    aboutApp =
        json['about_app'] != null ? AboutApp.fromJson(json['about_app']) : null;
    password =
        json['password'] != null ? Password.fromJson(json['password']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['application_name'] = applicationName;
    data['application_version'] = applicationVersion;
    data['google_maps_key'] = googleMapsKey;
    data['firebase_token'] = firebaseToken;
    data['application_logo'] = applicationLogo;
    data['bright_primary_color'] = brightPrimaryColor;
    data['bright_second_color'] = brightSecondColor;
    data['bright_accent_color'] = brightAccentColor;
    data['bright_card_color'] = brightCardColor;
    data['dark_primary_color'] = darkPrimaryColor;
    data['dark_second_color'] = darkSecondColor;
    data['dark_accent_color'] = darkAccentColor;
    data['dark_card_color'] = darkCardColor;
    data['application_new_version'] = applicationNewVersion;
    data['application_type'] = applicationType;
    data['android_link'] = androidLink;
    data['ios_ink'] = iosInk;
    if (aboutApp != null) {
      data['about_app'] = aboutApp!.toJson();
      if (password != null) {
        data['password'] = password!.toJson();
      }
    }
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
