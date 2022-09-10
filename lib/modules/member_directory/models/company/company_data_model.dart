import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';
import 'package:cicgreenloan/modules/member_directory/models/company_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_data_model.freezed.dart';
part 'company_data_model.g.dart';

@freezed
class CompanyDataModel with _$CompanyDataModel {
  factory CompanyDataModel({
    final int? id,
    @JsonKey(name: 'member_id') final int? memberId,
    @JsonKey(name: 'company_name') final String? companyName,
    @JsonKey(name: 'khmer_name') final String? khmerName,
    @JsonKey(name: 'major_of_business') final FinancialPurpose? majorOfBusiness,
    final String? position,
    @JsonKey(name: 'legal_status') final FinancialPurpose? legalStatus,
    @JsonKey(name: 'registered_business')
        final FinancialPurpose? registeredBusiness,
    @JsonKey(name: 'company_size') final int? companySize,
    @JsonKey(name: 'number_of_branches') final int? numberOfBranches,
    @JsonKey(name: 'business_model') final FinancialPurpose? businessModel,
    @JsonKey(name: 'capital_investment') final String? capitalInvestment,
    @JsonKey(name: 'year_founded') final String? yearFounded,
    @JsonKey(name: 'is_primary') final int? isPrimary,
    @JsonKey(name: 'company_diagnostic_report')
        final String? companyDiagnosticReport,
    @JsonKey(name: 'company_milestones') final String? companyMilestones,
    @JsonKey(name: 'company_logo') final String? companyLogo,
    @JsonKey(name: 'personal_interest') final String? personalInterest,
    @JsonKey(name: 'company_profile') final String? companyProfile,
    @JsonKey(name: 'company_product_and_service')
        final String? companyProductAndService,
    @JsonKey(name: 'house_no') final String? houseNo,
    @JsonKey(name: 'street_no') final String? streetNo,
    final String? address,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    final String? email,
    @JsonKey(name: 'what_app') final String? whatApp,
    final String? telegram,
    final String? messenger,
    final String? skype,
    @JsonKey(name: 'we_chat') final String? weChat,
    final String? website,
    final String? facebook,
    final String? linkedin,
    final String? twitter,
    @JsonKey(name: 'company_slogan') final String? companySlogan,
    @JsonKey(name: 'company_activity_images', defaultValue: [])
        final List<String>? companyActivityImages,
    @JsonKey(name: 'type_of_organization')
        final FinancialPurpose? typeOfOrganization,
    final FinancialPurpose? industry,
    @JsonKey(name: 'tax_identification_number')
        final String? taxIdentificationNumber,
    @JsonKey(name: 'number_of_staff') final int? numberOfStaff,
    @JsonKey(name: 'owner_name') final String? ownerName,
    @JsonKey(name: 'company_files') final CompanyFiles? companyFiles,
  }) = _CompanyDataModel;

  factory CompanyDataModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataModelFromJson(json);
}
