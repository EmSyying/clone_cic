// class CompanyProfile {
//   List<Company> data;
//   Links links;
//   Meta meta;

//   CompanyProfile({this.data, this.links, this.meta});

//   CompanyProfile.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = new List<Company>();
//       json['data'].forEach((v) {
//         data.add(new Company.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? new Links.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     if (this.links != null) {
//       data['links'] = this.links.toJson();
//     }
//     if (this.meta != null) {
//       data['meta'] = this.meta.toJson();
//     }
//     return data;
//   }
// }

// class Company {
//   int id;
//   int memberId;
//   String companyName;
//   String khmerName;
//   List<MajorOfBusiness> majorOfBusiness;
//   List<Position> position;
//   List<LegalStatus> legalStatus;
//   List<RegisteredBusiness> registeredBusiness;
//   int companySize;
//   int numberOfBranches;
//   List<BusinessModel> businessModel;
//   String capitalInvestment;
//   String yearFounded;
//   int isPrimary;
//   String companyDiagnosticReport;
//   String companyMilestones;
//   String companyLogo;
//   String personalInterest;
//   String companyProfile;
//   String companyProductAndService;
//   String houseNo;
//   String streetNo;
//   String address;
//   String phoneNumber;
//   String email;
//   String whatApp;
//   String telegram;
//   String messenger;
//   String skype;
//   String weChat;
//   String website;
//   String facebook;
//   String linkedin;
//   String twitter;

//   Data(
//       {this.id,
//       this.memberId,
//       this.companyName,
//       this.khmerName,
//       this.majorOfBusiness,
//       this.position,
//       this.legalStatus,
//       this.registeredBusiness,
//       this.companySize,
//       this.numberOfBranches,
//       this.businessModel,
//       this.capitalInvestment,
//       this.yearFounded,
//       this.isPrimary,
//       this.companyDiagnosticReport,
//       this.companyMilestones,
//       this.companyLogo,
//       this.personalInterest,
//       this.companyProfile,
//       this.companyProductAndService,
//       this.houseNo,
//       this.streetNo,
//       this.address,
//       this.phoneNumber,
//       this.email,
//       this.whatApp,
//       this.telegram,
//       this.messenger,
//       this.skype,
//       this.weChat,
//       this.website,
//       this.facebook,
//       this.linkedin,
//       this.twitter});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     memberId = json['member_id'];
//     companyName = json['company_name'];
//     khmerName = json['khmer_name'];
//     if (json['major_of_business'] != null) {
//       majorOfBusiness = new List<MajorOfBusiness>();
//       json['major_of_business'].forEach((v) {
//         majorOfBusiness.add(new MajorOfBusiness.fromJson(v));
//       });
//     }
//     if (json['position'] != null) {
//       position = new List<Position>();
//       json['position'].forEach((v) {
//         position.add(new Position.fromJson(v));
//       });
//     }
//     if (json['legal_status'] != null) {
//       legalStatus = new List<LegalStatus>();
//       json['legal_status'].forEach((v) {
//         legalStatus.add(new LegalStatus.fromJson(v));
//       });
//     }
//     if (json['registered_business'] != null) {
//       registeredBusiness = new List<RegisteredBusiness>();
//       json['registered_business'].forEach((v) {
//         registeredBusiness.add(new RegisteredBusiness.fromJson(v));
//       });
//     }
//     companySize = json['company_size'];
//     numberOfBranches = json['number_of_branches'];
//     if (json['business_model'] != null) {
//       businessModel = new List<BusinessModel>();
//       json['business_model'].forEach((v) {
//         businessModel.add(new BusinessModel.fromJson(v));
//       });
//     }
//     capitalInvestment = json['capital_investment'];
//     yearFounded = json['year_founded'];
//     isPrimary = json['is_primary'];
//     companyDiagnosticReport = json['company_diagnostic_report'];
//     companyMilestones = json['company_milestones'];
//     companyLogo = json['company_logo'];
//     personalInterest = json['personal_interest'];
//     companyProfile = json['company_profile'];
//     companyProductAndService = json['company_product_and_service'];
//     houseNo = json['house_no'];
//     streetNo = json['street_no'];
//     address = json['address'];
//     phoneNumber = json['phone_number'];
//     email = json['email'];
//     whatApp = json['what_app'];
//     telegram = json['telegram'];
//     messenger = json['messenger'];
//     skype = json['skype'];
//     weChat = json['we_chat'];
//     website = json['website'];
//     facebook = json['facebook'];
//     linkedin = json['linkedin'];
//     twitter = json['twitter'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['member_id'] = this.memberId;
//     data['company_name'] = this.companyName;
//     data['khmer_name'] = this.khmerName;
//     if (this.majorOfBusiness != null) {
//       data['major_of_business'] =
//           this.majorOfBusiness.map((v) => v.toJson()).toList();
//     }
//     if (this.position != null) {
//       data['position'] = this.position.map((v) => v.toJson()).toList();
//     }
//     if (this.legalStatus != null) {
//       data['legal_status'] = this.legalStatus.map((v) => v.toJson()).toList();
//     }
//     if (this.registeredBusiness != null) {
//       data['registered_business'] =
//           this.registeredBusiness.map((v) => v.toJson()).toList();
//     }
//     data['company_size'] = this.companySize;
//     data['number_of_branches'] = this.numberOfBranches;
//     if (this.businessModel != null) {
//       data['business_model'] =
//           this.businessModel.map((v) => v.toJson()).toList();
//     }
//     data['capital_investment'] = this.capitalInvestment;
//     data['year_founded'] = this.yearFounded;
//     data['is_primary'] = this.isPrimary;
//     data['company_diagnostic_report'] = this.companyDiagnosticReport;
//     data['company_milestones'] = this.companyMilestones;
//     data['company_logo'] = this.companyLogo;
//     data['personal_interest'] = this.personalInterest;
//     data['company_profile'] = this.companyProfile;
//     data['company_product_and_service'] = this.companyProductAndService;
//     data['house_no'] = this.houseNo;
//     data['street_no'] = this.streetNo;
//     data['address'] = this.address;
//     data['phone_number'] = this.phoneNumber;
//     data['email'] = this.email;
//     data['what_app'] = this.whatApp;
//     data['telegram'] = this.telegram;
//     data['messenger'] = this.messenger;
//     data['skype'] = this.skype;
//     data['we_chat'] = this.weChat;
//     data['website'] = this.website;
//     data['facebook'] = this.facebook;
//     data['linkedin'] = this.linkedin;
//     data['twitter'] = this.twitter;
//     return data;
//   }
// }

// class MajorOfBusiness {
//   int id;
//   String display;
//   String displayKhmer;

//   MajorOfBusiness({this.id, this.display, this.displayKhmer});

//   MajorOfBusiness.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     display = json['display'];
//     displayKhmer = json['display_khmer'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['display'] = this.display;
//     data['display_khmer'] = this.displayKhmer;
//     return data;
//   }
// }

// class Position {
//   int id;
//   String display;
//   Null displayKhmer;

//   Position({this.id, this.display, this.displayKhmer});

//   Position.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     display = json['display'];
//     displayKhmer = json['display_khmer'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['display'] = this.display;
//     data['display_khmer'] = this.displayKhmer;
//     return data;
//   }
// }

// class Links {
//   String first;
//   String last;
//   Null prev;
//   Null next;

//   Links({this.first, this.last, this.prev, this.next});

//   Links.fromJson(Map<String, dynamic> json) {
//     first = json['first'];
//     last = json['last'];
//     prev = json['prev'];
//     next = json['next'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first'] = this.first;
//     data['last'] = this.last;
//     data['prev'] = this.prev;
//     data['next'] = this.next;
//     return data;
//   }
// }

// class Meta {
//   int currentPage;
//   int from;
//   int lastPage;
//   String path;
//   int perPage;
//   int to;
//   int total;

//   Meta(
//       {this.currentPage,
//       this.from,
//       this.lastPage,
//       this.path,
//       this.perPage,
//       this.to,
//       this.total});

//   Meta.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }
