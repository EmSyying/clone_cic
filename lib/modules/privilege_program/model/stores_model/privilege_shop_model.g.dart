// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privilege_shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrivilegeShopModel _$$_PrivilegeShopModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrivilegeShopModel(
      id: json['id'] as num?,
      status: json['status'] as String?,
      isOpen: json['is_open'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      slogan: json['slogan'] as String?,
      discountBgColor: json['discount_bg_color'] as String?,
      discountBgColorEnd: json['discount_bg_color_end'] as String?,
      pointAccepted: json['point_accepted'] as bool?,
      currentPoint: (json['current_point'] as num?)?.toDouble(),
      shopNameInKhmer: json['shop_name_in_khmer'] as String?,
      shopNameInEnglish: json['shop_name_in_english'] as String?,
      fullAddress: json['full_address'] as String?,
      shopLogo: json['shop_logo'] as String?,
      discountRate: json['discount_rate'] as String?,
      legalCompanyName: json['legal_company_name'] as String?,
      businessRegistrationNumber:
          json['business_registration_number'] as String?,
      description: json['description'] as String?,
      productOrService: json['product_or_service'] as String?,
      openingDays: (json['opening_days'] as List<dynamic>?)
          ?.map((e) => OpeningDaysModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactName: json['contact_name'] as String?,
      contactPhone: json['contact_phone'] as String?,
      contactMobile: json['contact_mobile'] as String?,
      contactEmail: json['contact_email'] as String?,
      telegramLink: json['telegram_link'] as String?,
      receiverAccountname: json['receiver_account_name'] as String?,
      receiverAccountnumber: json['receiver_account_number'] as String?,
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      discountPeriod: json['discount_period'] as int?,
      discountCondition: json['discount_condition'] as String?,
      discountStartDate: json['discount_start_date'] as String?,
      discountEndDate: json['discount_end_date'] as String?,
      vatNumber: json['vat_number'] as String?,
      numberShop: json['number_shop'] as num?,
      logo: json['logo'] as String?,
      thumbnail: json['thumbnail'] as String?,
      cover: json['cover'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contacts.fromJson(e as Map<String, dynamic>))
          .toList(),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_PrivilegeShopModelToJson(
        _$_PrivilegeShopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'is_open': instance.isOpen,
      'is_favorite': instance.isFavorite,
      'slogan': instance.slogan,
      'discount_bg_color': instance.discountBgColor,
      'discount_bg_color_end': instance.discountBgColorEnd,
      'point_accepted': instance.pointAccepted,
      'current_point': instance.currentPoint,
      'shop_name_in_khmer': instance.shopNameInKhmer,
      'shop_name_in_english': instance.shopNameInEnglish,
      'full_address': instance.fullAddress,
      'shop_logo': instance.shopLogo,
      'discount_rate': instance.discountRate,
      'legal_company_name': instance.legalCompanyName,
      'business_registration_number': instance.businessRegistrationNumber,
      'description': instance.description,
      'product_or_service': instance.productOrService,
      'opening_days': instance.openingDays,
      'contact_name': instance.contactName,
      'contact_phone': instance.contactPhone,
      'contact_mobile': instance.contactMobile,
      'contact_email': instance.contactEmail,
      'telegram_link': instance.telegramLink,
      'receiver_account_name': instance.receiverAccountname,
      'receiver_account_number': instance.receiverAccountnumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'discount_period': instance.discountPeriod,
      'discount_condition': instance.discountCondition,
      'discount_start_date': instance.discountStartDate,
      'discount_end_date': instance.discountEndDate,
      'vat_number': instance.vatNumber,
      'number_shop': instance.numberShop,
      'logo': instance.logo,
      'thumbnail': instance.thumbnail,
      'cover': instance.cover,
      'contacts': instance.contacts,
      'galleries': instance.galleries,
    };
