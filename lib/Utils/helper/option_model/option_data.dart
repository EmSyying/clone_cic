import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';

class OptionData {
  List<Optionmodel>? degree;
  List<Optionmodel>? branchs;
  List<Optionmodel>? gender;
  List<Optionmodel>? purpose;
  List<Optionmodel>? industry;
  List<Optionmodel>? currency;
  List<Optionmodel>? position;
  List<Optionmodel>? assetType;
  List<Optionmodel>? shiftWorks;
  List<Optionmodel>? memberType;
  List<Optionmodel>? nationality;
  List<Optionmodel>? legalStatus;
  List<Optionmodel>? relationship;
  List<Optionmodel>? organization;
  List<Optionmodel>? identityType;
  List<Optionmodel>? maritalStatus;
  List<Optionmodel>? directoryFilter;
  List<Optionmodel>? permanentJobs;
  List<Optionmodel>? documentTypes;
  List<Optionmodel>? fieldOfStudy;
  List<Optionmodel>? businessModel;
  List<Optionmodel>? typeOfVihicle;
  List<Optionmodel>? houseOwnership;
  List<Optionmodel>? typeOfContracts;
  List<Optionmodel>? transactionTypes;
  List<Optionmodel>? majorOfBusiness;
  List<Optionmodel>? jobWithContracts;
  List<Optionmodel>? documentCategories;
  List<Optionmodel>? registeredBusiness;
  List<Optionmodel>? typeBusinessActivities;
  List<Optionmodel>? tradingSpecificMemberReasons;
  List<Optionmodel>? riaseuseoffund;

  OptionData(
      {this.degree,
      this.riaseuseoffund,
      this.branchs,
      this.gender,
      this.purpose,
      this.industry,
      this.currency,
      this.position,
      this.assetType,
      this.shiftWorks,
      this.memberType,
      this.nationality,
      this.legalStatus,
      this.relationship,
      this.organization,
      this.identityType,
      this.maritalStatus,
      this.directoryFilter,
      this.permanentJobs,
      this.documentTypes,
      this.fieldOfStudy,
      this.businessModel,
      this.typeOfVihicle,
      this.houseOwnership,
      this.typeOfContracts,
      this.transactionTypes,
      this.majorOfBusiness,
      this.jobWithContracts,
      this.documentCategories,
      this.registeredBusiness,
      this.typeBusinessActivities,
      this.tradingSpecificMemberReasons});

  OptionData.fromJson(Map<String, dynamic> json) {
    if (json['degree'] != null) {
      degree = <Optionmodel>[];
      json['degree'].forEach((v) {
        degree!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['raise_fund_use_for'] != null) {
      riaseuseoffund = <Optionmodel>[];
      json['raise_fund_use_for'].forEach((v) {
        riaseuseoffund!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['branchs'] != null) {
      branchs = <Optionmodel>[];
      json['branchs'].forEach((v) {
        branchs!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['gender'] != null) {
      gender = <Optionmodel>[];
      json['gender'].forEach((v) {
        gender!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['purpose'] != null) {
      purpose = <Optionmodel>[];
      json['purpose'].forEach((v) {
        purpose!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['industry'] != null) {
      industry = <Optionmodel>[];
      json['industry'].forEach((v) {
        industry!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['currency'] != null) {
      currency = <Optionmodel>[];
      json['currency'].forEach((v) {
        currency!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['position'] != null) {
      position = <Optionmodel>[];
      json['position'].forEach((v) {
        position!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['asset_type'] != null) {
      assetType = <Optionmodel>[];
      json['asset_type'].forEach((v) {
        assetType!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['shift_works'] != null) {
      shiftWorks = <Optionmodel>[];
      json['shift_works'].forEach((v) {
        shiftWorks!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['member_type'] != null) {
      memberType = <Optionmodel>[];
      json['member_type'].forEach((v) {
        memberType!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['nationality'] != null) {
      nationality = <Optionmodel>[];
      json['nationality'].forEach((v) {
        nationality!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['legal_status'] != null) {
      legalStatus = <Optionmodel>[];
      json['legal_status'].forEach((v) {
        legalStatus!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['relationship'] != null) {
      relationship = <Optionmodel>[];
      json['relationship'].forEach((v) {
        relationship!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['organization'] != null) {
      organization = <Optionmodel>[];
      json['organization'].forEach((v) {
        organization!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['identity_type'] != null) {
      identityType = <Optionmodel>[];
      json['identity_type'].forEach((v) {
        identityType!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['maritalStatus'] != null) {
      maritalStatus = <Optionmodel>[];
      json['maritalStatus'].forEach((v) {
        maritalStatus!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['directory_filter'] != null) {
      directoryFilter = <Optionmodel>[];
      json['directory_filter'].forEach((v) {
        directoryFilter!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['permanent_jobs'] != null) {
      permanentJobs = <Optionmodel>[];
      json['permanent_jobs'].forEach((v) {
        permanentJobs!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['document_types'] != null) {
      documentTypes = <Optionmodel>[];
      json['document_types'].forEach((v) {
        documentTypes!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['field_of_study'] != null) {
      fieldOfStudy = <Optionmodel>[];
      json['field_of_study'].forEach((v) {
        fieldOfStudy!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['business_model'] != null) {
      businessModel = <Optionmodel>[];
      json['business_model'].forEach((v) {
        businessModel!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['type_of_vihicle'] != null) {
      typeOfVihicle = <Optionmodel>[];
      json['type_of_vihicle'].forEach((v) {
        typeOfVihicle!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['house_ownership'] != null) {
      houseOwnership = <Optionmodel>[];
      json['house_ownership'].forEach((v) {
        houseOwnership!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['type_of_contracts'] != null) {
      typeOfContracts = <Optionmodel>[];
      json['type_of_contracts'].forEach((v) {
        typeOfContracts!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['transaction_types'] != null) {
      transactionTypes = <Optionmodel>[];
      json['transaction_types'].forEach((v) {
        transactionTypes!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['major_of_business'] != null) {
      majorOfBusiness = <Optionmodel>[];
      json['major_of_business'].forEach((v) {
        majorOfBusiness!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['job_with_contracts'] != null) {
      jobWithContracts = <Optionmodel>[];
      json['job_with_contracts'].forEach((v) {
        jobWithContracts!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['document_categories'] != null) {
      documentCategories = <Optionmodel>[];
      json['document_categories'].forEach((v) {
        documentCategories!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['registered_business'] != null) {
      registeredBusiness = <Optionmodel>[];
      json['registered_business'].forEach((v) {
        registeredBusiness!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['type_business_activities'] != null) {
      typeBusinessActivities = <Optionmodel>[];
      json['type_business_activities'].forEach((v) {
        typeBusinessActivities!.add(Optionmodel.fromJson(v));
      });
    }
    if (json['trading_specific_member_reasons'] != null) {
      tradingSpecificMemberReasons = <Optionmodel>[];
      json['trading_specific_member_reasons'].forEach((v) {
        tradingSpecificMemberReasons!.add(Optionmodel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (degree != null) {
      data['degree'] = degree!.map((v) => v.toJson()).toList();
    }
    if (riaseuseoffund != null) {
      data['raise_fund_use_for'] =
          riaseuseoffund!.map((v) => v.toJson()).toList();
    }
    if (branchs != null) {
      data['branchs'] = branchs!.map((v) => v.toJson()).toList();
    }
    if (gender != null) {
      data['gender'] = gender!.map((v) => v.toJson()).toList();
    }
    if (purpose != null) {
      data['purpose'] = purpose!.map((v) => v.toJson()).toList();
    }
    if (industry != null) {
      data['industry'] = industry!.map((v) => v.toJson()).toList();
    }
    if (currency != null) {
      data['currency'] = currency!.map((v) => v.toJson()).toList();
    }
    if (position != null) {
      data['position'] = position!.map((v) => v.toJson()).toList();
    }
    if (assetType != null) {
      data['asset_type'] = assetType!.map((v) => v.toJson()).toList();
    }
    if (shiftWorks != null) {
      data['shift_works'] = shiftWorks!.map((v) => v.toJson()).toList();
    }
    if (memberType != null) {
      data['member_type'] = memberType!.map((v) => v.toJson()).toList();
    }
    if (nationality != null) {
      data['nationality'] = nationality!.map((v) => v.toJson()).toList();
    }
    if (legalStatus != null) {
      data['legal_status'] = legalStatus!.map((v) => v.toJson()).toList();
    }
    if (relationship != null) {
      data['relationship'] = relationship!.map((v) => v.toJson()).toList();
    }
    if (organization != null) {
      data['organization'] = organization!.map((v) => v.toJson()).toList();
    }
    if (identityType != null) {
      data['identity_type'] = identityType!.map((v) => v.toJson()).toList();
    }
    if (maritalStatus != null) {
      data['maritalStatus'] = maritalStatus!.map((v) => v.toJson()).toList();
    }
    if (directoryFilter != null) {
      data['directory_filter'] =
          directoryFilter!.map((v) => v.toJson()).toList();
    }
    if (permanentJobs != null) {
      data['permanent_jobs'] = permanentJobs!.map((v) => v.toJson()).toList();
    }
    if (documentTypes != null) {
      data['document_types'] = documentTypes!.map((v) => v.toJson()).toList();
    }
    if (fieldOfStudy != null) {
      data['field_of_study'] = fieldOfStudy!.map((v) => v.toJson()).toList();
    }
    if (businessModel != null) {
      data['business_model'] = businessModel!.map((v) => v.toJson()).toList();
    }
    if (typeOfVihicle != null) {
      data['type_of_vihicle'] = typeOfVihicle!.map((v) => v.toJson()).toList();
    }
    if (houseOwnership != null) {
      data['house_ownership'] = houseOwnership!.map((v) => v.toJson()).toList();
    }
    if (typeOfContracts != null) {
      data['type_of_contracts'] =
          typeOfContracts!.map((v) => v.toJson()).toList();
    }
    if (transactionTypes != null) {
      data['transaction_types'] =
          transactionTypes!.map((v) => v.toJson()).toList();
    }
    if (majorOfBusiness != null) {
      data['major_of_business'] =
          majorOfBusiness!.map((v) => v.toJson()).toList();
    }
    if (jobWithContracts != null) {
      data['job_with_contracts'] =
          jobWithContracts!.map((v) => v.toJson()).toList();
    }
    if (documentCategories != null) {
      data['document_categories'] =
          documentCategories!.map((v) => v.toJson()).toList();
    }
    if (registeredBusiness != null) {
      data['registered_business'] =
          registeredBusiness!.map((v) => v.toJson()).toList();
    }
    if (typeBusinessActivities != null) {
      data['type_business_activities'] =
          typeBusinessActivities!.map((v) => v.toJson()).toList();
    }
    if (tradingSpecificMemberReasons != null) {
      data['trading_specific_member_reasons'] =
          tradingSpecificMemberReasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
