// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privilege_shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrivilegeShopModel _$PrivilegeShopModelFromJson(Map<String, dynamic> json) {
  return _PrivilegeShopModel.fromJson(json);
}

/// @nodoc
mixin _$PrivilegeShopModel {
  num? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_open')
  String? get isOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;
  String? get slogan => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_bg_color')
  String? get discountBgColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_bg_color_end')
  String? get discountBgColorEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'point_accepted')
  bool? get pointAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_point')
  double? get currentPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_name_in_khmer')
  String? get shopNameInKhmer => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_name_in_english')
  String? get shopNameInEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address')
  String? get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_logo')
  String? get shopLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_rate')
  String? get discountRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'legal_company_name')
  String? get legalCompanyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_registration_number')
  String? get businessRegistrationNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_or_service')
  String? get productOrService => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_days')
  List<OpeningDaysModel>? get openingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_name')
  String? get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_phone')
  String? get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_mobile')
  String? get contactMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_email')
  String? get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'telegram_link')
  String? get telegramLink => throw _privateConstructorUsedError;
  num? get latitude => throw _privateConstructorUsedError;
  num? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_period')
  int? get discountPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_condition')
  String? get discountCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_start_date')
  String? get discountStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_end_date')
  String? get discountEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_number')
  String? get vatNumber => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  List<Contacts>? get contacts => throw _privateConstructorUsedError;
  List<String>? get galleries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivilegeShopModelCopyWith<PrivilegeShopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilegeShopModelCopyWith<$Res> {
  factory $PrivilegeShopModelCopyWith(
          PrivilegeShopModel value, $Res Function(PrivilegeShopModel) then) =
      _$PrivilegeShopModelCopyWithImpl<$Res, PrivilegeShopModel>;
  @useResult
  $Res call(
      {num? id,
      String? status,
      @JsonKey(name: 'is_open')
          String? isOpen,
      @JsonKey(name: 'is_favorite')
          bool? isFavorite,
      String? slogan,
      @JsonKey(name: 'discount_bg_color')
          String? discountBgColor,
      @JsonKey(name: 'discount_bg_color_end')
          String? discountBgColorEnd,
      @JsonKey(name: 'point_accepted')
          bool? pointAccepted,
      @JsonKey(name: 'current_point')
          double? currentPoint,
      @JsonKey(name: 'shop_name_in_khmer')
          String? shopNameInKhmer,
      @JsonKey(name: 'shop_name_in_english')
          String? shopNameInEnglish,
      @JsonKey(name: 'full_address')
          String? fullAddress,
      @JsonKey(name: 'shop_logo')
          String? shopLogo,
      @JsonKey(name: 'discount_rate')
          String? discountRate,
      @JsonKey(name: 'legal_company_name')
          String? legalCompanyName,
      @JsonKey(name: 'business_registration_number')
          String? businessRegistrationNumber,
      String? description,
      @JsonKey(name: 'product_or_service')
          String? productOrService,
      @JsonKey(name: 'opening_days')
          List<OpeningDaysModel>? openingDays,
      @JsonKey(name: 'contact_name')
          String? contactName,
      @JsonKey(name: 'contact_phone')
          String? contactPhone,
      @JsonKey(name: 'contact_mobile')
          String? contactMobile,
      @JsonKey(name: 'contact_email')
          String? contactEmail,
      @JsonKey(name: 'telegram_link')
          String? telegramLink,
      num? latitude,
      num? longitude,
      @JsonKey(name: 'discount_period')
          int? discountPeriod,
      @JsonKey(name: 'discount_condition')
          String? discountCondition,
      @JsonKey(name: 'discount_start_date')
          String? discountStartDate,
      @JsonKey(name: 'discount_end_date')
          String? discountEndDate,
      @JsonKey(name: 'vat_number')
          String? vatNumber,
      String? logo,
      String? thumbnail,
      String? cover,
      List<Contacts>? contacts,
      List<String>? galleries});
}

/// @nodoc
class _$PrivilegeShopModelCopyWithImpl<$Res, $Val extends PrivilegeShopModel>
    implements $PrivilegeShopModelCopyWith<$Res> {
  _$PrivilegeShopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? isOpen = freezed,
    Object? isFavorite = freezed,
    Object? slogan = freezed,
    Object? discountBgColor = freezed,
    Object? discountBgColorEnd = freezed,
    Object? pointAccepted = freezed,
    Object? currentPoint = freezed,
    Object? shopNameInKhmer = freezed,
    Object? shopNameInEnglish = freezed,
    Object? fullAddress = freezed,
    Object? shopLogo = freezed,
    Object? discountRate = freezed,
    Object? legalCompanyName = freezed,
    Object? businessRegistrationNumber = freezed,
    Object? description = freezed,
    Object? productOrService = freezed,
    Object? openingDays = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactMobile = freezed,
    Object? contactEmail = freezed,
    Object? telegramLink = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? discountPeriod = freezed,
    Object? discountCondition = freezed,
    Object? discountStartDate = freezed,
    Object? discountEndDate = freezed,
    Object? vatNumber = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
    Object? cover = freezed,
    Object? contacts = freezed,
    Object? galleries = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      slogan: freezed == slogan
          ? _value.slogan
          : slogan // ignore: cast_nullable_to_non_nullable
              as String?,
      discountBgColor: freezed == discountBgColor
          ? _value.discountBgColor
          : discountBgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      discountBgColorEnd: freezed == discountBgColorEnd
          ? _value.discountBgColorEnd
          : discountBgColorEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      pointAccepted: freezed == pointAccepted
          ? _value.pointAccepted
          : pointAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentPoint: freezed == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as double?,
      shopNameInKhmer: freezed == shopNameInKhmer
          ? _value.shopNameInKhmer
          : shopNameInKhmer // ignore: cast_nullable_to_non_nullable
              as String?,
      shopNameInEnglish: freezed == shopNameInEnglish
          ? _value.shopNameInEnglish
          : shopNameInEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shopLogo: freezed == shopLogo
          ? _value.shopLogo
          : shopLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as String?,
      legalCompanyName: freezed == legalCompanyName
          ? _value.legalCompanyName
          : legalCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessRegistrationNumber: freezed == businessRegistrationNumber
          ? _value.businessRegistrationNumber
          : businessRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      productOrService: freezed == productOrService
          ? _value.productOrService
          : productOrService // ignore: cast_nullable_to_non_nullable
              as String?,
      openingDays: freezed == openingDays
          ? _value.openingDays
          : openingDays // ignore: cast_nullable_to_non_nullable
              as List<OpeningDaysModel>?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactMobile: freezed == contactMobile
          ? _value.contactMobile
          : contactMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramLink: freezed == telegramLink
          ? _value.telegramLink
          : telegramLink // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      discountPeriod: freezed == discountPeriod
          ? _value.discountPeriod
          : discountPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      discountCondition: freezed == discountCondition
          ? _value.discountCondition
          : discountCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      discountStartDate: freezed == discountStartDate
          ? _value.discountStartDate
          : discountStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      discountEndDate: freezed == discountEndDate
          ? _value.discountEndDate
          : discountEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vatNumber: freezed == vatNumber
          ? _value.vatNumber
          : vatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contacts>?,
      galleries: freezed == galleries
          ? _value.galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrivilegeShopModelCopyWith<$Res>
    implements $PrivilegeShopModelCopyWith<$Res> {
  factory _$$_PrivilegeShopModelCopyWith(_$_PrivilegeShopModel value,
          $Res Function(_$_PrivilegeShopModel) then) =
      __$$_PrivilegeShopModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      String? status,
      @JsonKey(name: 'is_open')
          String? isOpen,
      @JsonKey(name: 'is_favorite')
          bool? isFavorite,
      String? slogan,
      @JsonKey(name: 'discount_bg_color')
          String? discountBgColor,
      @JsonKey(name: 'discount_bg_color_end')
          String? discountBgColorEnd,
      @JsonKey(name: 'point_accepted')
          bool? pointAccepted,
      @JsonKey(name: 'current_point')
          double? currentPoint,
      @JsonKey(name: 'shop_name_in_khmer')
          String? shopNameInKhmer,
      @JsonKey(name: 'shop_name_in_english')
          String? shopNameInEnglish,
      @JsonKey(name: 'full_address')
          String? fullAddress,
      @JsonKey(name: 'shop_logo')
          String? shopLogo,
      @JsonKey(name: 'discount_rate')
          String? discountRate,
      @JsonKey(name: 'legal_company_name')
          String? legalCompanyName,
      @JsonKey(name: 'business_registration_number')
          String? businessRegistrationNumber,
      String? description,
      @JsonKey(name: 'product_or_service')
          String? productOrService,
      @JsonKey(name: 'opening_days')
          List<OpeningDaysModel>? openingDays,
      @JsonKey(name: 'contact_name')
          String? contactName,
      @JsonKey(name: 'contact_phone')
          String? contactPhone,
      @JsonKey(name: 'contact_mobile')
          String? contactMobile,
      @JsonKey(name: 'contact_email')
          String? contactEmail,
      @JsonKey(name: 'telegram_link')
          String? telegramLink,
      num? latitude,
      num? longitude,
      @JsonKey(name: 'discount_period')
          int? discountPeriod,
      @JsonKey(name: 'discount_condition')
          String? discountCondition,
      @JsonKey(name: 'discount_start_date')
          String? discountStartDate,
      @JsonKey(name: 'discount_end_date')
          String? discountEndDate,
      @JsonKey(name: 'vat_number')
          String? vatNumber,
      String? logo,
      String? thumbnail,
      String? cover,
      List<Contacts>? contacts,
      List<String>? galleries});
}

/// @nodoc
class __$$_PrivilegeShopModelCopyWithImpl<$Res>
    extends _$PrivilegeShopModelCopyWithImpl<$Res, _$_PrivilegeShopModel>
    implements _$$_PrivilegeShopModelCopyWith<$Res> {
  __$$_PrivilegeShopModelCopyWithImpl(
      _$_PrivilegeShopModel _value, $Res Function(_$_PrivilegeShopModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? isOpen = freezed,
    Object? isFavorite = freezed,
    Object? slogan = freezed,
    Object? discountBgColor = freezed,
    Object? discountBgColorEnd = freezed,
    Object? pointAccepted = freezed,
    Object? currentPoint = freezed,
    Object? shopNameInKhmer = freezed,
    Object? shopNameInEnglish = freezed,
    Object? fullAddress = freezed,
    Object? shopLogo = freezed,
    Object? discountRate = freezed,
    Object? legalCompanyName = freezed,
    Object? businessRegistrationNumber = freezed,
    Object? description = freezed,
    Object? productOrService = freezed,
    Object? openingDays = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactMobile = freezed,
    Object? contactEmail = freezed,
    Object? telegramLink = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? discountPeriod = freezed,
    Object? discountCondition = freezed,
    Object? discountStartDate = freezed,
    Object? discountEndDate = freezed,
    Object? vatNumber = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
    Object? cover = freezed,
    Object? contacts = freezed,
    Object? galleries = freezed,
  }) {
    return _then(_$_PrivilegeShopModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      slogan: freezed == slogan
          ? _value.slogan
          : slogan // ignore: cast_nullable_to_non_nullable
              as String?,
      discountBgColor: freezed == discountBgColor
          ? _value.discountBgColor
          : discountBgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      discountBgColorEnd: freezed == discountBgColorEnd
          ? _value.discountBgColorEnd
          : discountBgColorEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      pointAccepted: freezed == pointAccepted
          ? _value.pointAccepted
          : pointAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentPoint: freezed == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as double?,
      shopNameInKhmer: freezed == shopNameInKhmer
          ? _value.shopNameInKhmer
          : shopNameInKhmer // ignore: cast_nullable_to_non_nullable
              as String?,
      shopNameInEnglish: freezed == shopNameInEnglish
          ? _value.shopNameInEnglish
          : shopNameInEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shopLogo: freezed == shopLogo
          ? _value.shopLogo
          : shopLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as String?,
      legalCompanyName: freezed == legalCompanyName
          ? _value.legalCompanyName
          : legalCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessRegistrationNumber: freezed == businessRegistrationNumber
          ? _value.businessRegistrationNumber
          : businessRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      productOrService: freezed == productOrService
          ? _value.productOrService
          : productOrService // ignore: cast_nullable_to_non_nullable
              as String?,
      openingDays: freezed == openingDays
          ? _value._openingDays
          : openingDays // ignore: cast_nullable_to_non_nullable
              as List<OpeningDaysModel>?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactMobile: freezed == contactMobile
          ? _value.contactMobile
          : contactMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramLink: freezed == telegramLink
          ? _value.telegramLink
          : telegramLink // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      discountPeriod: freezed == discountPeriod
          ? _value.discountPeriod
          : discountPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      discountCondition: freezed == discountCondition
          ? _value.discountCondition
          : discountCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      discountStartDate: freezed == discountStartDate
          ? _value.discountStartDate
          : discountStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      discountEndDate: freezed == discountEndDate
          ? _value.discountEndDate
          : discountEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vatNumber: freezed == vatNumber
          ? _value.vatNumber
          : vatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contacts>?,
      galleries: freezed == galleries
          ? _value._galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrivilegeShopModel implements _PrivilegeShopModel {
  _$_PrivilegeShopModel(
      {this.id,
      this.status,
      @JsonKey(name: 'is_open')
          this.isOpen,
      @JsonKey(name: 'is_favorite')
          this.isFavorite,
      this.slogan,
      @JsonKey(name: 'discount_bg_color')
          this.discountBgColor,
      @JsonKey(name: 'discount_bg_color_end')
          this.discountBgColorEnd,
      @JsonKey(name: 'point_accepted')
          this.pointAccepted,
      @JsonKey(name: 'current_point')
          this.currentPoint,
      @JsonKey(name: 'shop_name_in_khmer')
          this.shopNameInKhmer,
      @JsonKey(name: 'shop_name_in_english')
          this.shopNameInEnglish,
      @JsonKey(name: 'full_address')
          this.fullAddress,
      @JsonKey(name: 'shop_logo')
          this.shopLogo,
      @JsonKey(name: 'discount_rate')
          this.discountRate,
      @JsonKey(name: 'legal_company_name')
          this.legalCompanyName,
      @JsonKey(name: 'business_registration_number')
          this.businessRegistrationNumber,
      this.description,
      @JsonKey(name: 'product_or_service')
          this.productOrService,
      @JsonKey(name: 'opening_days')
          final List<OpeningDaysModel>? openingDays,
      @JsonKey(name: 'contact_name')
          this.contactName,
      @JsonKey(name: 'contact_phone')
          this.contactPhone,
      @JsonKey(name: 'contact_mobile')
          this.contactMobile,
      @JsonKey(name: 'contact_email')
          this.contactEmail,
      @JsonKey(name: 'telegram_link')
          this.telegramLink,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'discount_period')
          this.discountPeriod,
      @JsonKey(name: 'discount_condition')
          this.discountCondition,
      @JsonKey(name: 'discount_start_date')
          this.discountStartDate,
      @JsonKey(name: 'discount_end_date')
          this.discountEndDate,
      @JsonKey(name: 'vat_number')
          this.vatNumber,
      this.logo,
      this.thumbnail,
      this.cover,
      final List<Contacts>? contacts,
      final List<String>? galleries})
      : _openingDays = openingDays,
        _contacts = contacts,
        _galleries = galleries;

  factory _$_PrivilegeShopModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrivilegeShopModelFromJson(json);

  @override
  final num? id;
  @override
  final String? status;
  @override
  @JsonKey(name: 'is_open')
  final String? isOpen;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @override
  final String? slogan;
  @override
  @JsonKey(name: 'discount_bg_color')
  final String? discountBgColor;
  @override
  @JsonKey(name: 'discount_bg_color_end')
  final String? discountBgColorEnd;
  @override
  @JsonKey(name: 'point_accepted')
  final bool? pointAccepted;
  @override
  @JsonKey(name: 'current_point')
  final double? currentPoint;
  @override
  @JsonKey(name: 'shop_name_in_khmer')
  final String? shopNameInKhmer;
  @override
  @JsonKey(name: 'shop_name_in_english')
  final String? shopNameInEnglish;
  @override
  @JsonKey(name: 'full_address')
  final String? fullAddress;
  @override
  @JsonKey(name: 'shop_logo')
  final String? shopLogo;
  @override
  @JsonKey(name: 'discount_rate')
  final String? discountRate;
  @override
  @JsonKey(name: 'legal_company_name')
  final String? legalCompanyName;
  @override
  @JsonKey(name: 'business_registration_number')
  final String? businessRegistrationNumber;
  @override
  final String? description;
  @override
  @JsonKey(name: 'product_or_service')
  final String? productOrService;
  final List<OpeningDaysModel>? _openingDays;
  @override
  @JsonKey(name: 'opening_days')
  List<OpeningDaysModel>? get openingDays {
    final value = _openingDays;
    if (value == null) return null;
    if (_openingDays is EqualUnmodifiableListView) return _openingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'contact_name')
  final String? contactName;
  @override
  @JsonKey(name: 'contact_phone')
  final String? contactPhone;
  @override
  @JsonKey(name: 'contact_mobile')
  final String? contactMobile;
  @override
  @JsonKey(name: 'contact_email')
  final String? contactEmail;
  @override
  @JsonKey(name: 'telegram_link')
  final String? telegramLink;
  @override
  final num? latitude;
  @override
  final num? longitude;
  @override
  @JsonKey(name: 'discount_period')
  final int? discountPeriod;
  @override
  @JsonKey(name: 'discount_condition')
  final String? discountCondition;
  @override
  @JsonKey(name: 'discount_start_date')
  final String? discountStartDate;
  @override
  @JsonKey(name: 'discount_end_date')
  final String? discountEndDate;
  @override
  @JsonKey(name: 'vat_number')
  final String? vatNumber;
  @override
  final String? logo;
  @override
  final String? thumbnail;
  @override
  final String? cover;
  final List<Contacts>? _contacts;
  @override
  List<Contacts>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _galleries;
  @override
  List<String>? get galleries {
    final value = _galleries;
    if (value == null) return null;
    if (_galleries is EqualUnmodifiableListView) return _galleries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PrivilegeShopModel(id: $id, status: $status, isOpen: $isOpen, isFavorite: $isFavorite, slogan: $slogan, discountBgColor: $discountBgColor, discountBgColorEnd: $discountBgColorEnd, pointAccepted: $pointAccepted, currentPoint: $currentPoint, shopNameInKhmer: $shopNameInKhmer, shopNameInEnglish: $shopNameInEnglish, fullAddress: $fullAddress, shopLogo: $shopLogo, discountRate: $discountRate, legalCompanyName: $legalCompanyName, businessRegistrationNumber: $businessRegistrationNumber, description: $description, productOrService: $productOrService, openingDays: $openingDays, contactName: $contactName, contactPhone: $contactPhone, contactMobile: $contactMobile, contactEmail: $contactEmail, telegramLink: $telegramLink, latitude: $latitude, longitude: $longitude, discountPeriod: $discountPeriod, discountCondition: $discountCondition, discountStartDate: $discountStartDate, discountEndDate: $discountEndDate, vatNumber: $vatNumber, logo: $logo, thumbnail: $thumbnail, cover: $cover, contacts: $contacts, galleries: $galleries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivilegeShopModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.slogan, slogan) || other.slogan == slogan) &&
            (identical(other.discountBgColor, discountBgColor) ||
                other.discountBgColor == discountBgColor) &&
            (identical(other.discountBgColorEnd, discountBgColorEnd) ||
                other.discountBgColorEnd == discountBgColorEnd) &&
            (identical(other.pointAccepted, pointAccepted) ||
                other.pointAccepted == pointAccepted) &&
            (identical(other.currentPoint, currentPoint) ||
                other.currentPoint == currentPoint) &&
            (identical(other.shopNameInKhmer, shopNameInKhmer) ||
                other.shopNameInKhmer == shopNameInKhmer) &&
            (identical(other.shopNameInEnglish, shopNameInEnglish) ||
                other.shopNameInEnglish == shopNameInEnglish) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.shopLogo, shopLogo) ||
                other.shopLogo == shopLogo) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate) &&
            (identical(other.legalCompanyName, legalCompanyName) ||
                other.legalCompanyName == legalCompanyName) &&
            (identical(other.businessRegistrationNumber,
                    businessRegistrationNumber) ||
                other.businessRegistrationNumber ==
                    businessRegistrationNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.productOrService, productOrService) ||
                other.productOrService == productOrService) &&
            const DeepCollectionEquality()
                .equals(other._openingDays, _openingDays) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactMobile, contactMobile) ||
                other.contactMobile == contactMobile) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.telegramLink, telegramLink) ||
                other.telegramLink == telegramLink) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.discountPeriod, discountPeriod) ||
                other.discountPeriod == discountPeriod) &&
            (identical(other.discountCondition, discountCondition) ||
                other.discountCondition == discountCondition) &&
            (identical(other.discountStartDate, discountStartDate) ||
                other.discountStartDate == discountStartDate) &&
            (identical(other.discountEndDate, discountEndDate) ||
                other.discountEndDate == discountEndDate) &&
            (identical(other.vatNumber, vatNumber) ||
                other.vatNumber == vatNumber) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            const DeepCollectionEquality()
                .equals(other._galleries, _galleries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        status,
        isOpen,
        isFavorite,
        slogan,
        discountBgColor,
        discountBgColorEnd,
        pointAccepted,
        currentPoint,
        shopNameInKhmer,
        shopNameInEnglish,
        fullAddress,
        shopLogo,
        discountRate,
        legalCompanyName,
        businessRegistrationNumber,
        description,
        productOrService,
        const DeepCollectionEquality().hash(_openingDays),
        contactName,
        contactPhone,
        contactMobile,
        contactEmail,
        telegramLink,
        latitude,
        longitude,
        discountPeriod,
        discountCondition,
        discountStartDate,
        discountEndDate,
        vatNumber,
        logo,
        thumbnail,
        cover,
        const DeepCollectionEquality().hash(_contacts),
        const DeepCollectionEquality().hash(_galleries)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivilegeShopModelCopyWith<_$_PrivilegeShopModel> get copyWith =>
      __$$_PrivilegeShopModelCopyWithImpl<_$_PrivilegeShopModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivilegeShopModelToJson(
      this,
    );
  }
}

abstract class _PrivilegeShopModel implements PrivilegeShopModel {
  factory _PrivilegeShopModel(
      {final num? id,
      final String? status,
      @JsonKey(name: 'is_open')
          final String? isOpen,
      @JsonKey(name: 'is_favorite')
          final bool? isFavorite,
      final String? slogan,
      @JsonKey(name: 'discount_bg_color')
          final String? discountBgColor,
      @JsonKey(name: 'discount_bg_color_end')
          final String? discountBgColorEnd,
      @JsonKey(name: 'point_accepted')
          final bool? pointAccepted,
      @JsonKey(name: 'current_point')
          final double? currentPoint,
      @JsonKey(name: 'shop_name_in_khmer')
          final String? shopNameInKhmer,
      @JsonKey(name: 'shop_name_in_english')
          final String? shopNameInEnglish,
      @JsonKey(name: 'full_address')
          final String? fullAddress,
      @JsonKey(name: 'shop_logo')
          final String? shopLogo,
      @JsonKey(name: 'discount_rate')
          final String? discountRate,
      @JsonKey(name: 'legal_company_name')
          final String? legalCompanyName,
      @JsonKey(name: 'business_registration_number')
          final String? businessRegistrationNumber,
      final String? description,
      @JsonKey(name: 'product_or_service')
          final String? productOrService,
      @JsonKey(name: 'opening_days')
          final List<OpeningDaysModel>? openingDays,
      @JsonKey(name: 'contact_name')
          final String? contactName,
      @JsonKey(name: 'contact_phone')
          final String? contactPhone,
      @JsonKey(name: 'contact_mobile')
          final String? contactMobile,
      @JsonKey(name: 'contact_email')
          final String? contactEmail,
      @JsonKey(name: 'telegram_link')
          final String? telegramLink,
      final num? latitude,
      final num? longitude,
      @JsonKey(name: 'discount_period')
          final int? discountPeriod,
      @JsonKey(name: 'discount_condition')
          final String? discountCondition,
      @JsonKey(name: 'discount_start_date')
          final String? discountStartDate,
      @JsonKey(name: 'discount_end_date')
          final String? discountEndDate,
      @JsonKey(name: 'vat_number')
          final String? vatNumber,
      final String? logo,
      final String? thumbnail,
      final String? cover,
      final List<Contacts>? contacts,
      final List<String>? galleries}) = _$_PrivilegeShopModel;

  factory _PrivilegeShopModel.fromJson(Map<String, dynamic> json) =
      _$_PrivilegeShopModel.fromJson;

  @override
  num? get id;
  @override
  String? get status;
  @override
  @JsonKey(name: 'is_open')
  String? get isOpen;
  @override
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  String? get slogan;
  @override
  @JsonKey(name: 'discount_bg_color')
  String? get discountBgColor;
  @override
  @JsonKey(name: 'discount_bg_color_end')
  String? get discountBgColorEnd;
  @override
  @JsonKey(name: 'point_accepted')
  bool? get pointAccepted;
  @override
  @JsonKey(name: 'current_point')
  double? get currentPoint;
  @override
  @JsonKey(name: 'shop_name_in_khmer')
  String? get shopNameInKhmer;
  @override
  @JsonKey(name: 'shop_name_in_english')
  String? get shopNameInEnglish;
  @override
  @JsonKey(name: 'full_address')
  String? get fullAddress;
  @override
  @JsonKey(name: 'shop_logo')
  String? get shopLogo;
  @override
  @JsonKey(name: 'discount_rate')
  String? get discountRate;
  @override
  @JsonKey(name: 'legal_company_name')
  String? get legalCompanyName;
  @override
  @JsonKey(name: 'business_registration_number')
  String? get businessRegistrationNumber;
  @override
  String? get description;
  @override
  @JsonKey(name: 'product_or_service')
  String? get productOrService;
  @override
  @JsonKey(name: 'opening_days')
  List<OpeningDaysModel>? get openingDays;
  @override
  @JsonKey(name: 'contact_name')
  String? get contactName;
  @override
  @JsonKey(name: 'contact_phone')
  String? get contactPhone;
  @override
  @JsonKey(name: 'contact_mobile')
  String? get contactMobile;
  @override
  @JsonKey(name: 'contact_email')
  String? get contactEmail;
  @override
  @JsonKey(name: 'telegram_link')
  String? get telegramLink;
  @override
  num? get latitude;
  @override
  num? get longitude;
  @override
  @JsonKey(name: 'discount_period')
  int? get discountPeriod;
  @override
  @JsonKey(name: 'discount_condition')
  String? get discountCondition;
  @override
  @JsonKey(name: 'discount_start_date')
  String? get discountStartDate;
  @override
  @JsonKey(name: 'discount_end_date')
  String? get discountEndDate;
  @override
  @JsonKey(name: 'vat_number')
  String? get vatNumber;
  @override
  String? get logo;
  @override
  String? get thumbnail;
  @override
  String? get cover;
  @override
  List<Contacts>? get contacts;
  @override
  List<String>? get galleries;
  @override
  @JsonKey(ignore: true)
  _$$_PrivilegeShopModelCopyWith<_$_PrivilegeShopModel> get copyWith =>
      throw _privateConstructorUsedError;
}
