// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalProfile _$PersonalProfileFromJson(Map<String, dynamic> json) {
  return _PersonalProfile.fromJson(json);
}

/// @nodoc
mixin _$PersonalProfile {
  int? get id => throw _privateConstructorUsedError;
  String? get display => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool? get isTicked => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_photo')
  String? get defaultPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get customerDateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  CustomerGender? get customerGender => throw _privateConstructorUsedError;
  @JsonKey(name: 'nationality')
  CustomerGender? get customerNationality => throw _privateConstructorUsedError;
  String? get recommended => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_share')
  int? get numberShare => throw _privateConstructorUsedError;
  String? get expertise => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_type')
  String? get memberType => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_joined')
  String? get yearJoined => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_biography')
  String? get profileBiography => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get other => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_type')
  CustomerGender? get customerIdentityType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_number')
  String? get customerIdentityNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_date')
  String? get customerIdentityDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_expired_date')
  String? get customerIdentityExpiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_address')
  CurrentAddress? get currentAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'street_no')
  String? get streetNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_no')
  String? get houseNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'permanent_address')
  CurrentAddress? get permanentAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'permanent_street_no')
  String? get permanentStreetNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'permanent_house_no')
  String? get permanentHouseNo => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get whatapp => throw _privateConstructorUsedError;
  String? get telegram => throw _privateConstructorUsedError;
  String? get messenger => throw _privateConstructorUsedError;
  String? get skype => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get facebook => throw _privateConstructorUsedError;
  String? get linkedin => throw _privateConstructorUsedError;
  String? get twitter => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalProfileCopyWith<PersonalProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalProfileCopyWith<$Res> {
  factory $PersonalProfileCopyWith(
          PersonalProfile value, $Res Function(PersonalProfile) then) =
      _$PersonalProfileCopyWithImpl<$Res, PersonalProfile>;
  @useResult
  $Res call(
      {int? id,
      String? display,
      String? code,
      String? position,
      String? name,
      @JsonKey(defaultValue: false)
          bool? isTicked,
      @JsonKey(name: 'default_photo')
          String? defaultPhoto,
      @JsonKey(name: 'date_of_birth')
          String? customerDateOfBirth,
      @JsonKey(name: 'gender')
          CustomerGender? customerGender,
      @JsonKey(name: 'nationality')
          CustomerGender? customerNationality,
      String? recommended,
      @JsonKey(name: 'number_share')
          int? numberShare,
      String? expertise,
      @JsonKey(name: 'member_type')
          String? memberType,
      @JsonKey(name: 'year_joined')
          String? yearJoined,
      @JsonKey(name: 'profile_biography')
          String? profileBiography,
      String? about,
      String? other,
      @JsonKey(name: 'identity_type')
          CustomerGender? customerIdentityType,
      @JsonKey(name: 'identity_number')
          String? customerIdentityNumber,
      @JsonKey(name: 'identity_date')
          String? customerIdentityDate,
      @JsonKey(name: 'identity_expired_date')
          String? customerIdentityExpiredDate,
      @JsonKey(name: 'current_address')
          CurrentAddress? currentAddress,
      @JsonKey(name: 'street_no')
          String? streetNo,
      @JsonKey(name: 'house_no')
          String? houseNo,
      @JsonKey(name: 'permanent_address')
          CurrentAddress? permanentAddress,
      @JsonKey(name: 'permanent_street_no')
          String? permanentStreetNo,
      @JsonKey(name: 'permanent_house_no')
          String? permanentHouseNo,
      String? phone,
      String? email,
      String? whatapp,
      String? telegram,
      String? messenger,
      String? skype,
      String? website,
      String? facebook,
      String? linkedin,
      String? twitter,
      @JsonKey(name: 'company_name')
          String? companyName,
      String? title,
      String? location,
      String? profile});
}

/// @nodoc
class _$PersonalProfileCopyWithImpl<$Res, $Val extends PersonalProfile>
    implements $PersonalProfileCopyWith<$Res> {
  _$PersonalProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? display = freezed,
    Object? code = freezed,
    Object? position = freezed,
    Object? name = freezed,
    Object? isTicked = freezed,
    Object? defaultPhoto = freezed,
    Object? customerDateOfBirth = freezed,
    Object? customerGender = freezed,
    Object? customerNationality = freezed,
    Object? recommended = freezed,
    Object? numberShare = freezed,
    Object? expertise = freezed,
    Object? memberType = freezed,
    Object? yearJoined = freezed,
    Object? profileBiography = freezed,
    Object? about = freezed,
    Object? other = freezed,
    Object? customerIdentityType = freezed,
    Object? customerIdentityNumber = freezed,
    Object? customerIdentityDate = freezed,
    Object? customerIdentityExpiredDate = freezed,
    Object? currentAddress = freezed,
    Object? streetNo = freezed,
    Object? houseNo = freezed,
    Object? permanentAddress = freezed,
    Object? permanentStreetNo = freezed,
    Object? permanentHouseNo = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? whatapp = freezed,
    Object? telegram = freezed,
    Object? messenger = freezed,
    Object? skype = freezed,
    Object? website = freezed,
    Object? facebook = freezed,
    Object? linkedin = freezed,
    Object? twitter = freezed,
    Object? companyName = freezed,
    Object? title = freezed,
    Object? location = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isTicked: freezed == isTicked
          ? _value.isTicked
          : isTicked // ignore: cast_nullable_to_non_nullable
              as bool?,
      defaultPhoto: freezed == defaultPhoto
          ? _value.defaultPhoto
          : defaultPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDateOfBirth: freezed == customerDateOfBirth
          ? _value.customerDateOfBirth
          : customerDateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      customerGender: freezed == customerGender
          ? _value.customerGender
          : customerGender // ignore: cast_nullable_to_non_nullable
              as CustomerGender?,
      customerNationality: freezed == customerNationality
          ? _value.customerNationality
          : customerNationality // ignore: cast_nullable_to_non_nullable
              as CustomerGender?,
      recommended: freezed == recommended
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as String?,
      numberShare: freezed == numberShare
          ? _value.numberShare
          : numberShare // ignore: cast_nullable_to_non_nullable
              as int?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as String?,
      memberType: freezed == memberType
          ? _value.memberType
          : memberType // ignore: cast_nullable_to_non_nullable
              as String?,
      yearJoined: freezed == yearJoined
          ? _value.yearJoined
          : yearJoined // ignore: cast_nullable_to_non_nullable
              as String?,
      profileBiography: freezed == profileBiography
          ? _value.profileBiography
          : profileBiography // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdentityType: freezed == customerIdentityType
          ? _value.customerIdentityType
          : customerIdentityType // ignore: cast_nullable_to_non_nullable
              as CustomerGender?,
      customerIdentityNumber: freezed == customerIdentityNumber
          ? _value.customerIdentityNumber
          : customerIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdentityDate: freezed == customerIdentityDate
          ? _value.customerIdentityDate
          : customerIdentityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdentityExpiredDate: freezed == customerIdentityExpiredDate
          ? _value.customerIdentityExpiredDate
          : customerIdentityExpiredDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currentAddress: freezed == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as CurrentAddress?,
      streetNo: freezed == streetNo
          ? _value.streetNo
          : streetNo // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNo: freezed == houseNo
          ? _value.houseNo
          : houseNo // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentAddress: freezed == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as CurrentAddress?,
      permanentStreetNo: freezed == permanentStreetNo
          ? _value.permanentStreetNo
          : permanentStreetNo // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentHouseNo: freezed == permanentHouseNo
          ? _value.permanentHouseNo
          : permanentHouseNo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatapp: freezed == whatapp
          ? _value.whatapp
          : whatapp // ignore: cast_nullable_to_non_nullable
              as String?,
      telegram: freezed == telegram
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String?,
      messenger: freezed == messenger
          ? _value.messenger
          : messenger // ignore: cast_nullable_to_non_nullable
              as String?,
      skype: freezed == skype
          ? _value.skype
          : skype // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: freezed == linkedin
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonalProfileCopyWith<$Res>
    implements $PersonalProfileCopyWith<$Res> {
  factory _$$_PersonalProfileCopyWith(
          _$_PersonalProfile value, $Res Function(_$_PersonalProfile) then) =
      __$$_PersonalProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? display,
      String? code,
      String? position,
      String? name,
      @JsonKey(defaultValue: false)
          bool? isTicked,
      @JsonKey(name: 'default_photo')
          String? defaultPhoto,
      @JsonKey(name: 'date_of_birth')
          String? customerDateOfBirth,
      @JsonKey(name: 'gender')
          CustomerGender? customerGender,
      @JsonKey(name: 'nationality')
          CustomerGender? customerNationality,
      String? recommended,
      @JsonKey(name: 'number_share')
          int? numberShare,
      String? expertise,
      @JsonKey(name: 'member_type')
          String? memberType,
      @JsonKey(name: 'year_joined')
          String? yearJoined,
      @JsonKey(name: 'profile_biography')
          String? profileBiography,
      String? about,
      String? other,
      @JsonKey(name: 'identity_type')
          CustomerGender? customerIdentityType,
      @JsonKey(name: 'identity_number')
          String? customerIdentityNumber,
      @JsonKey(name: 'identity_date')
          String? customerIdentityDate,
      @JsonKey(name: 'identity_expired_date')
          String? customerIdentityExpiredDate,
      @JsonKey(name: 'current_address')
          CurrentAddress? currentAddress,
      @JsonKey(name: 'street_no')
          String? streetNo,
      @JsonKey(name: 'house_no')
          String? houseNo,
      @JsonKey(name: 'permanent_address')
          CurrentAddress? permanentAddress,
      @JsonKey(name: 'permanent_street_no')
          String? permanentStreetNo,
      @JsonKey(name: 'permanent_house_no')
          String? permanentHouseNo,
      String? phone,
      String? email,
      String? whatapp,
      String? telegram,
      String? messenger,
      String? skype,
      String? website,
      String? facebook,
      String? linkedin,
      String? twitter,
      @JsonKey(name: 'company_name')
          String? companyName,
      String? title,
      String? location,
      String? profile});
}

/// @nodoc
class __$$_PersonalProfileCopyWithImpl<$Res>
    extends _$PersonalProfileCopyWithImpl<$Res, _$_PersonalProfile>
    implements _$$_PersonalProfileCopyWith<$Res> {
  __$$_PersonalProfileCopyWithImpl(
      _$_PersonalProfile _value, $Res Function(_$_PersonalProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? display = freezed,
    Object? code = freezed,
    Object? position = freezed,
    Object? name = freezed,
    Object? isTicked = freezed,
    Object? defaultPhoto = freezed,
    Object? customerDateOfBirth = freezed,
    Object? customerGender = freezed,
    Object? customerNationality = freezed,
    Object? recommended = freezed,
    Object? numberShare = freezed,
    Object? expertise = freezed,
    Object? memberType = freezed,
    Object? yearJoined = freezed,
    Object? profileBiography = freezed,
    Object? about = freezed,
    Object? other = freezed,
    Object? customerIdentityType = freezed,
    Object? customerIdentityNumber = freezed,
    Object? customerIdentityDate = freezed,
    Object? customerIdentityExpiredDate = freezed,
    Object? currentAddress = freezed,
    Object? streetNo = freezed,
    Object? houseNo = freezed,
    Object? permanentAddress = freezed,
    Object? permanentStreetNo = freezed,
    Object? permanentHouseNo = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? whatapp = freezed,
    Object? telegram = freezed,
    Object? messenger = freezed,
    Object? skype = freezed,
    Object? website = freezed,
    Object? facebook = freezed,
    Object? linkedin = freezed,
    Object? twitter = freezed,
    Object? companyName = freezed,
    Object? title = freezed,
    Object? location = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$_PersonalProfile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isTicked: freezed == isTicked
          ? _value.isTicked
          : isTicked // ignore: cast_nullable_to_non_nullable
              as bool?,
      defaultPhoto: freezed == defaultPhoto
          ? _value.defaultPhoto
          : defaultPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDateOfBirth: freezed == customerDateOfBirth
          ? _value.customerDateOfBirth
          : customerDateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      customerGender: freezed == customerGender
          ? _value.customerGender
          : customerGender // ignore: cast_nullable_to_non_nullable
              as CustomerGender?,
      customerNationality: freezed == customerNationality
          ? _value.customerNationality
          : customerNationality // ignore: cast_nullable_to_non_nullable
              as CustomerGender?,
      recommended: freezed == recommended
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as String?,
      numberShare: freezed == numberShare
          ? _value.numberShare
          : numberShare // ignore: cast_nullable_to_non_nullable
              as int?,
      expertise: freezed == expertise
          ? _value.expertise
          : expertise // ignore: cast_nullable_to_non_nullable
              as String?,
      memberType: freezed == memberType
          ? _value.memberType
          : memberType // ignore: cast_nullable_to_non_nullable
              as String?,
      yearJoined: freezed == yearJoined
          ? _value.yearJoined
          : yearJoined // ignore: cast_nullable_to_non_nullable
              as String?,
      profileBiography: freezed == profileBiography
          ? _value.profileBiography
          : profileBiography // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdentityType: freezed == customerIdentityType
          ? _value.customerIdentityType
          : customerIdentityType // ignore: cast_nullable_to_non_nullable
              as CustomerGender?,
      customerIdentityNumber: freezed == customerIdentityNumber
          ? _value.customerIdentityNumber
          : customerIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdentityDate: freezed == customerIdentityDate
          ? _value.customerIdentityDate
          : customerIdentityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdentityExpiredDate: freezed == customerIdentityExpiredDate
          ? _value.customerIdentityExpiredDate
          : customerIdentityExpiredDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currentAddress: freezed == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as CurrentAddress?,
      streetNo: freezed == streetNo
          ? _value.streetNo
          : streetNo // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNo: freezed == houseNo
          ? _value.houseNo
          : houseNo // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentAddress: freezed == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as CurrentAddress?,
      permanentStreetNo: freezed == permanentStreetNo
          ? _value.permanentStreetNo
          : permanentStreetNo // ignore: cast_nullable_to_non_nullable
              as String?,
      permanentHouseNo: freezed == permanentHouseNo
          ? _value.permanentHouseNo
          : permanentHouseNo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatapp: freezed == whatapp
          ? _value.whatapp
          : whatapp // ignore: cast_nullable_to_non_nullable
              as String?,
      telegram: freezed == telegram
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String?,
      messenger: freezed == messenger
          ? _value.messenger
          : messenger // ignore: cast_nullable_to_non_nullable
              as String?,
      skype: freezed == skype
          ? _value.skype
          : skype // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: freezed == linkedin
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PersonalProfile implements _PersonalProfile {
  _$_PersonalProfile(
      {this.id,
      this.display,
      this.code,
      this.position,
      this.name,
      @JsonKey(defaultValue: false) this.isTicked,
      @JsonKey(name: 'default_photo') this.defaultPhoto,
      @JsonKey(name: 'date_of_birth') this.customerDateOfBirth,
      @JsonKey(name: 'gender') this.customerGender,
      @JsonKey(name: 'nationality') this.customerNationality,
      this.recommended,
      @JsonKey(name: 'number_share') this.numberShare,
      this.expertise,
      @JsonKey(name: 'member_type') this.memberType,
      @JsonKey(name: 'year_joined') this.yearJoined,
      @JsonKey(name: 'profile_biography') this.profileBiography,
      this.about,
      this.other,
      @JsonKey(name: 'identity_type') this.customerIdentityType,
      @JsonKey(name: 'identity_number') this.customerIdentityNumber,
      @JsonKey(name: 'identity_date') this.customerIdentityDate,
      @JsonKey(name: 'identity_expired_date') this.customerIdentityExpiredDate,
      @JsonKey(name: 'current_address') this.currentAddress,
      @JsonKey(name: 'street_no') this.streetNo,
      @JsonKey(name: 'house_no') this.houseNo,
      @JsonKey(name: 'permanent_address') this.permanentAddress,
      @JsonKey(name: 'permanent_street_no') this.permanentStreetNo,
      @JsonKey(name: 'permanent_house_no') this.permanentHouseNo,
      this.phone,
      this.email,
      this.whatapp,
      this.telegram,
      this.messenger,
      this.skype,
      this.website,
      this.facebook,
      this.linkedin,
      this.twitter,
      @JsonKey(name: 'company_name') this.companyName,
      this.title,
      this.location,
      this.profile});

  factory _$_PersonalProfile.fromJson(Map<String, dynamic> json) =>
      _$$_PersonalProfileFromJson(json);

  @override
  final int? id;
  @override
  final String? display;
  @override
  final String? code;
  @override
  final String? position;
  @override
  final String? name;
  @override
  @JsonKey(defaultValue: false)
  final bool? isTicked;
  @override
  @JsonKey(name: 'default_photo')
  final String? defaultPhoto;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? customerDateOfBirth;
  @override
  @JsonKey(name: 'gender')
  final CustomerGender? customerGender;
  @override
  @JsonKey(name: 'nationality')
  final CustomerGender? customerNationality;
  @override
  final String? recommended;
  @override
  @JsonKey(name: 'number_share')
  final int? numberShare;
  @override
  final String? expertise;
  @override
  @JsonKey(name: 'member_type')
  final String? memberType;
  @override
  @JsonKey(name: 'year_joined')
  final String? yearJoined;
  @override
  @JsonKey(name: 'profile_biography')
  final String? profileBiography;
  @override
  final String? about;
  @override
  final String? other;
  @override
  @JsonKey(name: 'identity_type')
  final CustomerGender? customerIdentityType;
  @override
  @JsonKey(name: 'identity_number')
  final String? customerIdentityNumber;
  @override
  @JsonKey(name: 'identity_date')
  final String? customerIdentityDate;
  @override
  @JsonKey(name: 'identity_expired_date')
  final String? customerIdentityExpiredDate;
  @override
  @JsonKey(name: 'current_address')
  final CurrentAddress? currentAddress;
  @override
  @JsonKey(name: 'street_no')
  final String? streetNo;
  @override
  @JsonKey(name: 'house_no')
  final String? houseNo;
  @override
  @JsonKey(name: 'permanent_address')
  final CurrentAddress? permanentAddress;
  @override
  @JsonKey(name: 'permanent_street_no')
  final String? permanentStreetNo;
  @override
  @JsonKey(name: 'permanent_house_no')
  final String? permanentHouseNo;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? whatapp;
  @override
  final String? telegram;
  @override
  final String? messenger;
  @override
  final String? skype;
  @override
  final String? website;
  @override
  final String? facebook;
  @override
  final String? linkedin;
  @override
  final String? twitter;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  final String? title;
  @override
  final String? location;
  @override
  final String? profile;

  @override
  String toString() {
    return 'PersonalProfile(id: $id, display: $display, code: $code, position: $position, name: $name, isTicked: $isTicked, defaultPhoto: $defaultPhoto, customerDateOfBirth: $customerDateOfBirth, customerGender: $customerGender, customerNationality: $customerNationality, recommended: $recommended, numberShare: $numberShare, expertise: $expertise, memberType: $memberType, yearJoined: $yearJoined, profileBiography: $profileBiography, about: $about, other: $other, customerIdentityType: $customerIdentityType, customerIdentityNumber: $customerIdentityNumber, customerIdentityDate: $customerIdentityDate, customerIdentityExpiredDate: $customerIdentityExpiredDate, currentAddress: $currentAddress, streetNo: $streetNo, houseNo: $houseNo, permanentAddress: $permanentAddress, permanentStreetNo: $permanentStreetNo, permanentHouseNo: $permanentHouseNo, phone: $phone, email: $email, whatapp: $whatapp, telegram: $telegram, messenger: $messenger, skype: $skype, website: $website, facebook: $facebook, linkedin: $linkedin, twitter: $twitter, companyName: $companyName, title: $title, location: $location, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonalProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isTicked, isTicked) ||
                other.isTicked == isTicked) &&
            (identical(other.defaultPhoto, defaultPhoto) ||
                other.defaultPhoto == defaultPhoto) &&
            (identical(other.customerDateOfBirth, customerDateOfBirth) ||
                other.customerDateOfBirth == customerDateOfBirth) &&
            (identical(other.customerGender, customerGender) ||
                other.customerGender == customerGender) &&
            (identical(other.customerNationality, customerNationality) ||
                other.customerNationality == customerNationality) &&
            (identical(other.recommended, recommended) ||
                other.recommended == recommended) &&
            (identical(other.numberShare, numberShare) ||
                other.numberShare == numberShare) &&
            (identical(other.expertise, expertise) ||
                other.expertise == expertise) &&
            (identical(other.memberType, memberType) ||
                other.memberType == memberType) &&
            (identical(other.yearJoined, yearJoined) ||
                other.yearJoined == yearJoined) &&
            (identical(other.profileBiography, profileBiography) ||
                other.profileBiography == profileBiography) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.customerIdentityType, customerIdentityType) ||
                other.customerIdentityType == customerIdentityType) &&
            (identical(other.customerIdentityNumber, customerIdentityNumber) ||
                other.customerIdentityNumber == customerIdentityNumber) &&
            (identical(other.customerIdentityDate, customerIdentityDate) ||
                other.customerIdentityDate == customerIdentityDate) &&
            (identical(other.customerIdentityExpiredDate,
                    customerIdentityExpiredDate) ||
                other.customerIdentityExpiredDate ==
                    customerIdentityExpiredDate) &&
            (identical(other.currentAddress, currentAddress) ||
                other.currentAddress == currentAddress) &&
            (identical(other.streetNo, streetNo) ||
                other.streetNo == streetNo) &&
            (identical(other.houseNo, houseNo) || other.houseNo == houseNo) &&
            (identical(other.permanentAddress, permanentAddress) ||
                other.permanentAddress == permanentAddress) &&
            (identical(other.permanentStreetNo, permanentStreetNo) ||
                other.permanentStreetNo == permanentStreetNo) &&
            (identical(other.permanentHouseNo, permanentHouseNo) ||
                other.permanentHouseNo == permanentHouseNo) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.whatapp, whatapp) || other.whatapp == whatapp) &&
            (identical(other.telegram, telegram) ||
                other.telegram == telegram) &&
            (identical(other.messenger, messenger) ||
                other.messenger == messenger) &&
            (identical(other.skype, skype) || other.skype == skype) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.linkedin, linkedin) ||
                other.linkedin == linkedin) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        display,
        code,
        position,
        name,
        isTicked,
        defaultPhoto,
        customerDateOfBirth,
        customerGender,
        customerNationality,
        recommended,
        numberShare,
        expertise,
        memberType,
        yearJoined,
        profileBiography,
        about,
        other,
        customerIdentityType,
        customerIdentityNumber,
        customerIdentityDate,
        customerIdentityExpiredDate,
        currentAddress,
        streetNo,
        houseNo,
        permanentAddress,
        permanentStreetNo,
        permanentHouseNo,
        phone,
        email,
        whatapp,
        telegram,
        messenger,
        skype,
        website,
        facebook,
        linkedin,
        twitter,
        companyName,
        title,
        location,
        profile
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonalProfileCopyWith<_$_PersonalProfile> get copyWith =>
      __$$_PersonalProfileCopyWithImpl<_$_PersonalProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonalProfileToJson(
      this,
    );
  }
}

abstract class _PersonalProfile implements PersonalProfile {
  factory _PersonalProfile(
      {final int? id,
      final String? display,
      final String? code,
      final String? position,
      final String? name,
      @JsonKey(defaultValue: false)
          final bool? isTicked,
      @JsonKey(name: 'default_photo')
          final String? defaultPhoto,
      @JsonKey(name: 'date_of_birth')
          final String? customerDateOfBirth,
      @JsonKey(name: 'gender')
          final CustomerGender? customerGender,
      @JsonKey(name: 'nationality')
          final CustomerGender? customerNationality,
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
      @JsonKey(name: 'identity_type')
          final CustomerGender? customerIdentityType,
      @JsonKey(name: 'identity_number')
          final String? customerIdentityNumber,
      @JsonKey(name: 'identity_date')
          final String? customerIdentityDate,
      @JsonKey(name: 'identity_expired_date')
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
      final String? profile}) = _$_PersonalProfile;

  factory _PersonalProfile.fromJson(Map<String, dynamic> json) =
      _$_PersonalProfile.fromJson;

  @override
  int? get id;
  @override
  String? get display;
  @override
  String? get code;
  @override
  String? get position;
  @override
  String? get name;
  @override
  @JsonKey(defaultValue: false)
  bool? get isTicked;
  @override
  @JsonKey(name: 'default_photo')
  String? get defaultPhoto;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get customerDateOfBirth;
  @override
  @JsonKey(name: 'gender')
  CustomerGender? get customerGender;
  @override
  @JsonKey(name: 'nationality')
  CustomerGender? get customerNationality;
  @override
  String? get recommended;
  @override
  @JsonKey(name: 'number_share')
  int? get numberShare;
  @override
  String? get expertise;
  @override
  @JsonKey(name: 'member_type')
  String? get memberType;
  @override
  @JsonKey(name: 'year_joined')
  String? get yearJoined;
  @override
  @JsonKey(name: 'profile_biography')
  String? get profileBiography;
  @override
  String? get about;
  @override
  String? get other;
  @override
  @JsonKey(name: 'identity_type')
  CustomerGender? get customerIdentityType;
  @override
  @JsonKey(name: 'identity_number')
  String? get customerIdentityNumber;
  @override
  @JsonKey(name: 'identity_date')
  String? get customerIdentityDate;
  @override
  @JsonKey(name: 'identity_expired_date')
  String? get customerIdentityExpiredDate;
  @override
  @JsonKey(name: 'current_address')
  CurrentAddress? get currentAddress;
  @override
  @JsonKey(name: 'street_no')
  String? get streetNo;
  @override
  @JsonKey(name: 'house_no')
  String? get houseNo;
  @override
  @JsonKey(name: 'permanent_address')
  CurrentAddress? get permanentAddress;
  @override
  @JsonKey(name: 'permanent_street_no')
  String? get permanentStreetNo;
  @override
  @JsonKey(name: 'permanent_house_no')
  String? get permanentHouseNo;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get whatapp;
  @override
  String? get telegram;
  @override
  String? get messenger;
  @override
  String? get skype;
  @override
  String? get website;
  @override
  String? get facebook;
  @override
  String? get linkedin;
  @override
  String? get twitter;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  String? get title;
  @override
  String? get location;
  @override
  String? get profile;
  @override
  @JsonKey(ignore: true)
  _$$_PersonalProfileCopyWith<_$_PersonalProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
