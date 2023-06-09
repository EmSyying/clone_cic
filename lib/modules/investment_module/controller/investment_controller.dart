import 'dart:convert';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';

import 'package:cicgreenloan/modules/investment_module/model/contract_history/contract_history.dart';
import 'package:cicgreenloan/modules/investment_module/model/fif_contract_option/fif_contract_option.dart';
import 'package:cicgreenloan/modules/investment_module/model/investment_amount/investment_data.dart';
import 'package:cicgreenloan/modules/investment_module/model/principal_history/principal_history.dart';
import 'package:cicgreenloan/modules/investment_module/model/renew_peroid_month/renew_period_month.dart';
import 'package:cicgreenloan/utils/function/format_date_time.dart';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/investment_module/model/my_investment.dart';
import 'package:cicgreenloan/modules/investment_module/model/price.dart';
import 'package:cicgreenloan/modules/investment_module/model/return_investment.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_balance_by_year.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_subcription_by_price.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_subscription_by_year.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Utils/helper/firebase_analytics.dart';
import '../../../Utils/helper/screen_agrument/member_screen_argument.dart';
import '../../../Utils/popupannouncement/popup_announcement.dart';
import '../../../configs/route_management/route_name.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../../../utils/helper/custom_snackbar.dart';
import '../../../utils/helper/custom_success_screen.dart';
import '../../../utils/helper/format_number.dart';
import '../../../widgets/investments/custom_principle_de_schedule_form.dart';
import '../../../widgets/notification/accept_notification_pop_up.dart';
import '../../event_module/models/event_detail_argument.dart';
import '../../member_directory/controllers/customer_controller.dart';
import '../../notification_modules/controllers/notification_controller.dart';
import '../../report_module/models/investor_certificate.dart';
import '../../ut_trading/models/detail_model.dart';
import '../model/data_payment/data_payment.dart';
import '../model/fif_application/fif_application.dart';
import '../model/fif_application/withdraw_notice/bank_type.dart';
import '../model/first_date/first_date.dart';
import '../model/view_agreement/view_agreement.dart';
import '../screen/bullet_payment_detail.dart';

class PriceController extends GetxController {
  final cicEquityScroll = ScrollController();
  final cicFixedIncomeScroll = ScrollController();

  final customCon = Get.put(CustomerController());
  final price = Price().obs;
  final isInvestLoading = false.obs;
  // final isLoading = false.obs;
  final inInterestTab = true.obs;
  final tokenKey = ''.obs;
  final sharePrice = SharePriceData().obs;
  final shareSubcriptionHistoriesData = ShareSubcriptionHistoriesData().obs;
  final shareSubscriptionByYearDataList = <ShareSubscriptionByYears>[].obs;
  final shareSubscriptionByPriceDataList = <ShareSubscriptionByPrices>[].obs;
  final shareSubscriptionTradeByYearDataList = <ShareBalanceByYears>[].obs;
  final investDataList = <InvestData>[].obs;
  final investData = InvestData().obs;
  late TabController tabController;
  final tapcurrentIndex = 0.obs;
  late DateTime day1;
  late DateTime day2;
  late DateTime day3;
  late DateTime day4;

  final principleList = <CustomPrincipleSchedule>[].obs;
  final isValidateAmount = true.obs;
  final isValidateDuration = true.obs;
  final isValidateinvestDate = true.obs;
  final isValidatePayDate = true.obs;
  final isValidateReceiveAcc = true.obs;
  final isValidateDeductionAmount = true.obs;
  final isSelectNewDate = false.obs;
  final textAmount = 0.0.obs;
  final textDuration = 0.obs;
  final deductionAmount = 0.0.obs;
  DateTime? displayFirstPaymentDate;
  final firstPaymentDays = "".obs;
  final newMaturityDate = "".obs;
  DateTime? textInvestDate;
  DateTime validatedwithdrawDateTime = DateTime.now();
  DateTime? firstPaymentDateIncrease = DateTime.now();
  // final textFirstPaymentDate = ''.obs;
  final textFirstPaymentDateTitle = ''.obs;
  final textReceivingAccount = ''.obs;
  final textReceivingAccountTitle = "".obs;
  final textReceivingAccountNew = "".obs;
  final textWithdrawAmount = 0.0.obs;
  final iswithdrawAmount = true.obs;
  DateTime? textdisbursementDate;
  final textdisbursementDateSubmit = "".obs;
  final validateTextAmount = ''.obs;
  final isdisbursementDate = true.obs;
  final textRenameTitle = ''.obs;
  final isRenameTitle = true.obs;
  final textSubmitCancel = ''.obs;
  // final isSelectCiC = 0.obs;
  final isSelect = 0.obs;
  final selected = ''.obs;
  final textRenewAmount = ''.obs;
  final textRenewPeriod = ''.obs;
  final isRenewAmount = true.obs;
  final isRenewPeriod = true.obs;
  final isCreateNewDate = "".obs;
  final textMaturityDate = 0.obs;
  final textminimumWithdraw = ''.obs;

  TextEditingController amountController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController deductionAmountController = TextEditingController();
  onDefaulValidate() {
    isvalidateMethod.value = true;
    isValidateAmount.value = true;
    isValidateDuration.value = true;
    isValidateinvestDate.value = true;
    isValidatePayDate.value = true;
    isValidateReceiveAcc.value = true;
    isValidateDeductionAmount.value = true;
  }

  onClearFIF() {
    productCodeType.value = "";
    isvalidateMethod(true);
    initialMethod.value = "";
    deductionAmountController.text = "";
    deductionAmount.value = 0;
    durationController.text = "";
    amountController.text = "";
    displayFirstPaymentDate = DateTime.now();
    newMaturityDate.value = "";
    firstPaymentDays.value = "";
    fiFApplicationDetailPending.value = FiFApplicationDetailModel();
    textReceivingAccountTitle.value = "";
    textAmount.value = 0;
    textDuration.value = 0;
    textInvestDate = null;
    // textFirstPaymentDate.value = '';
    textReceivingAccount.value = '';
    textWithdrawAmount.value = 0;
    textdisbursementDate = null;
    textRenewAmount.value = '';
    textRenewPeriod.value = '';
    textFirstPaymentDateTitle.value = '';
    isValidateDeductionAmount.value = true;
    isValidateAmount.value = true;
    isValidateDuration.value = true;
    isValidateinvestDate.value = true;
    isValidatePayDate.value = true;
    isValidateReceiveAcc.value = true;
    update();
  }

  clearDeducSelection() {
    productCode.value = "";
    productNameType.value = "";
    annuallyInterestRate.value = "";
  }

  final isLoadingPrice = false.obs;
  Future<Price> onFetchPrice() async {
    isLoadingPrice(true);

    await apiBaseHelper
        .onNetworkRequesting(
      url: 'price',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response["data"];
      price.value = Price.fromJson(responseJson);
      isLoadingPrice(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      isLoadingPrice(false);
    });
    return price.value;
  }

  final isLoadingSharePrice = false.obs;
  Future<SharePriceData> getSharePrice() async {
    isLoadingSharePrice(true);
    tokenKey.value = await getCurrentLang();
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}dashboard';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${tokenKey.value}'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          sharePrice.value = SharePriceData.fromJson(responseJson);
        }
      });
    } finally {
      isLoadingSharePrice(false);
    }
    return sharePrice.value;
  }

  Future<List<InvestData>> fetchOnReturnInvestment() async {
    isInvestLoading(true);
    final tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}return-on-investment';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          investDataList.clear();

          responseJson.map((json) {
            investData.value = InvestData.fromJson(json);

            investDataList.add(investData.value);
          }).toList();
        } else {}
      });
    } catch (e) {
      //
    } finally {
      isInvestLoading(false);
    }

    return investDataList;
  }

  Future<String> getCurrentLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('current_user');
    tokenKey.value = token!;
    return tokenKey.value;
  }

  final isSharePriceHistories = false.obs;
  Future<ShareSubcriptionHistoriesData> getShareSubHistories() async {
    isSharePriceHistories(true);
    tokenKey.value = await getCurrentLang();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}investment-equity-fund';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${tokenKey.value}'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          shareSubcriptionHistoriesData.value =
              ShareSubcriptionHistoriesData.fromJson(responseJson);
          shareSubscriptionByYearDataList.value =
              shareSubcriptionHistoriesData.value.shareSubscriptionByYears!;
          shareSubscriptionByPriceDataList.value =
              shareSubcriptionHistoriesData.value.shareSubscriptionByPrices!;
          shareSubscriptionTradeByYearDataList.value =
              shareSubcriptionHistoriesData
                  .value.shareSubscriptionBalanceByYear!;
        }
      });
    } finally {
      isSharePriceHistories(false);
    }
    return shareSubcriptionHistoriesData.value;
  }

  ///
  final productNameType = "".obs;
  final annuallyInterestRate = "".obs;
  final productCode = "".obs;
  final productCodeType = "".obs;
  final medthodproductCode = "".obs;

  final deductionFormList =
      <DeductScheduleFormModel>[DeductScheduleFormModel()].obs;

  validateDeductionForm(BuildContext context, {int? id}) {
    // context.router.push(FIFOption1Router());

    update();
  }

  List<String> durationList = ["1", "2"].obs;

  List<PaymentDate> receivingList = [
    PaymentDate(title: 'CiC MM Account', date: '2 Jan 2022'),
    PaymentDate(title: 'ABA Bank', date: '3 Jan 2022'),
    PaymentDate(title: 'Acleda Bank', date: '4 Jan 2022'),
  ].obs;

  ///Total investment
  final totalInvestmentbutton = false.obs;
  final showInvestmentbutton = false.obs;
  List<PaymentDate> paymentCardList = [
    PaymentDate(
        title: 'CiC MM Account',
        date: 'Pay securly with CiC MM Account',
        image: 'assets/images/svgfile/cicAcc.png'),
    PaymentDate(
        title: 'ABA Pay',
        date: 'Tap to pay with ABA Mobile',
        image: 'assets/images/banks/aba_bank1.png'),
  ];

  final isLoadingPostFiF = false.obs;
  final apiBaseHelper = ApiBaseHelper();

  ///onRefresh CiC Fixed Income Fund
  Future<void> onRefreshFIF() async {
    totalInvestmentbutton(false); //make button always close
    await getAllChartList();
    await fetchInvestmentAccount();
    await fetchFIFConfirm();
    await getHiddentContract();
    await getFIFApplication();
    await fetchFIFPending();
  }

  ///Function Show/Hide Confirm List
  Future onShowHideInvestmentAccount({
    num? id,
    bool? hide,
  }) async {
    String type = '';
    hide! ? type = 'hide' : type = 'show';
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'fif-account-hide-show',
      body: {"id": id, "type": type},
      methode: METHODE.post,
      isAuthorize: true,
    )
        .then((value) {
      onRefreshFIF();
      update();
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      debugPrint('onShowHide Error : ${error.statusCode}');
    });
  }

  ///FIF Application product
  final minimum = 0.0.obs;
  final maximum = 0.0.obs;
  final validateMessage = ''.obs;
  final defaultValue = 0.obs;
  final durationMin = 0.obs;
  final durationMax = 0.obs;
  final durationDefaul = 0.obs;
  final durationMessage = ''.obs;
  final fifProductTypeList = <FIFoptionModel>[].obs;
  final fifProductType = FIFoptionModel().obs;

  final fifProductTypeValidate = FIFoptionModel().obs;

  ///
  final selectedProIndex = 0.obs;
  final isvalidateMethod = true.obs;
  final initialMethod = "".obs;
  final initialMethodProductCode = "".obs;
  final initailMethodName = ''.obs;

  final fifOptionLoading = true.obs;
  Future<List<FIFoptionModel>> getfifOption() async {
    fifOptionLoading.value = true;
    await apiBaseHelper
        .onNetworkRequesting(
      url: "fif-product",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then(
      (value) {
        var responeJson = value['data'];
        debugPrint("Response Json: $responeJson");
        fifProductTypeList.clear();

        responeJson.map((json) {
          fifProductType.value = FIFoptionModel.fromJson(json);
          fifProductTypeList.add(
            fifProductType.value,
          );
        }).toList();

        fifOptionLoading.value = false;
      },
    ).onError(
      (ErrorModel error, stackTrace) {
        FirebaseCrashlytics.instance.log(
            "${error.bodyString.toString()} ${error.statusCode.toString()}");
        debugPrint("Error ====> ${error.statusCode}");
      },
    );
    return fifProductTypeList;
  }

  Future<FIFoptionModel> fetchFiFProductType({int? id}) async {
    fifOptionLoading.value = true;
    debugPrint("Product ID:$id");
    await apiBaseHelper
        .onNetworkRequesting(
      url: "fif-product/$id",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then(
      (value) {
        debugPrint('fetchFiFProductType Response : $value');
        var responeJson = value['data'];

        fifProductTypeValidate.value = FIFoptionModel.fromJson(responeJson);

        maximum.value =
            fifProductTypeValidate.value.investmentMaximum!.toDouble();
        minimum.value =
            fifProductTypeValidate.value.investmentMinimum!.toDouble();
        defaultValue.value =
            fifProductTypeValidate.value.investmentDefault!.toInt();
        validateMessage.value = fifProductTypeValidate.value.investmentMessage!;
        durationMin.value =
            fifProductTypeValidate.value.durationMinimum!.toInt();
        durationMax.value =
            fifProductTypeValidate.value.durationMaximum!.toInt();
        durationMessage.value = fifProductTypeValidate.value.durationMessage!;
        durationDefaul.value =
            fifProductTypeValidate.value.durationDefault!.toInt();

        fifOptionLoading.value = false;
      },
    ).onError(
      (ErrorModel error, stackTrace) {
        FirebaseCrashlytics.instance.log(
            "${error.bodyString.toString()} ${error.statusCode.toString()}");
        debugPrint("Error ====> ${error.statusCode}");
      },
    );
    return fifProductTypeValidate.value;
  }

  ///hidden contract
  final hiddenContractList = <FIFApplicationListModel>[].obs;

  final getHiddentContractLoading = false.obs;
  Future<List<FIFApplicationListModel>> getHiddentContract() async {
    debugPrint('Hidden Work');
    getHiddentContractLoading(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-account?hide=1', methode: METHODE.get, isAuthorize: true)
        .then((response) {
      debugPrint('work $response');
      hiddenContractList.clear();
      response['data'].map((v) {
        hiddenContractList.add(FIFApplicationListModel.fromJson(v));
      }).toList();
      getHiddentContractLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      getHiddentContractLoading(false);
      debugPrint('Error ${error.statusCode}');
    });
    debugPrint('Hidden List = $hiddenContractList');
    return hiddenContractList;
  }

  ///Get fif Application type account
  final fifAppModel = FIFApplicationListModel().obs;
  final fifApplicationList = <FIFApplicationListModel>[].obs;
  final fifChartList = <FIFApplicationListModel>[].obs;

  final fifApplicationLoading = true.obs;
  Future<List<FIFApplicationListModel>> getFIFApplication() async {
    fifApplicationLoading.value = true;
    try {
      await apiBaseHelper
          .onNetworkRequesting(
              url: "fif-account?hide=0",
              methode: METHODE.get,
              isAuthorize: true)
          .then((value) {
        // fifApplicationLoading.value = false;
        var responseJson = value;
        fifApplicationList.clear();
        responseJson["data"].map((e) {
          fifApplicationList.add(FIFApplicationListModel.fromJson(e));
        }).toList();

        fifApplicationLoading.value = false;
      }).onError((ErrorModel error, stackTrace) {
        fifApplicationLoading.value = false;
        FirebaseCrashlytics.instance.log(
            "${error.bodyString.toString()} ${error.statusCode.toString()}");
      });
    } catch (e) {
      fifApplicationLoading.value = false;
    }
    return fifApplicationList;
  }

  ///get ChartList
  Future getAllChartList() async {
    try {
      await apiBaseHelper
          .onNetworkRequesting(
              url: "fif-account", methode: METHODE.get, isAuthorize: true)
          .then((value) {
        var responseJson = value;

        fifChartList.clear();
        responseJson["data"].map((e) {
          debugPrint('work');
          fifChartList.add(FIFApplicationListModel.fromJson(e));
        }).toList();
      }).onError((ErrorModel error, stackTrace) {
        FirebaseCrashlytics.instance.log(
            "${error.bodyString.toString()} ${error.statusCode.toString()}");
      });
    } catch (e) {
      debugPrint('Chart Fuction Error $e');
    }
    return fifChartList;
  }

  //fetch data on type pending
  final fifAppPendingModel = FIFApplicationListModel().obs;
  final fifAppPendingList = <FIFApplicationListModel>[].obs;
  final isLoadingPending = false.obs;
  Future<List<FIFApplicationListModel>> fetchFIFPending() async {
    isLoadingPending(true);

    await apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-application?type=pending',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responsJson = response['data'];
      fifAppPendingList.clear();
      responsJson.map((e) {
        fifAppPendingList.add(FIFApplicationListModel.fromJson(e));

        update();
      }).toList();

      isLoadingPending(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      isLoadingPending(false);
    });
    return fifAppPendingList;
  }

  final certificate = InvestorCertificate().obs;
  final isCertificate = false.obs;
  Future<InvestorCertificate> fetchCertificate() async {
    isCertificate(true);
    final tokenKey = await LocalData.getCurrentUser();
    try {
      final String url =
          '${FlavorConfig.instance.values!.apiBaseUrl}customer/certificate/download';
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenKey'
        },
      ).then((response) {
        if (response.statusCode == 200) {
          debugPrint("Pdf1");
          // debugPrint("PDF File:${response.body}}");
          var responseJson = json.decode(response.body);
          certificate.value = InvestorCertificate.fromJson(responseJson);
        } else {
          debugPrint("Certificate:${response.statusCode}}");
        }
      });
    } finally {
      isCertificate(false);
    }
    return certificate.value;
  }

  final agreementList = <ViewAgreement>[].obs;
  final isViewAgreement = false.obs;

  Future<List<ViewAgreement>> onViewAgreement(num? id) async {
    isViewAgreement(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-view-contract/$id',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responseJson = response["view_contract"];
      debugPrint("View Agreement:$responseJson");
      agreementList.clear();
      responseJson.map((e) {
        agreementList.add(ViewAgreement.fromJson(e));
      }).toList();
      isViewAgreement(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      debugPrint("Error: ${error.bodyString}");
      isViewAgreement(false);
    });
    return agreementList;
  }

  //fetch pending detail
  final fiFApplicationDetailPending = FiFApplicationDetailModel().obs;
  final isLoadingPendingDetail = false.obs;
  final bankType = BankType().obs;
  Future<FiFApplicationDetailModel> fetchFIFPendingDetail(num? id) async {
    debugPrint('fetchFIFPendingDetail ID: $id');
    debugPrint(
        'fetchFIFPendingDetail ID2: ${fiFApplicationDetailPending.value.productId}');
    onDefaulValidate();
    isLoadingPendingDetail(true);

    apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-application/$id?type=pending',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responseJson = response['data'];

      fiFApplicationDetailPending.value =
          FiFApplicationDetailModel.fromJson(responseJson);
      initialMethodProductCode.value =
          fiFApplicationDetailPending.value.subproductCode!;
      initailMethodName.value =
          fiFApplicationDetailPending.value.subproductName!;
      var displayinvestmentAmount = FormatNumber.formatNumberDefualt(
          fiFApplicationDetailPending.value.originalAmount!);
      amountController.text =
          fiFApplicationDetailPending.value.originalAmount! == 0
              ? ""
              : displayinvestmentAmount.toString();
      var displaydeductionAmount = FormatNumber.formatNumberDefualt(
          fiFApplicationDetailPending.value.deductionAmount!);
      deductionAmountController.text =
          fiFApplicationDetailPending.value.deductionAmount! == 0
              ? ""
              : displaydeductionAmount.toString();

      durationController.text =
          fiFApplicationDetailPending.value.originalDuration.toString();
      accounName.value = fiFApplicationDetailPending.value.accountName ?? "";
      textAmount.value =
          fiFApplicationDetailPending.value.originalAmount!.toDouble();
      textReceivingAccountTitle.value =
          fiFApplicationDetailPending.value.bankType!.bankName ?? "";
      textReceivingAccount.value =
          fiFApplicationDetailPending.value.returnPaymenMethod!;
      bankId.value = fiFApplicationDetailPending.value.bankType!.id!;
      bankType.value = fiFApplicationDetailPending.value.bankType!;
      mmaAccountId.value =
          fiFApplicationDetailPending.value.mmaAccountid!.toInt();
      textDuration.value =
          fiFApplicationDetailPending.value.originalDuration!.toInt();
      deductionAmount.value =
          fiFApplicationDetailPending.value.deductionAmount!.toDouble();
      textInvestDate =
          DateTime.parse(fiFApplicationDetailPending.value.investmentDate!);

      firstPaymentDateIncrease = DateTime(textInvestDate!.year,
          textInvestDate!.month, textInvestDate!.day + 30);
      productId.value = fiFApplicationDetailPending.value.productId!;
      if (fiFApplicationDetailPending.value.subproductCode != "") {
        productCode.value = fiFApplicationDetailPending.value.subproductCode!;
        productNameType.value =
            fiFApplicationDetailPending.value.subproductName!;
      } else {
        productCode.value = fiFApplicationDetailPending.value.productCode!;
        productNameType.value = fiFApplicationDetailPending.value.productName!;
      }
      productCodeType.value = fiFApplicationDetailPending.value.productCode!;
      annuallyInterestRate.value =
          fiFApplicationDetailPending.value.annuallyInterestRate!;

      fetchFiFProductType(id: fiFApplicationDetailPending.value.productId);
      debugPrint(
          "ProductID from Detail:${fiFApplicationDetailPending.value.productId}");
      textAmount.refresh();

      isLoadingPendingDetail(false);
      update();
    }).onError((ErrorModel errorModel, stackTrace) {
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
    });
    return fiFApplicationDetailPending.value;
  }

  //fetch rename title

  final isLoadingRenametitle = false.obs;
  Future<void> onRenameTitle({num? id, String? fifAccount}) async {
    debugPrint("fif Acount:$fifAccount");
    isLoadingRenametitle(true);

    await apiBaseHelper.onNetworkRequesting(
        url: 'fif-account/$id?rename=true',
        methode: METHODE.update,
        isAuthorize: true,
        body: {"account_name": textRenameTitle.value}).then((response) {
      customRouterSnackbar(
        title: 'Updated FIF Application',
        description: 'Your FIF Application was Updated',
      );
      getFIFApplication();
      fetchFIFPending();

      update();
      isLoadingRenametitle(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      customRouterSnackbar(
          title: 'Updated FIF Application',
          description: 'Your FIF Application was Updated Failed...!',
          type: SnackType.error);

      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
    });
  }

  final productId = 0.obs;
  final duration = 0.obs;
  final investAmount = 0.obs;
  final investmentDate = ''.obs;
  final firstPaymentDate = ''.obs;
  final interestReceivingAccountType = ''.obs;
  final bankId = 0.obs;
  final mmaAccountId = 0.obs;

  final isCreateBank = false.obs;
  final accountName = "".obs;
  final bankinfoId = 0.obs;
  final isFromWallet = false.obs;
  final settingCon = Get.put(SettingController());
  Future<void> onCreateFiF(
      {num? id, required BuildContext? buildcontext}) async {
    debugPrint("ReceivingAccount.value:${textReceivingAccount.value}");

    isLoadingPostFiF(true);

    await apiBaseHelper.onNetworkRequesting(
        url: id != null ? 'fif-application/$id' : 'fif-application',
        methode: id != null ? METHODE.update : METHODE.post,
        isAuthorize: true,
        body: {
          "account_name": id != null ? accounName.value : '',
          "product_id": fiFApplicationDetailPending.value.productId,
          "duration": textDuration.value,
          "invest_amount": textAmount.value,
          "deduction_amount": deductionAmount.value,
          "investment_date":
              FormatDate.investmentDateDropDown(textInvestDate.toString()),
          "interest_receiving_account_type": textReceivingAccount.value,
          "bank_id": bankId.value,
          "mma_account_id": mmaAccountId.value,
        }).then((response) {
      debugPrint("This funtion is work 2:$response");
      if (response['success'] != null && response['success']) {
        Future.delayed(
          const Duration(milliseconds: 850),
          () {
            buildcontext!.pushNamed(
              'SuccessScreen',
              queryParams: {
                'title': 'Success',
                'description':
                    'Your FIF application is submitted successfully.',
                'appbarTitle': '',
              },
              extra: {
                'onPressedButton': () {
                  onClearFIF();
                  clearDeducSelection();
                  settingCon.isHideBottomNavigation.value = false;
                  settingCon.update();
                  settingCon.isHideBottomNavigation.refresh();
                  debugPrint("isHideBottomNavigation");
                  buildcontext.go('/wallet/invest-fif/cic-fixed-income');
                  if (isFromWallet.value == true) {
                  } else {
                    buildcontext.go('/investment/cic-fixed-income');
                  }
                },
              },
            );
            // Navigator.of(buildcontext!, rootNavigator: true).push(
            //   MaterialPageRoute(
            //     fullscreenDialog: true,
            //     builder: (context) => CustomSucessScreen(
            //       title: 'Success',
            //       description:
            //           'Your FIF application is submitted successfully.',
            //       buttonTitle: 'Done',
            //       onPressedButton: () {
            // onClearFIF();
            // clearDeducSelection();
            // if (isFromWallet.value == true) {
            //   context.go('/wallet/invest-fif/cic-fixed-income');
            // } else {
            //   context.go('/investment/cic-fixed-income');
            // }
            //       },
            //     ),
            //   ),
            // );
            getFIFApplication();
            fetchFIFPending();
          },
        );
      }

      // context!.navigateTo(
      //   CustomSucessScreenRouter(
      //     title: 'Success',
      //     description: 'Your FIF application is submitted successfully. ',
      //     buttonTitle: 'Done',
      //     onPressedButton: () {
      //       onClearFIF();
      //       clearDeducSelection();
      //       context.navigateTo(
      //         const MyInvestmentRouter(),
      //       );
      //       Future.delayed(const Duration(seconds: 1), () {
      //         getFIFApplication();
      //         fetchFIFPending();
      //       });
      //     },
      //   ),
      // );

      isLoadingPostFiF(false);
      update();
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("This funtion is work 3: ${error.statusCode}");
      debugPrint("FiF Submited failed : ${error.bodyString}");
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
    });
  }

  final isLoadingPayment = false.obs;
  final id = 0.obs;
  final type = ''.obs;
  final productName = ''.obs;
  final accounName = ''.obs;
  final accountNumber = ''.obs;
  final image = ''.obs;
  final paymentModel = PaymentData().obs;
  final paymentDataList = <PaymentData>[].obs;
  final isNewBank = false.obs;

  Future<List<PaymentData>> fetchPayment() async {
    isNewBank.refresh();
    isLoadingPayment(true);

    await apiBaseHelper
        .onNetworkRequesting(
      url: 'fif-return-payment-method',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response["data"];

      paymentDataList.clear();
      responseJson.map((e) {
        paymentDataList.add(PaymentData.fromJson(e));

        if (isNewBank.value == false) {
          textReceivingAccount.value = paymentDataList.last.type!;
          textReceivingAccountTitle.value = paymentDataList.last.bankName!;
          update();
        }
      }).toList();

      isLoadingPayment(false);
      update();
    }).onError((ErrorModel error, stackTrace) {
      isLoadingPayment(false);
      debugPrint("Status Code : ${error.statusCode}");
      debugPrint("Body : ${error.bodyString}");
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
    });

    return paymentDataList;
  }

  //fuction delete fif card
  final isLoadingDelete = false.obs;
  final reasonDescription = "".obs;
  Future<void> onCanceled(num? id, BuildContext? context) async {
    isLoadingDelete(true);

    await apiBaseHelper.onNetworkRequesting(
        url: 'fif-application/cancel/$id',
        methode: METHODE.post,
        isAuthorize: true,
        body: {"reason": reasonDescription.value}).then((response) {
      customSnackbar(
          context: context,
          color: Colors.green,
          imgUrl: 'assets/images/svgfile/successIcon.svg',
          titleText: "Your FIF Application was cancel.",
          messageText: "",
          label: "");

      Future.delayed(const Duration(seconds: 1), () {
        getFIFApplication();
        fetchFIFPending();
      });

      update();
      isLoadingDelete(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      debugPrint(
          "ON Cancel Error:${error.bodyString} Status Code:${error.statusCode}");
    });
  }

  // Validate Pricipal Deduction
  final investmentDurationMessage = "".obs;

  final minDeductionAmount = 0.0.obs;
  final maxDeductionAmount = 0.0.obs;
  final validateFIFLoading = false.obs;

  Future<void> validateFIF() async {
    debugPrint('Function Work');
    validateFIFLoading(true);
    await apiBaseHelper.onNetworkRequesting(
        url: 'validate/principal-deduction',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "invest_amount": textAmount.value,
          "duration": textDuration.value,
        }).then((response) {
      if (response != null) {
        minDeductionAmount.value = response['min_deduction_amount'].toDouble();
        maxDeductionAmount.value = response['max_deduction_amount'].toDouble();
      }
      validateFIFLoading(false);
      debugPrint("Changed $response");
    }).onError((ErrorModel error, stackTrace) {
      validateFIFLoading(false);
      debugPrint("Changed Error$error");
    });
  }

  /*Future<void> onValidatePrincipalDeduction(bool requestOnDuration) async {
    debugPrint("Product Code Dedction:${productCode.value}");

    isLoadingDelete(true);
    debugPrint(
        "Dedection Validate is working:Text Duration: ${textAmount.value}");
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'validate/principal-deduction',
            methode: METHODE.post,
            isAuthorize: true,
            body: requestOnDuration == true
                ? {
                    "invest_amount": textAmount.value,
                    "product_code": productCode.value,
                    "on": "duration",
                    "duration": textDuration.value,
                    "deduction_amount": "",
                  }
                : {
                    "invest_amount": textAmount.value,
                    "product_code": productCode.value,
                    "on": "deduction_amount",
                    "deduction_amount": deductionAmount.value,
                    "duration": textDuration.value
                  })
        .then((response) {
      debugPrint('Response = $response');
      if (requestOnDuration == true) {
        isValidateDuration.value = true;
      } else {
        isValidateDeductionAmount.value = true;
      }

      update();
      isLoadingDelete(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint('Response = error ${error.bodyString}');
      debugPrint("On Validateion working22::isTypeon:$requestOnDuration");

      if (requestOnDuration == true) {
        var investDurationMessageJson = error.bodyString['msg_duration'];
        debugPrint("Message on Validate22:$investDurationMessageJson");

        isValidateDuration.value = false;
        investmentDurationMessage.value = investDurationMessageJson;
      } else {
        var deductDurationMessageJson =
            error.bodyString['msg_deduction_amount'];
        debugPrint("is deduciton Duration:$deductDurationMessageJson");

        isValidateDeductionAmount.value = false;

        principalDeductionMessage.value = deductDurationMessageJson;
      }
    });
  }*/
//auto renewal
  final isLoadingAutoRenew = false.obs;
  Future<void> onAutoRenew(num? id, String? autoRenew) async {
    isLoadingAutoRenew(true);
    await apiBaseHelper.onNetworkRequesting(
        methode: METHODE.post,
        isAuthorize: true,
        url: 'fif/change/auto-renewal',
        body: {
          "fif_id": id,
          "auto_renewal": autoRenew,
        }).then((res) {
      debugPrint('res=====:$res');
      fetchFIFAccountDetail(id);
      isLoadingAutoRenew(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint('res=====---:${error.bodyString}');
      isLoadingAutoRenew(false);
    });
  }

  //  Submit Preview renew
  final investmentId = 0.obs;
  final isPreviewLoading = false.obs;
  Future<void> onPreviewRenewSubmit(
      {@required BuildContext? context, @required num? id}) async {
    isPreviewLoading(true);

    apiBaseHelper.onNetworkRequesting(
        url: 'fif/preview/amendment?type=renew',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "investment_id": investmentId.value,
          "renew_period": textRenewPeriod.value,
        }).then((response) {
      var newmaturityDateJson = response['mew_maturity_date'];
      newMaturityDate.value = newmaturityDateJson;

      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return BulletPaymentDetail(
              id: id,
              fromPage: 'from renewal',
              annually: fifAccountDetailModel.value.annuallyInterestRate,
              productName: fifAccountDetailModel.value.productName,
              titles: 'Renewal Summary',
              investAmount:
                  fifAccountDetailModel.value.originalCurrentPrincipal,
              isRenewal: true,
              renewBy: fifAccountDetailModel.value.investorName,
              renewDate:
                  FormatDate.investmentDateDisplay(DateTime.now().toString()),
              renewPeriod: textRenewPeriod.value,
              oldDate: FormatDate.investmentDateDisplay(
                  fifAccountDetailModel.value.maturityDate!),
              newDate: newMaturityDate.value,
              oncallBack: () async {
                FirebaseAnalyticsHelper.sendAnalyticsEvent(
                    'submit renew contract');

                await onPostRenew(investmentId.value, context);
              },
            );
          },
        ),
      );
      isPreviewLoading(false);
      debugPrint("Perview Renew:$newMaturityDate");
      update();
      isPreviewLoading(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isPreviewLoading(false);
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      debugPrint("something error:${errorModel.statusCode}");
    });
  }

  // Submit Preview Width
  final isPreviewWidthdrawLoading = false.obs;
  Future<void> onPreviewWidthdrawSubmit(BuildContext? context) async {
    debugPrint("Investment id:${investmentId.value}");
    debugPrint("Renew peroid:${textRenewPeriod.value}");
    isPreviewWidthdrawLoading(true);

    await apiBaseHelper.onNetworkRequesting(
        url: 'fif/preview/amendment?type=withdraw',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "investment_id": investmentId.value,
          "withdraw_amount": textWithdrawAmount.value,
          "disbursement_date": textdisbursementDate.toString(),
        }).then((response) {
      var disbursmentDateJson = response['disbursement_date'];
      var withdrawAmountJson = response['withdraw_amount'];
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return BulletPaymentDetail(
              fromPage: 'widthdraw',
              productName: fifAccountDetailModel.value.productName,
              titles: 'Withdraw Summary',
              investAmount:
                  fifAccountDetailModel.value.originalCurrentPrincipal,
              isWithdraw: true,
              withdrawer: fifAccountDetailModel.value.investorName,
              withdrawAmount: withdrawAmountJson,
              noticeDate: FormatDate.investmentDateDisplay(
                  FormatDate.today().toString()),
              disbursementDate: disbursmentDateJson,
              contractStatus: textWithdrawAmount.value ==
                      fifAccountDetailModel.value.originalAmount!.toInt()
                  ? 'Passive'
                  : 'Active',
              id: investmentId.value,
              oncallBack: () async {
                FirebaseAnalyticsHelper.sendAnalyticsEvent(
                    'submit withdraw contract');

                await Future.delayed(const Duration(seconds: 1));
                // ignore: use_build_context_synchronously
                onCreateWithdraw(investmentId.value, context);
                onclearWithdraw();
              },
              annually: fifAccountDetailModel.value.annuallyInterestRate,
            );
          },
        ),
      );

      debugPrint("Perview Widthdraw:$disbursmentDateJson");
      update();
      isPreviewWidthdrawLoading(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isPreviewWidthdrawLoading(false);
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      debugPrint("something error:${errorModel.statusCode}");
    });
  }

  // OnSubmitWithdraw

  final isValidatedWidthdrawLoading = false.obs;
  Future<void> onValidatedWidthdrawSubmit() async {
    isValidatedWidthdrawLoading(true);

    await apiBaseHelper.onNetworkRequesting(
        url: 'validate/withdrawal',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "investment_id": investmentId.value,
          "withdraw_amount": textWithdrawAmount.value,
        }).then((response) {
      debugPrint("Validate Withdraw:$response");
      var validatedwithdrawDateTimeJson = response['withdraw_date'];
      validatedwithdrawDateTime = DateTime.parse(
          "${FormatDate.withdrawFormatDate(validatedwithdrawDateTimeJson.toString())}");
      debugPrint("Validate Withdraw11111:$validatedwithdrawDateTime");

      update();
      isValidatedWidthdrawLoading(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isValidatedWidthdrawLoading(false);
      debugPrint("something error:${errorModel.statusCode}");
    });
  }

  // Hide Feature by user
  final isHideFeatureLoading = false.obs;
  final allowFeaturebyTag = false.obs;
  Future<void> onHideFeatureByUser(id) async {
    debugPrint('ID : $id');
    isHideFeatureLoading(true);

    await apiBaseHelper
        .onNetworkRequesting(
      url: 'fif/setting?user_id=$id',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) async {
      debugPrint("Validate User $id ===:$response");
      var isHideFeatureByUserJson = response['accessible'];

      if (isHideFeatureByUserJson != null) {
        debugPrint('Local Storage : stored $isHideFeatureByUserJson');

        final localdata = await SharedPreferences.getInstance();
        await localdata.setBool('allow-fif', isHideFeatureByUserJson);

        allowFeaturebyTag.value = localdata.getBool('allow-fif')!;
      }

      isHideFeatureLoading(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isHideFeatureLoading(false);
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      debugPrint("something error:${errorModel.statusCode}");
    });
  }

  //account list
  final isLoadingFirstDate = false.obs;
  final firstDateModel = FIFApplicationListModel().obs;
  final firstDateList = <FIFApplicationListModel>[].obs;
  Future<List<FIFApplicationListModel>> fetchFirstDate() async {
    firstDateList.clear();
    isLoadingFirstDate(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'fif-account',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response["data"];
      responseJson.map((e) {
        firstDateList.add(
          FIFApplicationListModel.fromJson(e),
        );
      }).toList();

      isLoadingFirstDate(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
    });
    return firstDateList;
  }

  //fif account details
  final isLoadingAccDetail = false.obs;
  final fifAccountDetailModel = FiFApplicationDetailModel().obs;
  Future<FiFApplicationDetailModel> fetchFIFAccountDetail(num? id) async {
    isLoadingAccDetail(true);
    apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-account/$id', methode: METHODE.get, isAuthorize: true)
        .then((response) {
      var responseJson = response["data"];

      fifAccountDetailModel.value =
          FiFApplicationDetailModel.fromJson(responseJson);
      debugPrint('get response:++++++++$responseJson');
      isLoadingAccDetail(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      debugPrint("Error: ${error.bodyString}");
      isLoadingAccDetail(false);
    });
    return fifAccountDetailModel.value;
  }

  //fif confirm card
  final fifAppConfirmModel = FIFApplicationListModel().obs;
  final fifAppConfirmList = <FIFApplicationListModel>[].obs;
  final isLoadingConfirm = false.obs;
  Future<List<FIFApplicationListModel>> fetchFIFConfirm() async {
    isLoadingConfirm(true);

    await apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-application?type=confirmed',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responsJson = response['data'];
      fifAppConfirmList.clear();
      responsJson.map((e) {
        fifAppConfirmList.add(FIFApplicationListModel.fromJson(e));

        update();
      }).toList();

      isLoadingConfirm(false);
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      isLoadingConfirm(false);
    });
    return fifAppConfirmList;
  }

  //fif confirm detail
  final isLoadingDetailAcc = false.obs;
  final fiFApplicationDetailModel = FiFApplicationDetailModel().obs;
  Future<FiFApplicationDetailModel> fetchConfirmDetail(num? id) async {
    isLoadingDetailAcc(true);
    try {
      await apiBaseHelper
          .onNetworkRequesting(
              url: 'fif-application/$id?type=confirmed',
              methode: METHODE.get,
              isAuthorize: true)
          .then((response) {
        var responseJson = response["data"];
        debugPrint("===Working 1===");
        fiFApplicationDetailModel.value =
            FiFApplicationDetailModel.fromJson(responseJson);
        debugPrint("===Working 2===");
        debugPrint(
            "======Fif confirm detail:${fiFApplicationDetailModel.value.accountName}");
        isLoadingDetailAcc(false);
      }).onError((ErrorModel errorModel, stackTrace) {
        FirebaseCrashlytics.instance.log(
            "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      });
    } catch (e) {
      isLoadingDetailAcc(false);
    }

    return fiFApplicationDetailModel.value;
  }

  ///

  final currentUser = ''.obs;
  final isLoadingPincode = false.obs;
  final isblock = false.obs;
  final isInvalidePin = false.obs;
  final isLogin = false.obs;
  final timeblock = 0.obs;
  final message = ''.obs;
  final contact = ''.obs;
  Uri? deepLink;

  onSetDeepLink(Uri? deeplink) {
    deepLink = deeplink;
    update();
  }

  //fetch api on investment account
  final investmentModel = InvestmentDataModel().obs;
  final isLoadingInvestment = false.obs;
  Future<void> fetchInvestmentAccount() async {
    isLoadingInvestment(true);
    apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-account?total_investment=1&hide=1',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responstJson = response['data'];
      investmentModel.value = InvestmentDataModel.fromJson(responstJson);

      isLoadingInvestment(false);
    }).onError((ErrorModel error, stackTrace) {
      isLoadingInvestment(false);
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
    });
  }

  //on post renew
  onClearRenew() {
    textRenewPeriod.value = '';
  }

  final isLoadingRenew = false.obs;
  Future<void> onPostRenew(num? id, BuildContext context) async {
    debugPrint('onPostRenew Work');
    isLoadingRenew(true);
    await apiBaseHelper.onNetworkRequesting(
        url: 'fif-application/process?type=renew',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "investment_id": id,
          "renew_period": textRenewPeriod.value,
        }).then((response) {
      debugPrint('onPostRenew Success $response');
      if (response['success'] != null && response['success']) {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => CustomSucessScreen(
              title: 'Success',
              description: 'Your FIF application is submitted successfully. ',
              buttonTitle: 'Done',
              onPressedButton: () {
                onClearFIF();
                clearDeducSelection();
                context.go('/investment');
                Future.delayed(const Duration(seconds: 1), () {
                  getFIFApplication();
                  fetchFIFPending();
                });
              },
            ),
          ),
        );
      }

      isLoadingRenew(false);

      update();
    }).onError((ErrorModel errorModel, stackTrace) {
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      debugPrint('onPostRenew Fails');
      customRouterSnackbar(
          title: 'Updated FIF Application Fails',
          description: 'Your FIF Application was Update Failed...!',
          type: SnackType.error);
    });
  }

  final customerController = Get.put(CustomerController());
  final notifcationCon = Get.put(NotificationController());
  // final pinCode = ''.obs;

  submitPINCode(
      {String? pinCode, Function? onSuccess, BuildContext? context}) async {
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}user/verify-pin-code';
    isLoadingPincode(true);
    await apiBaseHelper.onNetworkRequesting(
      url: '',
      fullURL: url,
      methode: METHODE.post,
      isAuthorize: true,
      body: {'pin_code': pinCode},
    ).then((response) {
      isLoadingPincode(false);

      ///
      var success = response['success'];

      if (success) {
        customerController.isLoginSuccess(true);
        isLogin(true);

        ///Do here
        onSuccess != null ? onSuccess() : null;
        //when success do sth here

        notifcationCon.notificationList.asMap().entries.map((e) {
          if (e.value.readAt == null &&
              e.value.data!.type == 'Announcement' &&
              !e.value.data!.expired!) {
            return showDialog(
              barrierDismissible: false,
              context: context!,
              builder: (context) => PopUpAnnouncement(
                notificationModel: e.value,
              ),
            );
          }
          if (e.value.readAt == null &&
              e.value.data!.type == 'ut-trading' &&
              e.value.data!.status == 'Requested') {
            return showDialog(
              barrierDismissible: false,
              context: context!,
              builder: (context) => AcceptNotificationPopup(
                notificationModel: e.value,
              ),
            );
          }
        }).toList();

        if (deepLink != null) {
          if (deepLink!.path.contains(RouteName.EVENTDETAIL)) {
            var param = deepLink!.queryParameters['eventID'];
            final argument = EventDetailArgument(id: int.parse(param!));
            Navigator.pushNamed(Get.context!, RouteName.EVENTDETAIL,
                arguments: argument);
            deepLink = null;
          }
          if (deepLink!.path.contains(RouteName.MEMBERDETAIL)) {
            var param = deepLink!.queryParameters['memberID'];
            final agument = MemberDetailAgrument(
                id: int.parse(param!), pageName: 'memberList');
            Navigator.pushNamed(Get.context!, RouteName.MEMBERDETAIL,
                arguments: agument);
            deepLink = null;
          }
        }
      } else {
        var block = response['retry_in'];
        if (block != null) {
          timeblock.value = response['retry_in_second'];
          message.value = response['message'];
          contact.value = response['contact'];
          isblock(true);
        } else {
          isInvalidePin(true);
        }
      }
    }).onError((ErrorModel error, stackTrace) {
      FirebaseCrashlytics.instance
          .log("${error.bodyString.toString()} ${error.statusCode.toString()}");
      isLoadingPincode(false);
      deepLink = null;
      debugPrint('Pincode Error ${error.statusCode}');
    });
  }

  onclearWithdraw() {
    textWithdrawAmount.value = 0;
    textdisbursementDate = null;
    iswithdrawAmount.value = true;
    isdisbursementDate.value = true;
  }

  final withdrawId = 0.obs;
  final isLoadingWithdraw = false.obs;

  Future<void> onCreateWithdraw(withdrawId, BuildContext? context) async {
    isLoadingWithdraw(true);
    await apiBaseHelper.onNetworkRequesting(
        url: 'fif-application/process?type=withdraw',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "investment_id": withdrawId,
          "disbursement_date": textdisbursementDateSubmit.value,
          "amount": textWithdrawAmount.value
        }).then((e) async {
      debugPrint("Widthdraw body:$e");
      await Navigator.of(context!, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (context) {
            return CustomSucessScreen(
              title: 'Success',
              description: 'Your request for withdraw has been submitted.',
              buttonTitle: 'Done',
              onPressedButton: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Future.delayed(const Duration(seconds: 0), () {
                  getFIFApplication();
                  fetchFirstDate();
                  fetchFIFPending();
                });
              },
            );
          },
        ),
      );
    }).onError((ErrorModel errorModel, stackTrace) {
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
    });
  }

  final isLoadingWithdrawBank = false.obs;
  final withdrawBank = Bank().obs;
  final withdrawBankList = <Bank>[].obs;
  Future<List<Bank>> fetchFiFBank() async {
    isLoadingWithdrawBank(true);
    final tokenKey = await LocalData.getCurrentUser();
    try {
      final String url =
          '${FlavorConfig.instance.values!.apiBaseUrl}bank?type=FIF';
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenKey'
        },
      ).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          withdrawBankList.clear();
          responseJson.map((e) {
            withdrawBank.value = Bank.fromJson(e);

            withdrawBankList.add(withdrawBank.value);
            bankId.value = withdrawBankList.last.id!.toInt();
            // if (isNewBank.value == true) {
            //   fifController.textReceivingAccount.value =
            //       bankMemberDataList.last.bankName!;
            // }
            // bankId.value = bankMemberDataList.lastIndexOf(e.id);
          }).toList();
        }
      }).onError((ErrorModel errorModel, stackTrace) {
        FirebaseCrashlytics.instance.log(
            "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      });
    } finally {
      isLoadingWithdraw(false);
      // isNewBank.value = false;
    }
    return withdrawBankList;
  }

  //contract history
  final contractHistory = ContractHistory().obs;
  final contractHistoryList = <ContractHistory>[].obs;
  final isLoadingContractHistory = false.obs;

  Future<List<ContractHistory>> fectContractHistory(
      {String? contractType}) async {
    isLoadingContractHistory(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-contract-history?type=$contractType',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      contractHistoryList.clear();
      var responseJson = response['data'];
      responseJson.map((e) {
        contractHistory.value = ContractHistory.fromJson(e);
        contractHistoryList.add(contractHistory.value);
      }).toList();
      isLoadingContractHistory(false);
      update();
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingContractHistory(false);
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
    });
    return contractHistoryList;
  }

  final principalHistory = PrincipalHistory().obs;
  final principalHistoryList = <PrincipalHistory>[].obs;
  final isLoadingPrincipalHistory = false.obs;
  Future<List<PrincipalHistory>> fetchPrincipalHistory(num? id) async {
    isLoadingPrincipalHistory(true);

    await apiBaseHelper
        .onNetworkRequesting(
            url: 'fif-account-histories?investment_id=$id',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      principalHistoryList.clear();
      var responseJson = response['data'];
      responseJson.map((e) {
        principalHistory.value = PrincipalHistory.fromJson(e);
        principalHistoryList.add(principalHistory.value);
        isLoadingPrincipalHistory(false);
      }).toList();
    }).onError((ErrorModel errorModel, stackTrace) {
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
    });
    return principalHistoryList;
  }

  //renew peroid month
  final isLoadingRenewPeriod = true.obs;
  final renewPeroidMonth = RenewPeroidMonth().obs;
  final renewPeroidMonthList = [].obs;
  Future fetchRenewPeriodMoth() async {
    isLoadingRenewPeriod(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'option/renew', methode: METHODE.get, isAuthorize: true)
        .then((response) {
      var responseJson = response['data'];
      renewPeroidMonthList.value = responseJson;

      isLoadingRenewPeriod(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      FirebaseCrashlytics.instance.log(
          "${errorModel.bodyString.toString()} ${errorModel.statusCode.toString()}");
      debugPrint('Fix me error renew period:${errorModel.statusCode}');
      debugPrint('Fix me error renew period:${errorModel.bodyString}');
    });
  }

  // edit and create bank account
  final fifBankTypeId = 0.obs;
  final fifAccName = ''.obs;
  final fifAccNumber = ''.obs;
  final fifBankId = 0.obs;
  final fifBankName = ''.obs;
  final isfifBankName = true.obs;
  final isfifAccName = true.obs;
  final isfifAccNumber = true.obs;
  final isLoadingfifBankAcc = false.obs;
  final selectBankAcc = 0.obs;
  Future<void> onfifCreateBank(BuildContext context,
      {num? fifId, num? bankId}) async {
    isLoadingfifBankAcc(true);
    apiBaseHelper.onNetworkRequesting(
        methode: METHODE.post,
        isAuthorize: true,
        url: 'fif/bank/editOrCreate',
        body: {
          'fif_id': fifId,
          'bank_id': bankId, //(create bank) no need to submit
          'bank_type_id': fifBankTypeId.value,
          'account_name': fifAccName.value,
          'account_number': fifAccNumber.value,
        }).then((res) {
      debugPrint('ressss234:${fifBankTypeId.value}');
      debugPrint('ressss234222:$res');
      Navigator.pop(context);
      fetchPayment();
      fetchFIFAccountDetail(fifId);
      isLoadingfifBankAcc(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint('erroor234:${error.bodyString}');
      isLoadingfifBankAcc(false);
    });
  }
}

class PaymentDate {
  final String? title;
  final String? date;
  final String? image;
  final int? amount;
  final num? durationRenewDate;
  PaymentDate(
      {this.durationRenewDate, this.date, this.title, this.image, this.amount});
}

class DeductScheduleFormModel {
  String deductionDate;
  String deductionAmount;
  bool isValidateDate;
  bool isValidateAmount;

  DeductScheduleFormModel({
    this.deductionDate = "",
    this.deductionAmount = "",
    this.isValidateDate = true,
    this.isValidateAmount = true,
  });
}
