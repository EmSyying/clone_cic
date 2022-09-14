import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_profile_model.freezed.dart';
part 'personal_profile_model.g.dart';

@freezed
class PersonalProfile with _$PersonalProfile {
  factory PersonalProfile(
      {final int? id,
      final String? display,
      @JsonKey(name: 'customer_name')
          final String? customerName,
      @JsonKey(name: 'customer_latin_name')
          final String? customerLatinName,
      @JsonKey(name: 'customer_date_of_birth')
          final String? customerDateOfBirth,
      @JsonKey(name: 'customer_gender')
          final CustomerGender? customerGender,
      @JsonKey(name: 'customer_nationality')
          final CustomerGender? customerNationality,
      final CustomerGender? position,
      final String? recommended,
      @JsonKey(name: 'number_share')
          final int? numberShare,
      final String? expertise,
      @JsonKey(name: 'member_type')
          final String? memberType,
      @JsonKey(name: 'year_joined')
          final String? yearJoined,
      @JsonKey(name: 'profile_biography')
          final String? profileBiography,
      final String? about,
      final String? other,
      @JsonKey(name: 'customer_identity_type')
          final CustomerGender? customerIdentityType,
      @JsonKey(name: 'customer_identity_number')
          final String? customerIdentityNumber,
      @JsonKey(name: 'customer_identity_date')
          final String? customerIdentityDate,
      @JsonKey(name: 'customer_identity_expired_date')
          final String? customerIdentityExpiredDate,
      @JsonKey(name: 'current_address')
          final CurrentAddress? currentAddress,
      @JsonKey(name: 'street_no')
          final String? streetNo,
      @JsonKey(name: 'house_no')
          final String? houseNo,
      @JsonKey(name: 'permanent_address')
          final CurrentAddress? permanentAddress,
      @JsonKey(name: 'permanent_street_no')
          final String? permanentStreetNo,
      @JsonKey(name: 'permanent_house_no')
          final String? permanentHouseNo,
      final String? phone,
      final String? email,
      final String? whatapp,
      final String? telegram,
      final String? messenger,
      final String? skype,
      final String? website,
      final String? facebook,
      final String? linkedin,
      final String? twitter,
      @JsonKey(name: 'company_name')
          final String? companyName,
      final String? title,
      final String? location,
      final String? profile}) = _PersonalProfile;

  factory PersonalProfile.fromJson(Map<String, dynamic> json) =>
      _$PersonalProfileFromJson(json);
}
