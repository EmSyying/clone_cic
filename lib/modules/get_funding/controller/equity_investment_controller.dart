import 'dart:convert';
import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/application_detail.dart';
import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/call_center.dart';
import 'package:cicgreenloan/modules/get_funding/models/equity_setting.dart';
import 'package:cicgreenloan/modules/get_funding/models/get_funding_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option_data.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/helper/custom_snackbar.dart';
import '../../../utils/helper/api_base_helper.dart';
import 'debt_investment_controller.dart';

class EquityInvestmentController extends GetxController {
  String? tokenKey;
  final apiBaseHelper = ApiBaseHelper();
  //============================= Step 1 =========================
  final isValidateFinancingAmount = true.obs;
  final isValidateIntendedDate = true.obs;
  final isValidateUseOfFund = true.obs;
  final isValidateProductType = true.obs;

  final productType = Optionmodel().obs;
  final financingAmoung = 0.obs;
  final intendedDate = ''.obs;
  final useOfFund = ''.obs;

  final isPatentDoc = false.obs;
  final isCertificate = false.obs;
  final isLicense = false.obs;
  final isMemorandum = false.obs;
  final patentDocument = 0.obs;
  final certificatioDoc = 0.obs;
  final licenseDoc = 0.obs;
  final memorandumDoc = 0.obs;

  TextEditingController financingAmountcontroller = TextEditingController();
  TextEditingController useOfFundcontroller = TextEditingController();
  //============================  Step 2 ============================
  final isValCompanyName = true.obs;
  final isValAddress = true.obs;
  final isValYearOfEstablishment = true.obs;
  final isValTypeOfOrganization = true.obs;
  final isValIndustry = true.obs;
  final isValNumberOfStaff = true.obs;
  final isValOwnerName = true.obs;
  final isValProductService = true.obs;

  TextEditingController addresscontroller = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController yearOfestabliscontroller = TextEditingController();
  TextEditingController taxcontroller = TextEditingController();
  TextEditingController numberofStaffcontroller = TextEditingController();
  TextEditingController ownerNamecontroller = TextEditingController();
  final addotherTypeofOrganization = "".obs;
  final addotherTypeofIndustry = "".obs;

  final companyIndex = ''.obs;
  final companyName = ''.obs;
  final address = ''.obs;
  final yearOfEstablishment = ''.obs;
  final typeOfOrganization = Optionmodel().obs;
  final taxIdentificationNumber = ''.obs;
  final industry = Optionmodel().obs;
  final industryList = <Optionmodel>[].obs;
  final typeOfOrganizationList = <Optionmodel>[].obs;
  final numberOfStaff = ''.obs;
  final ownerName = ''.obs;
  final productSevice = ''.obs;
  // final patentDoc = [].obs;
  // final mocCertificate = [].obs;
  // final licenceDoc = [].obs;

  //============================  Step 3 ============================

  final isValNumberOfShareHolders = true.obs;
  final isValNumberOfBoardMembers = true.obs;
  final isValincomeStatement = false.obs;
  final isValBanlanceSheet = false.obs;

  TextEditingController numberofSharecontroller = TextEditingController();
  TextEditingController numberofBoardcontroller = TextEditingController();
  final status = ''.obs;
  final equityId = 0.obs;
  final numberOfShareHolders = 0.obs;
  final numberOfBoardMembers = 0.obs;
  final haveTheConsenus = 0.obs;
  final purposeOfFund = 1.obs;
  // //===
  final areYouTheMajorityShareholder = 0.obs;
  final havefinancial = 0.obs;

  final businessPlan = 0.obs;
  final articleOfIncorporation = 0.obs;
  final incomeStatement = 0.obs;
  final balanceSheet = 0.obs;
  final cashFlowStatement = 0.obs;
  final marketStudy = 0.obs;
  final otherDocuments = 0.obs;

  //========================preview=========================

  final isAgree = false.obs;
  final isSubmitLoading = false.obs;
  final whenOnchangeDate = "".obs;
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

  resetData() {
    whenOnchangeDate.value = "";
    isValidateProductType.value = true;
    isValidateFinancingAmount.value = true;
    isValidateIntendedDate.value = true;
    isValidateUseOfFund.value = true;
    productType.value = Optionmodel();
    financingAmoung.value = 0;
    intendedDate.value = '';
    useOfFund.value = '';
    addresscontroller = TextEditingController();
    productController = TextEditingController();
    yearOfestabliscontroller = TextEditingController();
    taxcontroller = TextEditingController();
    numberofStaffcontroller = TextEditingController();
    ownerNamecontroller = TextEditingController();
    financingAmountcontroller = TextEditingController();
    useOfFundcontroller = TextEditingController();
    numberofSharecontroller = TextEditingController();
    numberofBoardcontroller = TextEditingController();
    isValCompanyName.value = true;
    isValAddress.value = true;
    isValYearOfEstablishment.value = true;
    isValTypeOfOrganization.value = true;
    isValIndustry.value = true;
    isValNumberOfStaff.value = true;
    isValOwnerName.value = true;
    isValProductService.value = true;
    companyIndex.value = '';
    companyName.value = '';
    address.value = '';
    yearOfEstablishment.value = '';
    typeOfOrganization.value = Optionmodel();
    taxIdentificationNumber.value = '';
    isValNumberOfShareHolders.value = true;
    isValNumberOfBoardMembers.value = true;
    isValincomeStatement.value = false;
    isValBanlanceSheet.value = false;
    industry.value = Optionmodel();
    numberOfStaff.value = '';
    ownerName.value = '';
    productSevice.value = '';
    patentDocument.value = 0;
    certificatioDoc.value = 0;
    licenseDoc.value = 0;
    memorandumDoc.value = 0;

    isPatentDoc.value = false;
    isCertificate.value = false;
    isMemorandum.value = false;
    isLicense.value = false;

    numberOfShareHolders.value = 0;
    numberOfBoardMembers.value = 0;
    haveTheConsenus.value = 0;
    purposeOfFund.value = 1;
    //===
    areYouTheMajorityShareholder.value = 0;
    havefinancial.value = 0;
    businessPlan.value = 0;
    articleOfIncorporation.value = 0;
    incomeStatement.value = 0;
    balanceSheet.value = 0;
    cashFlowStatement.value = 0;
    marketStudy.value = 0;
    otherDocuments.value = 0;
    isAgree.value = false;
  }

  final isLoadingSubmit = false.obs;
  final isLoadingData = false.obs;
  final equityInvestment = GetFundingModel().obs;
  final equityInvestmentLis = <GetFundingModel>[].obs;
  final applicationData = ApplicationDataDetail().obs;

  Future<ApplicationDataDetail> fetchAppDetails(int id) async {
    final token = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get("api_base_urlv3")}equity-investment/$id';
    isLoadingData(true);
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
          applicationData.value = ApplicationDataDetail();
          var responseJson = json.decode(response.body)["data"];
          applicationData.value = ApplicationDataDetail.fromJson(responseJson);
        } else {
          isLoadingData(false);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingData(false);
    }
    isLoadingData(false);
    return applicationData.value;
  }

  Future<String?> networkImageToBase64(String? imageUrl) async {
    http.Response response = await http.get(
      Uri.parse(imageUrl!),
    );
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }

  Future<void> onSubmitEquityInvestment({
    bool showSnackbar = true,
    String? type,
    int? frompage = 0,
    required BuildContext context,
  }) async {
    tokenKey = await LocalData.getCurrentUser();

    String url = type != null
        ? '${GlobalConfiguration().get('api_base_urlv3')}equity-investment?draft=true&step=$type'
        : '${GlobalConfiguration().get('api_base_urlv3')}equity-investment';
    try {
      isLoadingSubmit(true);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      };

      request.fields.addAll({
        "financial_amount": "$financingAmoung",
        "intended_date_of_disbursement": "$intendedDate",
        "use_of_fund": "$useOfFund",
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
        "number_of_shareholders": "$numberOfShareHolders",
        "number_of_board_members": "$numberOfBoardMembers",
        "is_company_raise_fund": "$haveTheConsenus",
        "raise_fund_use_for": "$purposeOfFund",
        "financial_project": "${havefinancial.value}",
        "is_majority_shareholder": "$areYouTheMajorityShareholder",
        "company_patent_doc": "${patentDocument.value}",
        "company_licence_doc": "${licenseDoc.value}",
        "company_MoC_certificate": "${certificatioDoc.value}",
        "company_MAA": "${memorandumDoc.value}",
        "business_plan": "$businessPlan",
        "article_of_incorporation": "$articleOfIncorporation",
        "income_statement": "${incomeStatement.value}",
        "balance_sheet": "${balanceSheet.value}",
        "cash_flow_statement": "${cashFlowStatement.value}",
        "market_study_docs": "$marketStudy",
        "other_document": "$otherDocuments"
      });
      request.headers.addAll(headers);

      http.StreamedResponse streamedResponse = await request.send();

      http.Response.fromStream(streamedResponse).then((response) {
        if (response.statusCode == 200) {
          debugPrint("incomestatement:${incomeStatement.value}");
          debugPrint("Balance sheet:${balanceSheet.value}");
          debugPrint("have financial:${havefinancial.value}");
          debugPrint("cash flow:${cashFlowStatement.value}");
          // if (type == null) {
          showSnackbar
              ? Get.snackbar("",
                  "Your equity investment application request has been submitted",
                  borderRadius: 8,
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  icon:
                      SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
                  snackPosition: SnackPosition.TOP,
                  margin: const EdgeInsets.all(10),
                  overlayBlur: 3.0,
                  titleText: const Text(
                    'Equity Investment',
                    style: TextStyle(color: Colors.white),
                  ),
                  messageText: const Text(
                    'Your equity investment application request has been submitted',
                    style: TextStyle(color: Colors.white),
                  ),
                  snackStyle: SnackStyle.FLOATING)
              : null;
          //  }
          Future.delayed(const Duration(seconds: 1), () {
            if (frompage == 0) {
              int nums;
              if (type != null) {
                if (type == "save") {
                  nums = 4;
                } else {
                  nums = int.parse(type);
                }
              } else {
                nums = 4;
              }
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= nums);
              Navigator.pushReplacementNamed(context, RouteName.GETFUNDING,
                  arguments: "equity_investment");
              // ignore: unnecessary_null_comparison
            } else if (frompage! > 2) {
              int nums = 4 - frompage.toInt();

              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= nums);
              Navigator.pushReplacementNamed(context, RouteName.GETFUNDING,
                  arguments: "equity_investment");
            } else {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, RouteName.GETFUNDING,
                  arguments: "equity_investment");
            }
          });
        } else {
          debugPrint('debug stateus=========${response.statusCode}');
          debugPrint('debug body========${response.body}');

          Get.snackbar(
              "", "Your equity investment application request has been failed",
              borderRadius: 8,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              icon: const Icon(Icons.close),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Equity Investment',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'Your equity investment application request has been failed',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingSubmit(false);
    }
    isLoadingSubmit(false);
  }

  String? patentDocbase64Image;
  String? balancebase64Image;
  String? mocbase64Image;
  String? licencebase64Image;
  String? articlebase64Iamge;
  String? incomebase64Image;
  String? businessbase64Image;
  String? cashflowbase64image;
  String? marketstudybase64Image;
  String? otherdocbase64Image;
  Future<void> onEditEquityInvestment(
      {required BuildContext context,
      required int id,
      String? submitRequest,
      int? frompage,
      bool showSnackbar = true,
      String? pagenumber}) async {
    tokenKey = await LocalData.getCurrentUser();
    String url = pagenumber != null
        ? pagenumber == "1" || pagenumber == "2" || pagenumber == "3"
            ? '${GlobalConfiguration().get('api_base_urlv3')}equity-investment/$id?_method=PUT&draft=true&step=$pagenumber'
            : '${GlobalConfiguration().get('api_base_urlv3')}equity-investment/$id?_method=PUT&draft=true&final_step=true'
        : '${GlobalConfiguration().get('api_base_urlv3')}equity-investment/$id?_method=PUT';
    try {
      isLoadingSubmit(true);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      };

      request.fields.addAll({
        "financial_amount": "$financingAmoung",
        "intended_date_of_disbursement": "$intendedDate",
        "use_of_fund": "$useOfFund",
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
        "number_of_shareholders": "$numberOfShareHolders",
        "number_of_board_members": "$numberOfBoardMembers",
        "is_company_raise_fund": "$haveTheConsenus",
        "raise_fund_use_for": "$purposeOfFund",
        "financial_project": "${havefinancial.value}",
        "is_majority_shareholder": "$areYouTheMajorityShareholder",
        "company_patent_doc": "${patentDocument.value}",
        "company_licence_doc": "${licenseDoc.value}",
        "company_MoC_certificate": "${certificatioDoc.value}",
        "company_MAA": "${memorandumDoc.value}",
        "business_plan": "$businessPlan",
        "article_of_incorporation": "$articleOfIncorporation",
        "income_statement": "${incomeStatement.value}",
        "balance_sheet": "${balanceSheet.value}",
        "cash_flow_statement": "${cashFlowStatement.value}",
        "market_study_docs": "$marketStudy",
        "other_document": "$otherDocuments"
      });
      request.headers.addAll(headers);

      http.StreamedResponse streamedResponse = await request.send();

      http.Response.fromStream(streamedResponse).then((response) {
        if (response.statusCode == 200) {
          debugPrint("Debug Url:$url");
          debugPrint("Updated to submit:$frompage");
          showSnackbar
              ? Get.snackbar(
                  "",
                  submitRequest == "submitted"
                      ? "Your equity investment application request has been submitted"
                      : "Your equity investment application request has been updated",
                  borderRadius: 8,
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  icon:
                      SvgPicture.asset('assets/images/svgfile/successIcon.svg'),
                  snackPosition: SnackPosition.TOP,
                  margin: const EdgeInsets.all(10),
                  overlayBlur: 3.0,
                  titleText: const Text(
                    'Equity Investment',
                    style: TextStyle(color: Colors.white),
                  ),
                  messageText: Text(
                    submitRequest == "submitted"
                        ? "Your equity investment application request has been submitted"
                        : "Your equity investment application request has been updated",
                    style: const TextStyle(color: Colors.white),
                  ),
                  snackStyle: SnackStyle.FLOATING)
              : null;
          // }
          Future.delayed(const Duration(seconds: 1), () {
            int? page;
            int? numb;
            if (frompage.toString() != pagenumber) {
              if (pagenumber == "update draft" || pagenumber == null) {
                if (pagenumber == null) {
                  page = 1;
                } else {
                  page = 5;
                }

                numb = page - frompage!;
              } else {
                page = int.parse(pagenumber);
                numb = page - frompage!;
                if (frompage == 1) numb = page;
                if (frompage == 2) numb = page - frompage + 1;
              }

              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= numb!);
              Navigator.pushReplacementNamed(context, RouteName.GETFUNDING,
                  arguments: "equity_investment");
              debugPrint("is wrok updated to new");
            } else {
              debugPrint("is wrok updated to new 111");
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, RouteName.GETFUNDING,
                  arguments: "equity_investment");
            }
          });
        } else {
          var responseJson =
              json.decode(response.body)['errors']['financial_amount'][0];

          debugPrint("====bank info:$responseJson");
          debugPrint("updated equity body:${response.body}");
          Get.snackbar(
              "", "Your equity investment application has been updated failed",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              icon: const Icon(Icons.close),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Equity Investment',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                "Your equity investment application has been updated failed",
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingSubmit(false);
    }
    isLoadingSubmit(false);
  }

  final equityApplication = ApplicationData().obs;
  final equityApplicationList = <ApplicationData>[].obs;
  final equityApplicationDraftList = <ApplicationData>[].obs;

  final equityApplicationReviewList = <ApplicationData>[].obs;

  final isequityLoading = false.obs;
  final isfetchequtydata = false.obs;

  Future<List<ApplicationData>> fetchOnEquityApplicationList(int page) async {
    final tokenKey = await LocalData.getCurrentUser();

    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}equity-investment?page=$page';
    try {
      if (page == 1) {
        isequityLoading(true);
      } else {
        isfetchequtydata(true);
      }
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];

          if (page == 1) {
            equityApplicationList.clear();
            equityApplicationDraftList.clear();
            //  equityApplicationRejectedtList.clear();
          }

          responseJson.map((json) {
            equityApplication.value = ApplicationData.fromJson(json);
            if (equityApplication.value.status!.toLowerCase() == "draft") {
              equityApplicationDraftList.add(equityApplication.value);
            } else {
              equityApplicationList.add(equityApplication.value);
            }

            // debugPrint("==Equity Card=====>${equityApplicationList[0].status}");
          }).toList();
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isequityLoading(false);
      isfetchequtydata(false);
    }
    return equityApplicationList;
  }

  ///function Reject&Cancelled EquityAndDebt investment====
  final equityRejectedModel = ApplicationData().obs;
  final equityApplicationRejectedtList = <ApplicationData>[].obs;
  final isLoadingStatus = false.obs;
  final debtCon = Get.put(DebtInvestmentController());
  Future<List<ApplicationData>> getEquityAndDebtRejectedAndCancelled(
    String? status,
  ) async {
    isLoadingStatus(true);
    String route = debtCon.tapcurrentIndex.value == 0
        ? 'equity-investment'
        : 'debt-investment';
    await apiBaseHelper
        .onNetworkRequesting(
            url: '$route?status=$status',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      equityApplicationRejectedtList.clear();
      response['data'].map((json) {
        debugPrint('History=====$response');
        equityRejectedModel.value = ApplicationData.fromJson(json);
        equityApplicationRejectedtList.add(equityRejectedModel.value);
      }).toList();

      isLoadingStatus(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(" not get ================>");
    });
    isLoadingStatus(false);

    return equityApplicationRejectedtList;
  }

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
        } else {}
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isOptionDataLoading(false);
    }
    return optionData.value;
  }

  final equitySetting = EquitySetting().obs;
  final isEquitySettingLoading = false.obs;
  Future<EquitySetting> fetchEquitySetting() async {
    isEquitySettingLoading.value = true;
    await apiBaseHelper
        .onNetworkRequesting(
            url: "setting/equity-setting",
            methode: METHODE.get,
            isAuthorize: true)
        .then((value) {
      var responseJson = value;
      debugPrint("equity Setting body:$responseJson");
      equitySetting.value = EquitySetting.fromJson(responseJson['data']);
      debugPrint("equity Setting:${equitySetting.value.minEquityAmount}");
      isEquitySettingLoading.value = false;
    }).onError((ErrorModel error, stackTrace) {
      isEquitySettingLoading.value = false;
      debugPrint("status Code:${error.statusCode}");
    });
    return equitySetting.value;
  }

  final callCenter = CallCenterModel().obs;
  final isCallCenter = false.obs;
  Future<CallCenterModel> fetchCallCenter({String? type}) async {
    isCallCenter.value = true;
    await apiBaseHelper
        .onNetworkRequesting(
            url: type != null
                ? "call-center?type=fixed_income_fund"
                : "call-center?type=get_funding",
            methode: METHODE.get,
            isAuthorize: true)
        .then((value) {
      var responseJson = value["data"];
      callCenter.value = CallCenterModel.fromJson(responseJson);

      isCallCenter.value = false;
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("status Code:${error.statusCode}");
    });
    return callCenter.value;
  }

  ////#function Delete Equity Investment
  final isDeleteEquity = false.obs;
  Future<void> onDeleteEquityInvestment(BuildContext context, int? id) async {
    isDeleteEquity(true);
    apiBaseHelper
        .onNetworkRequesting(
      url: 'equity-investment/$id',
      methode: METHODE.delete,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint('===Test Delete Equity Investment====');
      customSnackbar(
        context: context,
        color: Colors.green,
        imgUrl: 'assets/images/svgfile/successIcon.svg',
        label: "Your application has been deleted",
        titleText: "Debt Investment",
        messageText:
            "Your equity investment application request has been deleted",
      );
      Future.delayed(const Duration(seconds: 2), () {
        fetchOnEquityApplicationList(1);
      });

      isDeleteEquity(false);
    }).onError((ErrorModel error, stackTrace) {
      isDeleteEquity(false);
      customSnackbar(
        context: context,
        color: Colors.red,
        imgUrl: 'assets/images/svgfile/successIcon.svg',
        label: "Your application has been deleted failed",
        titleText: "Debt Investment",
        messageText: "Your equity investment application has been failed",
      );
      debugPrint("Status Code : ${error.statusCode}");
      debugPrint("Body : ${error.bodyString}");
    });
  }
}
