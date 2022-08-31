import 'dart:convert';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/application_detail.dart';
import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option_data.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/helper/api_base_helper.dart';
import '../../../Utils/helper/custom_snackbar.dart';

class DebtInvestmentController extends GetxController {
  final apiBaseHelper = ApiBaseHelper();
  //---------------------Step 1------------------------
  final isValidateFullName = true.obs;
  final isValidateDateOfBirth = true.obs;
  final isValidateEmail = true.obs;
  final isValidatePhone = true.obs;
  final isValidateFullAddress = true.obs;
  final isValidatePermenantAddress = true.obs;
  final isValidateGender = true.obs;

  final isPatentDoc = false.obs;
  final isCertificate = false.obs;
  final isLicense = false.obs;
  final isMemorandum = false.obs;
  final patentDocument = 0.obs;
  final certificatioDoc = 0.obs;
  final licenseDoc = 0.obs;
  final memorandumDoc = 0.obs;

  final gender = Optionmodel().obs;
  final selectedIndexGender = 1.obs;
  final selectAddIndex = 0.obs;
  final fullName = ''.obs;
  final email = ''.obs;
  final phoneNumber = ''.obs;
  final dateOfBirth = ''.obs;
  final currentAddressList = <Address>[].obs;
  final fullCurrentAddress = FullAddress().obs;
  final fullResidentAddress = FullAddress().obs;

  //edit add temp variable
  final temFullCurrentAdd = FullAddress().obs;
  final temFullPermanent = FullAddress().obs;
  final num = 1.obs;

  //---------------------Step 2------------------------
  final isValidateProductType = true.obs;
  final isValidateFinancingAmount = true.obs;
  final isValidateIntendedDate = true.obs;
  final isValidateFnancingPurpose = true.obs;
  final isValidateTerm = true.obs;
  final isValidateTermAmount = false.obs;
  final financingAmount = 0.0.obs;
  final term = 0.obs;
  final financingPurpose = Optionmodel().obs;
  final intendedDate = ''.obs;
  final productType = Option().obs;
  //---------------------Step 3------------------------
  final isValCompanyName = true.obs;
  final isValAddress = true.obs;
  final isValYearOfEstablishment = true.obs;
  final isValTypeOfOrganization = true.obs;
  final isValIndustry = true.obs;
  final isValNumberOfStaff = true.obs;
  final isValOwnerName = true.obs;
  final isValProductService = true.obs;
  onResetValidateCompany() {
    isValCompanyName.value = true;
    isValAddress.value = true;
    isValYearOfEstablishment.value = true;
    isValTypeOfOrganization.value = true;
    isValIndustry.value = true;
    isValNumberOfStaff.value = true;
    isValOwnerName.value = true;
    isValProductService.value = true;
  }

  // final isPatentDoc = false.obs;

  final companyIndex = ''.obs;
  TextEditingController termController = TextEditingController();
  TextEditingController financingAmountcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController yearofestablistmentController = TextEditingController();
  TextEditingController taxindentificationController = TextEditingController();
  TextEditingController numberofStaffController = TextEditingController();
  TextEditingController ownernameController = TextEditingController();
  final _memberCon = Get.put(MemberController());

  final companyName = ''.obs;
  final address = ''.obs;
  final yearOfEstablishment = ''.obs;
  final typeOfOrganization = Optionmodel().obs;
  final taxIdentificationNumber = ''.obs;
  final industry = Optionmodel().obs;
  final numberOfStaff = ''.obs;
  final ownerName = ''.obs;
  final productSevice = ''.obs;
  final companiesIndex = ''.obs;

  final patentDoc = [].obs;
  final mocCertificate = [].obs;
  final licenceDoc = [].obs;
  //---------------------Step 4------------------------
  final isValIncomeStatement = false.obs;
  final isValBalanceSheet = false.obs;

  // final balanceSheet = [].obs;
  // final incomeStatement = [].obs;
  // final cashFlowStatement = [].obs;
  // final businessPlan = [].obs;
  // final otherDocuments = [].obs;

  final businessPlan = 1.obs;
  final articleOfIncorporation = 1.obs;
  final incomeStatement = 1.obs;
  final balanceSheet = 1.obs;
  final cashFlowStatement = 1.obs;
  final otherDocuments = 1.obs;

  //---------------------Preview Form -----------------
  final isAgree = false.obs;
  final isLoadingSubmit = false.obs;
  final isSubmitLoading = false.obs;
  final currentAddressCode = ''.obs;
  final residentAddressCode = ''.obs;
  final currentAddress = FullAddress().obs; //use on edit
  final residentAddress = FullAddress().obs; //use on edit

  ///edit address
  final addIndex = 0.obs;

  //TabBar
  late TabController tabController;
  final tapcurrentIndex = 0.obs;
  final applicationData = ApplicationDataDetail().obs;

  ///==================================Fetch Data+++++++++++++++++++++++
  String? token;
  final isLoadingData = false.obs;

  Future<String?> networkImageToBase64(String? imageUrl) async {
    http.Response response = await http.get(
      Uri.parse(imageUrl!),
    );
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }

  Future<void> onSubmitDebtInvestment({
    BuildContext? context,
    int? step,
    int? frompage = 0,
    bool showDebtSnackbar = true,
  }) async {
    isLoadingSubmit(true);
    token = await LocalData.getCurrentUser();
    String url = step != null
        ? '${GlobalConfiguration().get('api_base_urlv3')}debt-investment?draft=true&step=$step'
        : '${GlobalConfiguration().get('api_base_urlv3')}debt-investment';
    if (fullCurrentAddress.value.addressList != null) {
      if (fullCurrentAddress.value.addressList!.length == 3) {
        currentAddressCode.value =
            fullCurrentAddress.value.addressList![2].code!;
      } else {
        currentAddressCode.value =
            fullCurrentAddress.value.addressList![3].code!;
      }
    } else {
      if (_memberCon.personalProfile.value.currentAddress!.city!.code != '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.city!.code!;
      }
      if (_memberCon.personalProfile.value.currentAddress!.district!.code !=
          '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.district!.code!;
      }
      if (_memberCon.personalProfile.value.currentAddress!.commune!.code !=
          '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.commune!.code!;
      }
      if (_memberCon.personalProfile.value.currentAddress!.village!.code !=
          '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.village!.code!;
      }
    }

    if (fullResidentAddress.value.addressList != null) {
      if (fullResidentAddress.value.addressList!.length == 3) {
        residentAddressCode.value =
            fullResidentAddress.value.addressList![2].code!;
      } else {
        residentAddressCode.value =
            fullResidentAddress.value.addressList![3].code!;
      }
    } else {
      if (_memberCon.personalProfile.value.permanentAddress!.city!.code != '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.city!.code!;
      }
      if (_memberCon.personalProfile.value.permanentAddress!.district!.code !=
          '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.district!.code!;
      }
      if (_memberCon.personalProfile.value.permanentAddress!.commune!.code !=
          '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.commune!.code!;
      }
      if (_memberCon.personalProfile.value.permanentAddress!.village!.code !=
          '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.village!.code!;
      }
    }
    debugPrint('value of Term=================:$term');
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      // ==========start base64============

      request.headers.addAll(headers);
      request.fields.addAll(
        {
          "customer_name": "$fullName",
          "customer_gender": "${gender.value.id}",
          "customer_date_of_birth": "$dateOfBirth",
          "customer_email": "$email",
          "phone_number": "$phoneNumber",
          "current_house_no": fullCurrentAddress.value.houseNo != null
              ? "${fullCurrentAddress.value.houseNo}"
              : "",
          "current_street_no": fullCurrentAddress.value.streetNo != null
              ? "${fullCurrentAddress.value.streetNo}"
              : "",
          "current_address": "$currentAddressCode",
          "residence_house_no": fullResidentAddress.value.houseNo != null
              ? "${fullResidentAddress.value.houseNo}"
              : "",
          "residence_street_no": fullResidentAddress.value.streetNo != null
              ? "${fullResidentAddress.value.streetNo}"
              : "",
          "residence_address": "$residentAddressCode",
          "product_id": "${productType.value.id}",
          "financial_amount": "$financingAmount",
          "duration": "$term",
          "financial_purpose": financingPurpose.value.id != null
              ? '${financingPurpose.value.id}'
              : '${financingPurpose.value.display}',
          "intended_date_of_disbursement": "$intendedDate",
          "company_name": "$companyName",
          "company_address": "$address",
          "year_of_establishment": "$yearOfEstablishment",
          "type_of_organization": typeOfOrganization.value.id != null
              ? "${typeOfOrganization.value.id}"
              : "${typeOfOrganization.value.display}",
          "tax_identification_number": "$taxIdentificationNumber",
          "industry": industry.value.id != null
              ? "${industry.value.id}"
              : "${industry.value.display}",
          "number_of_staff": "$numberOfStaff",
          "owner_name": "$ownerName",
          "product_or_service": "$productSevice",
          "company_patent_doc": "${patentDocument.value}",
          "company_licence_doc": "${licenseDoc.value}",
          "company_MoC_certificate": "${certificatioDoc.value}",
          "company_MAA": "${memorandumDoc.value}",
          "income_statement": "$incomeStatement",
          "balance_sheet": "$balanceSheet",
          "cash_flow_statement": "$cashFlowStatement",
          "business_plan": "$businessPlan",
          "other_document": "$otherDocuments"
        },
      );
      http.StreamedResponse streamedResponse = await request.send();
      http.Response.fromStream(streamedResponse).then((response) {
        //08030205 080302 0803 08

        if (response.statusCode == 200) {
          context!.go("/get-funding/debt-investment");
          Future.delayed(const Duration(milliseconds: 985), () {
            fetchApplicationCard(page: 1);
          });
        } else {
          debugPrint('Stateus code========:${response.statusCode}');
          debugPrint("deb body failed:${response.body}");
          Get.snackbar(
              "",
              step != null
                  ? "Save debt investment has been failed"
                  : "Your debt investment application request has been submitted failed",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xffd9534f),
              colorText: Colors.white,
              icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Debt Investment',
                style: TextStyle(color: Colors.white),
              ),
              messageText: Text(
                step != null
                    ? "Save debt investment has been failed"
                    : "Your debt investment application request has been submitted failed",
                style: const TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } catch (e) {
      isLoadingSubmit(false);
    } finally {
      isLoadingSubmit(false);
    }
    isLoadingSubmit(false);
  }

  ///Update

  String? patentDocbase64Image;
  String? licencebase64Image;
  String? mocbase64Image;
  String? businessPlanbase64Image;
  String? incomeStatementbase64Image;
  String? balenceSheetbase64Image;
  String? cashFlowStatementbase64Image;
  String? otherDocbase64Image;

  Future<void> onEditDebtInvestment(
      {required BuildContext? context,
      required int? id,
      int? step,
      String? submitRequest,
      bool showDebtSnackbar = true,
      int? frompage}) async {
    token = await LocalData.getCurrentUser();
    String? url;
    if (step == 1 || step == 2 || step == 3 || step == 4) {
      debugPrint("Draft To Draft");
      url =
          '${GlobalConfiguration().get('api_base_urlv3')}debt-investment/$id?_method=PUT&draft=true&step=$step';
    } else {
      debugPrint("Draft To New");
      url =
          '${GlobalConfiguration().get('api_base_urlv3')}debt-investment/$id?_method=PUT&draft=true&final_step=true';
    }

    if (fullCurrentAddress.value.addressList != null) {
      if (fullCurrentAddress.value.addressList!.length == 3) {
        currentAddressCode.value =
            fullCurrentAddress.value.addressList![2].code!;
      } else {
        currentAddressCode.value =
            fullCurrentAddress.value.addressList![3].code!;
      }
    } else {
      if (_memberCon.personalProfile.value.currentAddress!.city!.code != '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.city!.code!;
      }
      if (_memberCon.personalProfile.value.currentAddress!.district!.code !=
          '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.district!.code!;
      }
      if (_memberCon.personalProfile.value.currentAddress!.commune!.code !=
          '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.commune!.code!;
      }
      if (_memberCon.personalProfile.value.currentAddress!.village!.code !=
          '') {
        currentAddressCode.value =
            _memberCon.personalProfile.value.currentAddress!.village!.code!;
      }
    }

    if (fullResidentAddress.value.addressList != null) {
      if (fullResidentAddress.value.addressList!.length == 3) {
        residentAddressCode.value =
            fullResidentAddress.value.addressList![2].code!;
      } else {
        residentAddressCode.value =
            fullResidentAddress.value.addressList![3].code!;
      }
    } else {
      if (_memberCon.personalProfile.value.permanentAddress!.city!.code != '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.city!.code!;
      }
      if (_memberCon.personalProfile.value.permanentAddress!.district!.code !=
          '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.district!.code!;
      }
      if (_memberCon.personalProfile.value.permanentAddress!.commune!.code !=
          '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.commune!.code!;
      }
      if (_memberCon.personalProfile.value.permanentAddress!.village!.code !=
          '') {
        residentAddressCode.value =
            _memberCon.personalProfile.value.permanentAddress!.village!.code!;
      }
    }

    debugPrint('Current Address Code: ${currentAddressCode.value}');
    debugPrint('Resident Address Code: ${currentAddressCode.value}');
    try {
      isLoadingSubmit(true);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      request.headers.addAll(headers);
      request.fields.addAll(
        {
          "customer_name": "$fullName",
          "customer_gender": "${gender.value.id}",
          "customer_date_of_birth": "$dateOfBirth",
          "customer_email": "$email",
          "phone_number": "$phoneNumber",
          "current_house_no": fullCurrentAddress.value.houseNo != null
              ? "${fullCurrentAddress.value.houseNo}"
              : "",
          "current_street_no": fullCurrentAddress.value.streetNo != null
              ? "${fullCurrentAddress.value.streetNo}"
              : "",
          "current_address": "$currentAddressCode",
          "residence_house_no": fullResidentAddress.value.houseNo != null
              ? "${fullResidentAddress.value.houseNo}"
              : "",
          "residence_street_no": fullResidentAddress.value.streetNo != null
              ? "${fullResidentAddress.value.streetNo}"
              : "",
          "residence_address": "$residentAddressCode",
          "product_id": "${productType.value.id}",
          "financial_amount": "$financingAmount",
          "financial_purpose": financingPurpose.value.id != null
              ? '${financingPurpose.value.id}'
              : '${financingPurpose.value.display}',
          "duration": "$term",
          "intended_date_of_disbursement": "$intendedDate",
          "company_name": "$companyName",
          "company_address": "$address",
          "year_of_establishment": "$yearOfEstablishment",
          "type_of_organization": typeOfOrganization.value.id != null
              ? "${typeOfOrganization.value.id}"
              : "${typeOfOrganization.value.display}",
          "tax_identification_number": "$taxIdentificationNumber",
          "industry": industry.value.id != null
              ? "${industry.value.id}"
              : "${industry.value.display}",
          "number_of_staff": "$numberOfStaff",
          "owner_name": "$ownerName",
          "product_or_service": "$productSevice",
          "company_patent_doc": "${patentDocument.value}",
          "company_licence_doc": "${licenseDoc.value}",
          "company_MoC_certificate": "${certificatioDoc.value}",
          "company_MAA": "${memorandumDoc.value}",
          "income_statement": "$incomeStatement",
          "balance_sheet": "$balanceSheet",
          "cash_flow_statement": "$cashFlowStatement",
          "business_plan": "$businessPlan",
          "other_document": "$otherDocuments"
        },
      );
      http.StreamedResponse streamedResponse = await request.send();
      http.Response.fromStream(streamedResponse).then((response) {
        if (response.statusCode == 200) {
          // showDebtSnackbar
          //     ? customSnackbar(
          //         context: context,
          //         color: Colors.green,
          //         imgUrl: 'assets/images/svgfile/successIcon.svg',
          //         label: step != 1 || step != 2 || step != 3 || step != 4
          //             ? "Your debt investment application request has been submitted"
          //             : "Your debt investment application request has been updated",
          //         titleText: "Debt Investment",
          //         messageText: step != 1 || step != 2 || step != 3 || step != 4
          //             ? "Your debt investment application request has been submitted"
          //             : "Your debt investment application request has been updated",
          //       )
          //     : null;

          isAgree.value = false;
          isAgree.refresh();
          context!.go("/get-funding/debt-investment");
          Future.delayed(const Duration(milliseconds: 985), () {
            fetchApplicationCard(page: 1);
          });
        } else {
          debugPrint("Financial amount:${financingAmount.value}");
          debugPrint("Updated failed:${response.body}");
          debugPrint("Updated failed code:${response.statusCode}");

          Get.snackbar(
              "", "Your debt investment application has been updated failed",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xffd9534f),
              colorText: Colors.white,
              icon: SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Debt Investment',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'Your debt investment application has been updated failed',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } catch (e) {
      isLoadingSubmit(false);
      debugPrint(e.toString());
    } finally {
      isLoadingSubmit(false);
    }
    isLoadingSubmit(false);
  }

  // Get application card data
  final isLoadingCard = false.obs;
  final isFetchMoreDebt = false.obs;
  final applicationCardData = ApplicationData().obs;
  final applicationCardList = <ApplicationData>[].obs;
  final applicationCardDraftList = <ApplicationData>[].obs;

  Future<List<ApplicationData>> fetchApplicationCard(
      {required int page}) async {
    final tokenKey = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}debt-investment?page=$page';
    try {
      if (page == 1) {
        isLoadingCard(true);
      } else {
        isFetchMoreDebt(true);
      }
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];
          if (page == 1) {
            applicationCardList.clear();
            applicationCardDraftList.clear();
          }

          responseJson.map((json) {
            applicationCardData.value = ApplicationData.fromJson(json);

            if (applicationCardData.value.status!.toLowerCase() == 'draft') {
              applicationCardDraftList.add(applicationCardData.value);
            } else {
              applicationCardList.add(applicationCardData.value);
            }
          }).toList();
        } else {
          debugPrint("status code ${response.statusCode}");
          isLoadingCard(false);
        }
      });
    } catch (e) {
      debugPrint("fetchApplicationCard Error :s ${e.toString()}");
    } finally {
      isLoadingCard(false);
      isFetchMoreDebt(false);
    }
    isLoadingCard(false);
    isFetchMoreDebt(false);

    return applicationCardList;
  }

  // Get DebtInvestment Data
  final applicationDetail = DebtEqityData().obs;
  Future<DebtEqityData> fetchAppDetails(int id) async {
    final token = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get("api_base_urlv3")}debt-investment/$id';
    isLoadingData(true);
    try {
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).then(
        (response) {
          if (response.statusCode == 200) {
            var responseJson = json.decode(response.body)["data"];

            applicationDetail.value = DebtEqityData.fromJson(responseJson);
          } else {
            debugPrint("###############${response.statusCode}");
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingData(false);
    }
    return applicationDetail.value;
  }

  final whenOnchangeDate = "".obs;
  onResetData() {
    whenOnchangeDate.value = "";
    //Personal Info
    fullName.value = '';
    dateOfBirth.value = '';
    gender.value = Optionmodel();
    email.value = '';
    phoneNumber.value = '';
    fullCurrentAddress.value = FullAddress();
    fullResidentAddress.value = FullAddress();
    //Financing Info
    productType.value = Option();
    financingAmount.value = 0.0;
    financingAmountcontroller.clear();
    termController.clear();
    financingPurpose.value = Optionmodel();
    intendedDate.value = '';
    term.value = 0;
    //Company Info

    addresscontroller = TextEditingController();
    productController = TextEditingController();
    yearofestablistmentController = TextEditingController();
    taxindentificationController = TextEditingController();
    numberofStaffController = TextEditingController();
    ownernameController = TextEditingController();

    companyIndex.value = '';
    companyName.value = '';
    address.value = '';
    yearOfEstablishment.value = '';
    typeOfOrganization.value = Optionmodel();
    taxIdentificationNumber.value = '';
    industry.value = Optionmodel();
    numberOfStaff.value = '';
    ownerName.value = '';
    productSevice.value = '';
    // patentDoc.value = [];
    // mocCertificate.value = [];
    //licenceDoc.value = [];
    businessPlan.value = 0;
    articleOfIncorporation.value = 0;
    incomeStatement.value = 0;
    balanceSheet.value = 0;
    cashFlowStatement.value = 0;
    otherDocuments.value = 0;

    patentDocument.value = 0;
    certificatioDoc.value = 0;
    licenseDoc.value = 0;
    memorandumDoc.value = 0;

    isPatentDoc.value = false;
    isCertificate.value = false;
    isLicense.value = false;
    isMemorandum.value = false;
    isValIncomeStatement.value = true;
    isValBalanceSheet.value = false;
  }

  /// Fetch Loan Option
  final isOptionLoanLoading = false.obs;
  final option = Option().obs;
  final optionList = <Option>[].obs;
  Future<List<Option>> fetchLoanOption() async {
    final token = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get("api_base_urlv3")}loan-product?option=1';
    isOptionLoanLoading(true);
    try {
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)["data"];
          optionList.clear();
          responseData.map((json) {
            option.value = Option.fromJson(json);
            optionList.add(option.value);
          }).toList();
        } else {
          debugPrint("################## ${response.statusCode}");
        }
      });
    } catch (e) {
      debugPrint("###############${e.toString()}");
    } finally {
      isOptionLoanLoading(false);
    }
    return optionList;
  }

  /// Fetch Option Data
  final optionData = OptionType().obs;
  final optionDataList = <OptionType>[].obs;
  final isOptionDataLoading = false.obs;
  Future<OptionType> fetchOptionData({int? id}) async {
    final token = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get("api_base_urlv3")}loan-product/$id';
    isOptionDataLoading(true);
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)["data"];
          optionData.value = OptionType.fromJson(responseData);
        } else {
          debugPrint("Fetch option data status code ${response.statusCode}");
        }
      });
    } catch (e) {
      debugPrint("###############${e.toString()}");
    } finally {
      isOptionDataLoading(false);
    }
    return optionData.value;
  }

////#function Delete Debt Investment
  final isDeleteDebt = false.obs;
  Future<void> onDeleteDebtInvestment(BuildContext context, int? id) async {
    isDeleteDebt(true);
    apiBaseHelper
        .onNetworkRequesting(
      url: 'debt-investment/$id',
      methode: METHODE.delete,
      isAuthorize: true,
    )
        .then((response) {
      customSnackbar(
        context: context,
        color: Colors.green,
        imgUrl: 'assets/images/svgfile/successIcon.svg',
        label: "Your application has been deleted",
        titleText: "Debt Investment",
        messageText: "Your debt investment application has been deleted",
      );
      Future.delayed(const Duration(seconds: 1), () {
        fetchApplicationCard(page: 1);
      });

      isDeleteDebt(false);
    }).onError((ErrorModel error, stackTrace) {
      isDeleteDebt(false);
      customSnackbar(
        context: context,
        color: Colors.red,
        imgUrl: 'assets/images/svgfile/successIcon.svg',
        label: "Your application has been deleted failed",
        titleText: "Debt Investment",
        messageText: "Your debt investment application has been deleted failed",
      );
    });
  }
}
