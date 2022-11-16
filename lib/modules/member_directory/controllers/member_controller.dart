import 'dart:async';
import 'dart:io';
import 'package:cicgreenloan/Utils/function/upload_file_controller.dart';
import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/Utils/helper/custom_route_snackbar.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/modules/member_directory/models/eductation.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_data.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:cicgreenloan/modules/member_directory/models/subscription.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/document_type.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../../../Utils/helper/firebase_analytics.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../models/company/company_data_model.dart';
import '../models/personal_profile_model.dart/personal_profile_model.dart';

final _customerController = Get.put(CustomerController());
final uploadCon = Get.put(UploadFileController());

class MemberController extends GetxController {
  final keyCompany = GlobalKey().obs;
  final memberData = MemberData().obs;
  final member = Member().obs;
  final selectedMember = Member().obs;
  final memberList = <Member>[].obs;
  final invitedMemberList = <Member>[].obs;
  final isTicked = false.obs;
  final memberLastPage = 0.obs;
  final memberCurrentPage = 1.obs;
  final memberResult = 0.obs;
  final filterResult = <Member>[].obs;
  final isLoading = false.obs;

  final isLoadingInvite = false.obs;
  final isReset = false.obs;
  final isloadingMore = false.obs;
  final page = 1.obs;
  String? tokenKey;
  final isNomoreData = false.obs;
  final currentPage = 0.obs;
  final isEmty = false.obs;
  final isDisableDoneButton = true.obs;
  final isDisableCompany = true.obs;
  final mapList = <String, List<int>>{}.obs;
  final companyData = CompanyDataModel().obs;
  final copyCompanyData = CompanyDataModel().obs;

  final educationMemberData = <EducationData>[].obs;

  // final educationModel = EducationModel().obs;
  // final educationMemberDataList = <EducationData>[].obs;

  final subscription = SubscriptionModel().obs;
  final subscriptionList = <SubscriptionData>[].obs;

  // final _memberCon = Get.put(MemberController());

  // Update Personal Profile Key
  final isValidatePermenantAddress = true.obs;
  final isValidateFullAddress = true.obs;
  final currentAddressList = <Address>[].obs;
  final fullCurrentAddress = FullAddress().obs;
  final fullResidentAddress = FullAddress().obs;

  //add new company
  final addCompany = false.obs;
  final isAddNewComapny = false.obs;

  FullAddress selectedAddress = FullAddress();
  final khmerName = ''.obs;
  final fullName = ''.obs;
  final customerDateOfBirth = ''.obs;
  final phone = ''.obs;
  final gmail = ''.obs;
  final telegram = ''.obs;
  final whatApp = ''.obs;
  final skype = ''.obs;
  final messenger = ''.obs;
  final webSite = ''.obs;
  final facebook = ''.obs;
  final linkIn = ''.obs;
  final tweeter = ''.obs;
  final currentAddress = ''.obs;
  final currentStreet = ''.obs;
  final currentHours = ''.obs;
  final permanentAddress = ''.obs;
  final permanentStreet = ''.obs;
  final permanetHours = ''.obs;
  final nationality = CustomerGender();
  final nationalityCode = ''.obs;
  final identityType = ''.obs;
  final identityTypeCode = ''.obs;
  final identityNumber = ''.obs;
  final identityDate = ''.obs;
  final identityExpireDate = ''.obs;
  final other = ''.obs;
  final yearJoin = ''.obs;
  final memberType = ''.obs;
  final expertise = ''.obs;
  final recommand = ''.obs;
  final profileBiorgraphy = ''.obs;
  final isSelectTap = false.obs;
  final memberPosition = ''.obs;
  final membercomapnyName = ''.obs;
  final memberAboutAs = ''.obs;

  // Education Key
  final dateTime = DateFormat('yyyy-MM-dd');
  final school = ''.obs;
  final degree = ''.obs;
  final fieldOfstudy = ''.obs;
  final startDate = ''.obs;
  final endDate = ''.obs;
  final grade = ''.obs;
  final description = ''.obs;
  final isButtonTapped = false.obs;
  // Experience Key
  final title = ''.obs;
  final employmentType = ''.obs;
  final companyName = ''.obs;
  final experienceStartDate = ''.obs;
  final experienceEndDate = ''.obs;
  final location = ''.obs;
  final experienceGrade = ''.obs;
  final experienceDecription = ''.obs;
  final gender = GenderOption().obs;
  //Company
  final comId = 0.obs;
  final comCompanyName = ''.obs;
  final isCompanyName = true.obs;
  final comSlogan = ''.obs;
  final comKhmerName = ''.obs;
  final comMajorOfBusiness = ''.obs;
  final comPosition = DocumentType().obs;
  final comPositions = ''.obs;
  final comLegalSatuts = ''.obs;
  final comRegisteredBusiness = ''.obs;
  final comCompanySize = ''.obs;
  final comNumberOfBranches = ''.obs;
  final comBusinessModel = ''.obs;
  final comCapitalInvestment = ''.obs;
  final comYearfounded = ''.obs;
  final comIsPrimary = ''.obs;
  final comPersonalInterest = ''.obs;
  final comProfile = ''.obs;
  final comproductandservice = ''.obs;
  final comhouseno = ''.obs;
  final comstreetno = ''.obs;
  final comaddress = ''.obs;
  final comphonenumber = ''.obs;
  final comEmail = ''.obs;
  final comWhatapp = ''.obs;
  final comTelegram = ''.obs;
  final comMessenger = ''.obs;
  final comSkype = ''.obs;
  final comWechat = ''.obs;
  final comWebsite = ''.obs;
  final comFacebook = ''.obs;
  final comLinkedin = ''.obs;
  final comTwitter = ''.obs;
  final comCompanyLogoString = ''.obs;
  File? comCompanyLogo;
  final companyLogoUrl = "".obs;
  final memberIdList = <dynamic>[].obs;
  final profilePage = 1.obs;
  // List<dynamic>? invitedList=memberIdList;
  int? eventId;
  // onInviteMember({Member? member}) {
  //   invitedMemberList.add(member!);
  //   update();
  // }

  ApiBaseHelper apiBaseHelpers = ApiBaseHelper();
  onSelected({int? index, Member? member}) {
    // isTicked.value = !isTicked.value;

    memberList[index!].isTicked = !memberList[index].isTicked!;
    if (memberList[index].isTicked == true) {
      invitedMemberList.add(member!);
      memberIdList.clear();
      invitedMemberList.map((element) {
        memberIdList.add(element.id!);
      }).toList();
    } else {
      invitedMemberList.remove(member);
    }
    update();
  }

  onClearInvitedMember() {
    memberList.asMap().entries.map((e) {
      e.value.isTicked = false;
    }).toList();

    invitedMemberList.clear();
    invitedMemberList.refresh();

    update();
  }

  // final genderList = List<GenderOption>().obs;
  List<GenderOption> genderList = [
    GenderOption(id: 01, display: 'Male'),
    GenderOption(id: 02, display: 'Female'),
  ];
  String base64Image = '';
  Future<String?> networkImageToBase64(String? imageUrl) async {
    http.Response response = await http.get(
      Uri.parse(imageUrl!),
    );
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }

  final customerController = Get.put(CustomerController());
  Future<void> onInvitedEventMember({
    required BuildContext context,
  }) async {
    List<dynamic>? inviteId = memberIdList;

    Map<String, dynamic> arqument = {
      "event_id": "$eventId",
      "invite_id": "$inviteId",
      "member_id": "${customerController.customer.value.customerId}",
      "name": "${customerController.customer.value.fullName}",
      "company_name": "${customerController.customer.value.company}",
      "position": customerController.customer.value.position!.display!,
      "phone_number": "${customerController.customer.value.phone}",
      "email": "${customerController.customer.value.email}"
    };
    var body = json.encode(arqument);
    isLoadingInvite.value = true;
    tokenKey = await LocalData.getCurrentUser();

    String url = '${FlavorConfig.instance.values!.apiBaseUrlV2}registration';

    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: body)
          .then((response) {
        if (response.statusCode == 200) {
          customRouterSnackbar(
              title: 'Event Invitation',
              description: "Your Invite was Submit Successful...!",
              type: SnackType.error);
        } else {}
      });
    } finally {
      isLoadingInvite.value = false;
    }
  }

  final isLoadingUpdateComapny = false.obs;

  Future<void> onUpdateCompany(BuildContext? context, int? id) async {
    isLoadingUpdateComapny(true);
    debugPrint('image com logo:$comCompanyLogo');
    if (comCompanyLogo != null) {
      final byte = comCompanyLogo!.readAsBytesSync();
      final companyLogos = await FlutterImageCompress.compressWithList(
        byte.buffer.asUint8List(),
        minWidth: 800,
        minHeight: 800,
        quality: 70,
        rotate: 0,
      );
      base64Image = base64Encode(companyLogos);
    } else if (comCompanyLogoString.value != '') {
      base64Image = (await networkImageToBase64(comCompanyLogoString.value))!;
    }
    debugPrint('image url:$base64Image');
    await apiBaseHelper.onNetworkRequesting(
        url: 'company/createOrUpdate',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "company_id": id,
          "company_name": companyData.value.companyName,
          "company_slogan": companyData.value.companySlogan,
          "company_logo":
              base64Image == '' ? '' : "data:image/png;base64,$base64Image",
          "company_profile": companyData.value.companyProfile,
          "company_product_and_service":
              companyData.value.companyProductAndService,
          "address": companyData.value.address,
          "phone_number": companyData.value.phoneNumber,
          "email": companyData.value.email,
          "website": companyData.value.website
        }).then((response) {
      debugPrint('image url update:$base64Image');
      customRouterSnackbar(
          title: 'Successful...!',
          description: 'Company Updated Successful...!');

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context!);
        fetchCompanyMember(id: cusController.customer.value.customerId);
      });

      isLoadingUpdateComapny(false);
      update();

      uploadCon.imageFile.value = File('');
      onClearCompany();
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingUpdateComapny(false);
      final message = errorModel.bodyString['message'];
      customRouterSnackbar(
        title: 'Fialed...!',
        description: '$message Company Updated Failed...!',
        type: SnackType.error,
      );
    });
  }

  final isEditCompany = false.obs;
  // ondelete company
  final isDeleteComapny = false.obs;
  Future<void> onDeleteImageProfile(
      BuildContext? context, int? id, String? model) async {
    String url =
        '${FlavorConfig.instance.values!.baseUrl}uploads/files/default/default-image.png';
    isDeleteComapny(true);
    await apiBaseHelper.onNetworkRequesting(
        methode: METHODE.post,
        isAuthorize: true,
        url: 'helper/remove/image/$id',
        body: {"model": model}).then((response) {
      companyLogoUrl.value = url;
      customRouterSnackbar(
        title: 'Deleted',
        description: 'Profile image has been deleted',
      );
      cusController.getUser();
      fetchCompanyMember(id: cusController.customer.value.customerId);
      isDeleteComapny(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isDeleteComapny(false);
    });
  }

//clear image profile
  onClearImage() {
    uploadCon.imageFile.value = File('');
  }

  ///clear company form
  onClearCompany() {
    companyData.value = companyData.value.copyWith(
        companyName: "",
        companyLogo: '',
        companySlogan: '',
        phoneNumber: '',
        email: '',
        address: '',
        website: '',
        companyProfile: '',
        companyProductAndService: '');
    isCompanyName.value = true;
    isDisableCompany.value = true;
    base64Image = '';
    comCompanyLogo = null;
    // uploadCon.imageFile = null;
    // company.value.companyLogo = '';
    // cusController.customer.value.profile = '';
  }

//submit company
  final isLoadingSubmitCompany = false.obs;
  Future<void> onSubmitCompany(BuildContext? context) async {
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}company/createOrUpdate';
    tokenKey = await LocalData.getCurrentUser();
    debugPrint('heloo statuscode:+++++++++');
    if (comCompanyLogo != null) {
      final byte = comCompanyLogo!.readAsBytesSync();
      List<int> companyLogos = await FlutterImageCompress.compressWithList(
        byte,
        minWidth: 800,
        minHeight: 800,
        quality: 70,
        rotate: 0,
      );
      base64Image = base64Encode(companyLogos);
    }
    var data = json.encode({
      "member_id": _customerController.customer.value.customerId,
      "company_name": companyData.value.companyName,
      "company_slogan": companyData.value.companySlogan,
      "company_logo":
          base64Image == '' ? '' : "data:image/png;base64,$base64Image",
      "company_profile": companyData.value.companyProfile,
      "company_product_and_service": companyData.value.companyProductAndService,
      "address": companyData.value.address,
      "phone_number": companyData.value.phoneNumber,
      "email": companyData.value.email,
      "website": companyData.value.website
    });
    try {
      isLoadingSubmitCompany(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
        FirebaseAnalyticsHelper.sendAnalyticsEvent('Success Submit Company');
        customRouterSnackbar(
          title: 'Successful...!',
          description: 'Company Create Successful...!',
        );
        fetchCompanyMember(id: cusController.customer.value.customerId);
        // fetchCompanyMemberDetail(cusController.customer.value.customerId!);
        Navigator.pop(context!);

        update();
      } else {
        debugPrint('hekoo create:${response.body}');
        FirebaseAnalyticsHelper.sendAnalyticsEvent('Fail Submit Company');
        customRouterSnackbar(
          title: 'Failed...!',
          description: 'Company Updated Failed...!',
          type: SnackType.error,
        );
      }
    } finally {
      //  isSelectTap.value = false;
      base64Image = '';
      isLoadingSubmitCompany(false);
    }
  }

  final isLaodingUpdateProfile = false.obs;
  final cusController = Get.put(CustomerController());
  Future<void> updatePersonalProfile(BuildContext? context) async {
    isLaodingUpdateProfile(true);
    debugPrint("Customer Name: ${personalProfile.value.customerName}");
    await apiBaseHelpers.onNetworkRequesting(
        url: 'member-profile/update',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'member_id': _customerController.customer.value.customerId,
          'company_name': personalProfile.value.companyName,
          'full_name': personalProfile.value.customerLatinName,
          'phone': personalProfile.value.phone,
          'email': personalProfile.value.email,
          'telegram': personalProfile.value.telegram,
          'website': personalProfile.value.website,
          'about': personalProfile.value.about,
          'title': personalProfile.value.title,
        }).then((response) {
      customRouterSnackbar(
          title: 'Successful...!',
          description: 'Profile Updated Successful...!');
      debugPrint('herr12345678r suss:===${personalProfile.value.companyName}');
      fetchMemberPersonProfile(id: cusController.customer.value.customerId);

      cusController.getUser();
      isLaodingUpdateProfile(false);
      Navigator.pop(context!);
      update();
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint('herr12345678r suss:${errorModel.statusCode}');
      debugPrint('herr12345678r suss1234567=====:${errorModel.bodyString}');
      customRouterSnackbar(
        title: 'Failed...!',
        description: 'Profile Updated Failed...!',
        type: SnackType.error,
      );
      isLaodingUpdateProfile(false);
    });
  }

  Future<List<SubscriptionData>> fetchSubscriptionMember(int id) async {
    tokenKey = await LocalData.getCurrentUser();
    try {
      isLoading(true);
      String url =
          '${FlavorConfig.instance.values!.apiBaseUrl}member-subscription?member_id=$id';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          subscription.value = SubscriptionModel.fromJson(responseJson);
          subscriptionList.value = subscription.value.data!;
        } else if (response.statusCode == 404) {
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return subscriptionList;
  }

  final isLoadingQRCode = false.obs;
  final personalProfilemember = User().obs;
  Future<User> getUserDetail(int? id) async {
    isLoadingQRCode(true);
    // dynamic responseJson;
    var token = await LocalData.getCurrentUser();

    String userUrl =
        '${FlavorConfig.instance.values!.mainApiUrl}user-detail?customer_id=$id';
    try {
      await http.get(Uri.parse(userUrl), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) async {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          personalProfilemember.value = User.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingQRCode(false);
    }
    return personalProfilemember.value;
  }

  final isLoadingProfile = false.obs;
  final personalProfile = PersonalProfile().obs;
  final copyPersonalProfile = PersonalProfile().obs;
  Future<PersonalProfile> fetchMemberPersonProfile({int? id}) async {
    isLoadingProfile(true);
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV3}member-profile?member_id=$id';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          personalProfile.value = PersonalProfile.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingProfile(false);
    }
    return personalProfile.value;
  }

  Future<void> submitHiden({
    int? memberId,
    String? pages,
    String? profile,
    String? field,
    int? active,
  }) async {
    String url = '${FlavorConfig.instance.values!.apiBaseUrlV3}hidden-field';
    tokenKey = await LocalData.getCurrentUser();

    var data = json.encode({
      "member_id": memberId,
      "page": pages,
      "field": field,
      "active": active
    });

    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey'
          },
          body: data);
      if (response.statusCode == 200) {
      } else {}
    } finally {
      isLoading(false);
    }
  }

  final company = CompanyDataModel().obs;
  final isLoadingCompanyProfile = false.obs;
  final companyDataList = <CompanyDataModel>[].obs;

  Future<List<CompanyDataModel>> fetchCompanyMember({int? id}) async {
    isLoadingCompanyProfile(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'member-company?member_id=$id',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responseJson = response['data'];
      companyDataList.clear();
      responseJson.map((e) {
        company.value = CompanyDataModel.fromJson(e);
        companyDataList.add(company.value);
      }).toList();
      isLoadingCompanyProfile(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingCompanyProfile(false);
    });
    return companyDataList;
  }

  final isLoadingCompany = false.obs;
  Future<List<CompanyDataModel>> fetchCompanyMemberDetail(int id) async {
    tokenKey = await LocalData.getCurrentUser();
    isLoadingCompany(true);
    try {
      companyDataList.clear();

      String url =
          '${FlavorConfig.instance.values!.apiBaseUrlV2}member-company?member_id=$id';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          companyDataList.clear();
          var responseJson = json.decode(response.body)['data'];

          responseJson.map((json) {
            companyDataList.add(CompanyDataModel.fromJson(json));
          }).toList();
        }
      });
    } finally {
      isLoadingCompany(false);
    }
    return companyDataList;
  }

  Future<List<Member>> fetchAllMembers(
      {String? filter,
      int pageNumber = 1,
      String? filterJson,
      int? eventId,
      int? isShowCiCTeam}) async {
    isLoading(true);

    page.value++;
    tokenKey = await LocalData.getCurrentUser();
    String url = '';
    if (filter != null) {
      if (isShowCiCTeam != null) {
        debugPrint("is member: 1");
        url =
            '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillter=$filter&show_cic_team=1&page=$pageNumber&hide_me=1';
      } else {
        debugPrint("is event:");
        debugPrint("is member: 2");
        url =
            '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillter=$filter&page=$pageNumber&event_id=$eventId';
      }
    } else if (filterJson != null) {
      if (memberCurrentPage.value != 0) {
        //1
        if (memberCurrentPage.value < memberLastPage.value) {
          memberCurrentPage.value = memberCurrentPage.value + 1; //2

          if (isShowCiCTeam != null) {
            debugPrint("is member: 3");
            url =
                '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillters=$filterJson&show_cic_team=1&page=$memberCurrentPage&hide_me=1';
          } else {
            debugPrint("is member: 4");
            url =
                '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillters=$filterJson&page=$memberCurrentPage&event_id=$eventId';
          }
        }
      } else {
        if (isShowCiCTeam != null) {
          debugPrint("is member: 5");
          url =
              '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillters=$filterJson&show_cic_team=1&hide_me=1';
        } else {
          debugPrint("is member: 6");
          url =
              '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillters=$filterJson&event_id=$eventId';
        }
      }
    } else {
      if (isShowCiCTeam != null) {
        debugPrint("is member: 7");
        url =
            '${FlavorConfig.instance.values!.apiBaseUrl}customer?show_cic_team=1&hide_me=1&page=$pageNumber';
      } else {
        debugPrint("is member: 8");
        url =
            '${FlavorConfig.instance.values!.apiBaseUrl}customer?page=$pageNumber&event_id=$eventId';
      }
    }

    try {
      if (page.value > 0) {
        isloadingMore(true);
      }

      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then(
        (response) {
          if (response.statusCode == 200) {
            var responseJson = json.decode(response.body);

            memberData.value = MemberData.fromJson(responseJson);
            debugPrint("working 1");

            currentPage.value = memberData.value.meta!.currentPage!;
            debugPrint("working 2");

            ///
            // memberList.clear();
            if (memberData.value.links!.next == null) {
              memberList.addAll(memberData.value.data!);
              isEmty(true);
            } else {
              isEmty(false);
            }
            debugPrint("working 3");

            ///
            // memberList.clear();
            if (filter != null || eventId != null) {
              debugPrint("working 4");
              memberList.addAll(memberData.value.data!);
              debugPrint("member data is 1 ");
            } else if (filter != null || eventId != null) {
              //  memberList.clear();
              debugPrint("working 5");

              if (currentPage.value < memberData.value.meta!.lastPage! + 1) {
                debugPrint("working 6");
                memberList.addAll(memberData.value.data!);
                debugPrint("member data is 2 ");
              }
              memberResult.value = memberData.value.meta!.total!;
              memberLastPage.value = memberData.value.meta!.lastPage!;
              if (memberCurrentPage.value == 0) memberCurrentPage.value = 1;
            } else {
              if (memberData.value.links!.next != null) {
                debugPrint("working 7");
                memberList.addAll(memberData.value.data!);
                debugPrint("member data is 3 ");
              } else {
                isloadingMore(false);
              }
            }
          }
        },
      );
    } finally {
      isloadingMore(false);
      isLoading(false);
      isEmty(false);
      // isEmty(false);
      // update();
    }
    return memberList;
  }

  List<Member> filterMemberResult = [];

  Future<List<Member>> filterMember({String? filterOption}) async {
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}customer?fillters=$filterOption';
    try {
      memberList.clear();
      isLoading(true);

      tokenKey = await LocalData.getCurrentUser();
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          memberData.value = MemberData.fromJson(responseJson);

          filterMemberResult.addAll(memberData.value.data!);
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return filterMemberResult;
  }

  @override
  void onReady() {
    fetchMemberPersonProfile(id: customerController.customer.value.customerId!);
    fetchCompanyMember();
    super.onReady();
  }

  ///Virak Fix Fetch Member
  final apiBaseHelper = ApiBaseHelper();
  var listAllMember = <Member>[].obs;
  var listMemberFiltered = <Member>[].obs;
  final fetchAllMemberLoading = false.obs;
  final fetchMoreMemberLoading = false.obs;
  final currentMemberPage = 1.obs;
  final currentPages = 1.obs;
  final next = true.obs;
  final searchTextFieldController = TextEditingController().obs;

  ///Fetch All Member
  Future<List<Member>> onFetchAllMember({
    @required int? page,
    int? eventId,
    String? filter,
    String? filterJson,
    bool? showCICteam,
    bool? hideMe,
  }) async {
    String pageParam =
        page != null && page != 0 && page > 0 ? '?page=$page' : '?page=1';
    String filterParam = filter != null ? '&fillter=$filter' : '';
    String isCICmemberParam = showCICteam == null
        ? ''
        : showCICteam == true
            ? '&show_cic_team=1'
            : '&show_cic_team=0';

    String hideMeParam = hideMe == null
        ? ''
        : hideMe == true
            ? '&hide_me=1'
            : '&hide_me=0';
    String eventParam = eventId == null ? '' : '&event_id=$eventId';
    String jsonParam = filterJson == null ? '' : '&fillters=$filterJson';

    ///Controll Loading
    if (page == 1) {
      fetchAllMemberLoading(true);
      fetchMoreMemberLoading(false);
    } else {
      fetchAllMemberLoading(false);
      fetchMoreMemberLoading(true);
    }

    ///Request to API
    await apiBaseHelper
        .onNetworkRequesting(
      fullURL:
          '${FlavorConfig.instance.values!.apiBaseUrl}customer$pageParam$filterParam$isCICmemberParam$hideMeParam$eventParam$jsonParam',
      // '${GlobalConfiguration().get('api_base_url')}customer?page=$page&hide_me=1$_filterParam',
      url: '',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      //Check Last Page
      if (response['links']["next"] != null) {
        next(true);
      } else if (response['links']["next"] == null) {
        next(false);
      }

      ///always clear list when using filter
      if (filter != null) {
        listAllMember.clear();
      }

      ///Clear List When Refresh
      if (page == 1) {
        listAllMember.clear();
      }

      var reultFromJson = response['data'];
      reultFromJson.map((e) {
        listAllMember.add(Member.fromJson(e));
      }).toList();

      ///handlel loading
      fetchMoreMemberLoading(false);
      fetchAllMemberLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      fetchAllMemberLoading(false);
      fetchMoreMemberLoading(false);
    });

    return listAllMember;
  }

  final textFieldSearch = ''.obs;
}
