// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyDataModel _$$_CompanyDataModelFromJson(Map<String, dynamic> json) =>
    _$_CompanyDataModel(
      id: json['id'] as int?,
      memberId: json['member_id'] as int?,
      companyName: json['company_name'] as String?,
      khmerName: json['khmer_name'] as String?,
      majorOfBusiness: json['major_of_business'] == null
          ? null
          : FinancialPurpose.fromJson(
              json['major_of_business'] as Map<String, dynamic>),
      position: json['position'] as String?,
      legalStatus: json['legal_status'] == null
          ? null
          : FinancialPurpose.fromJson(
              json['legal_status'] as Map<String, dynamic>),
      registeredBusiness: json['registered_business'] == null
          ? null
          : FinancialPurpose.fromJson(
              json['registered_business'] as Map<String, dynamic>),
      companySize: json['company_size'] as int?,
      numberOfBranches: json['number_of_branches'] as int?,
      businessModel: json['business_model'] == null
          ? null
          : FinancialPurpose.fromJson(
              json['business_model'] as Map<String, dynamic>),
      capitalInvestment: json['capital_investment'] as String?,
      yearFounded: json['year_founded'] as String?,
      isPrimary: json['is_primary'] as int?,
      companyDiagnosticReport: json['company_diagnostic_report'] as String?,
      companyMilestones: json['company_milestones'] as String?,
      companyLogo: json['company_logo'] as String?,
      personalInterest: json['personal_interest'] as String?,
      companyProfile: json['company_profile'] as String?,
      companyProductAndService: json['company_product_and_service'] as String?,
      houseNo: json['house_no'] as String?,
      streetNo: json['street_no'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      whatApp: json['what_app'] as String?,
      telegram: json['telegram'] as String?,
      messenger: json['messenger'] as String?,
      skype: json['skype'] as String?,
      weChat: json['we_chat'] as String?,
      website: json['website'] as String?,
      facebook: json['facebook'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
      companySlogan: json['company_slogan'] as String?,
      companyActivityImages: (json['company_activity_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      typeOfOrganization: json['type_of_organization'] == null
          ? null
          : FinancialPurpose.fromJson(
              json['type_of_organization'] as Map<String, dynamic>),
      industry: json['industry'] == null
          ? null
          : FinancialPurpose.fromJson(json['industry'] as Map<String, dynamic>),
      taxIdentificationNumber: json['tax_identification_number'] as String?,
      numberOfStaff: json['number_of_staff'] as int?,
      ownerName: json['owner_name'] as String?,
      companyFiles: json['company_files'] == null
          ? null
          : CompanyFiles.fromJson(
              json['company_files'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CompanyDataModelToJson(_$_CompanyDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_id': instance.memberId,
      'company_name': instance.companyName,
      'khmer_name': instance.khmerName,
      'major_of_business': instance.majorOfBusiness,
      'position': instance.position,
      'legal_status': instance.legalStatus,
      'registered_business': instance.registeredBusiness,
      'company_size': instance.companySize,
      'number_of_branches': instance.numberOfBranches,
      'business_model': instance.businessModel,
      'capital_investment': instance.capitalInvestment,
      'year_founded': instance.yearFounded,
      'is_primary': instance.isPrimary,
      'company_diagnostic_report': instance.companyDiagnosticReport,
      'company_milestones': instance.companyMilestones,
      'company_logo': instance.companyLogo,
      'personal_interest': instance.personalInterest,
      'company_profile': instance.companyProfile,
      'company_product_and_service': instance.companyProductAndService,
      'house_no': instance.houseNo,
      'street_no': instance.streetNo,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'what_app': instance.whatApp,
      'telegram': instance.telegram,
      'messenger': instance.messenger,
      'skype': instance.skype,
      'we_chat': instance.weChat,
      'website': instance.website,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'company_slogan': instance.companySlogan,
      'company_activity_images': instance.companyActivityImages,
      'type_of_organization': instance.typeOfOrganization,
      'industry': instance.industry,
      'tax_identification_number': instance.taxIdentificationNumber,
      'number_of_staff': instance.numberOfStaff,
      'owner_name': instance.ownerName,
      'company_files': instance.companyFiles,
    };
