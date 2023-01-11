import 'package:cicgreenloan/modules/privilege_program/model/stores_model/contact_model.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/opening_days_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privilege_shop_model.freezed.dart';
part 'privilege_shop_model.g.dart';

@freezed
class PrivilegeShopModel with _$PrivilegeShopModel {
  factory PrivilegeShopModel({
    num? id,
    String? status,
    @JsonKey(name: 'is_open') String? isOpen,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    String? slogan,
    @JsonKey(name: 'discount_bg_color') String? discountBgColor,
    @JsonKey(name: 'discount_bg_color_end') String? discountBgColorEnd,
    @JsonKey(name: 'point_accepted') bool? pointAccepted,
    @JsonKey(name: 'current_point') double? currentPoint,
    @JsonKey(name: 'shop_name_in_khmer') String? shopNameInKhmer,
    @JsonKey(name: 'shop_name_in_english') String? shopNameInEnglish,
    @JsonKey(name: 'full_address') String? fullAddress,
    @JsonKey(name: 'shop_logo') String? shopLogo,
    @JsonKey(name: 'discount_rate') String? discountRate,
    @JsonKey(name: 'legal_company_name') String? legalCompanyName,
    @JsonKey(name: 'business_registration_number')
        String? businessRegistrationNumber,
    String? description,
    @JsonKey(name: 'product_or_service') String? productOrService,
    @JsonKey(name: 'opening_days') List<OpeningDaysModel>? openingDays,
    @JsonKey(name: 'contact_name') String? contactName,
    @JsonKey(name: 'contact_phone') String? contactPhone,
    @JsonKey(name: 'contact_mobile') String? contactMobile,
    @JsonKey(name: 'contact_email') String? contactEmail,
    @JsonKey(name: 'telegram_link') String? telegramLink,
    @JsonKey(name: 'receiver_account_name') String? receiverAccountname,
    @JsonKey(name: 'receiver_account_number') String? receiverAccountnumber,
    num? latitude,
    num? longitude,
    @JsonKey(name: 'discount_period') int? discountPeriod,
    @JsonKey(name: 'discount_condition') String? discountCondition,
    @JsonKey(name: 'discount_start_date') String? discountStartDate,
    @JsonKey(name: 'discount_end_date') String? discountEndDate,
    @JsonKey(name: 'vat_number') String? vatNumber,
    String? logo,
    String? thumbnail,
    String? cover,
    List<Contacts>? contacts,
    List<String>? galleries,
  }) = _PrivilegeShopModel;

  factory PrivilegeShopModel.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeShopModelFromJson(json);
}
