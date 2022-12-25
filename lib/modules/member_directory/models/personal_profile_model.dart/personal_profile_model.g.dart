// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonalProfile _$$_PersonalProfileFromJson(Map<String, dynamic> json) =>
    _$_PersonalProfile(
      id: json['id'] as int?,
      display: json['display'] as String?,
      code: json['code'] as String?,
      position: json['position'] as String?,
      name: json['name'] as String?,
      isTicked: json['isTicked'] as bool? ?? false,
      defaultPhoto: json['default_photo'] as String?,
      customerDateOfBirth: json['date_of_birth'] as String?,
      customerGender: json['gender'] == null
          ? null
          : CustomerGender.fromJson(json['gender'] as Map<String, dynamic>),
      customerNationality: json['nationality'] == null
          ? null
          : CustomerGender.fromJson(
              json['nationality'] as Map<String, dynamic>),
      recommended: json['recommended'] as String?,
      numberShare: json['number_share'] as int?,
      expertise: json['expertise'] as String?,
      memberType: json['member_type'] as String?,
      yearJoined: json['year_joined'] as String?,
      profileBiography: json['profile_biography'] as String?,
      about: json['about'] as String?,
      other: json['other'] as String?,
      customerIdentityType: json['identity_type'] == null
          ? null
          : CustomerGender.fromJson(
              json['identity_type'] as Map<String, dynamic>),
      customerIdentityNumber: json['identity_number'] as String?,
      customerIdentityDate: json['identity_date'] as String?,
      customerIdentityExpiredDate: json['identity_expired_date'] as String?,
      currentAddress: json['current_address'] == null
          ? null
          : CurrentAddress.fromJson(
              json['current_address'] as Map<String, dynamic>),
      streetNo: json['street_no'] as String?,
      houseNo: json['house_no'] as String?,
      permanentAddress: json['permanent_address'] == null
          ? null
          : CurrentAddress.fromJson(
              json['permanent_address'] as Map<String, dynamic>),
      permanentStreetNo: json['permanent_street_no'] as String?,
      permanentHouseNo: json['permanent_house_no'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      whatapp: json['whatapp'] as String?,
      telegram: json['telegram'] as String?,
      messenger: json['messenger'] as String?,
      skype: json['skype'] as String?,
      website: json['website'] as String?,
      facebook: json['facebook'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
      companyName: json['company_name'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      profile: json['profile'] as String?,
    );

Map<String, dynamic> _$$_PersonalProfileToJson(_$_PersonalProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display': instance.display,
      'code': instance.code,
      'position': instance.position,
      'name': instance.name,
      'isTicked': instance.isTicked,
      'default_photo': instance.defaultPhoto,
      'date_of_birth': instance.customerDateOfBirth,
      'gender': instance.customerGender,
      'nationality': instance.customerNationality,
      'recommended': instance.recommended,
      'number_share': instance.numberShare,
      'expertise': instance.expertise,
      'member_type': instance.memberType,
      'year_joined': instance.yearJoined,
      'profile_biography': instance.profileBiography,
      'about': instance.about,
      'other': instance.other,
      'identity_type': instance.customerIdentityType,
      'identity_number': instance.customerIdentityNumber,
      'identity_date': instance.customerIdentityDate,
      'identity_expired_date': instance.customerIdentityExpiredDate,
      'current_address': instance.currentAddress,
      'street_no': instance.streetNo,
      'house_no': instance.houseNo,
      'permanent_address': instance.permanentAddress,
      'permanent_street_no': instance.permanentStreetNo,
      'permanent_house_no': instance.permanentHouseNo,
      'phone': instance.phone,
      'email': instance.email,
      'whatapp': instance.whatapp,
      'telegram': instance.telegram,
      'messenger': instance.messenger,
      'skype': instance.skype,
      'website': instance.website,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'company_name': instance.companyName,
      'title': instance.title,
      'location': instance.location,
      'profile': instance.profile,
    };
