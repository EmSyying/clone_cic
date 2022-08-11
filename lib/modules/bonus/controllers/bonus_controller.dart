import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/function/get_sharepreference_data.dart';
import '../../../Utils/helper/custom_snackbar.dart';
import '../../investment_module/controller/investment_controller.dart';
import '../../ut_trading/models/detail_model.dart';
import '../models/availabale_balance_model.dart';
import '../models/bank_list_info.dart';
import '../models/history_model.dart';
import '../models/payment_summary.dart';
import '../models/subscription_setting.dart';
import '../models/ut_subscription.dart';

class BonusController extends GetxController {
  final fifController = Get.put(PriceController());
  late TabController tabController;
  late TabController tabControllerSubscribe;
  late TabController tabControllerCashOut;
  final isSelectedBank = false.obs;
  final bankInfoIndex = 0.obs;
  final isSelectduration = false.obs;
  final isLoadingBalance = false.obs;
  final isSelectIcon = false.obs;
  final selectIndex = 0.obs;
  final selected = 0.obs;
  final isSelectPersentage = 0.obs;
  final currentIndex = 0.obs;
  final isSubmit = false.obs;
  final isSubmited = false.obs;
  final isAgree = false.obs;
  final isSelectConfirm = false.obs;
  final isSubmitCashOut = false.obs;
  final isSelectChangeAcc = false.obs;
  final isbankInfo = false.obs;
  final isPending = false.obs;

  var defualValue = {"Name": "", "Code": 0}.obs;
  final bankId = 0.obs;
  final bankinfoId = 0.obs;
  final validateText = "".obs;
  final valadatesubscriptionText = "".obs;
  final validateAccountNumberText = "".obs;
  final bankName = "".obs;

  final bankdigits = 0.obs;
  final accountName = ''.obs;
  final accountNumber = "".obs;
  final cashoutAmount = 0.0.obs;
  final isEnableButton = false.obs;
  final isVailidateBankName = true.obs;
  final isValidatebankInfo = true.obs;
  final isValidateAccountName = true.obs;
  final isValidateAccountNumber = true.obs;
  final isValidateCashoutAmount = true.obs;

  final isCashout = false.obs;
  final isSubscription = false.obs;
  final subscriptionAmount = 0.obs;
  final diplayNewUTAmount = 0.obs;
  final displaysubscriptionCoast = 0.0.obs;
  final payable = 0.0.obs;
  final utPrice = "".obs;
  final isValidateSubscriptionAmount = true.obs;
  final utSubscription = UTSubscription().obs;
  final paymentSummary = PaymentSummary().obs;
  final bonusSetting = BonusSetting().obs;
  final bankMemberData = Bank().obs;
  final bankMemberDataList = <Bank>[].obs;
  final bankinfo = BankData().obs;
  final bankInfoList = <BankData>[].obs;
  final historyModel = HistoryData().obs;
  final historyList = <HistoryData>[].obs;
  final cashOutTransactionList = <HistoryData>[].obs;
  final cashInTransactionList = <HistoryData>[].obs;
  final cashInOutTransactionList = <HistoryData>[].obs;
  final subscriptionList = <HistoryData>[].obs;
  final pendingtransactionList = <HistoryData>[].obs;
  final pendingtransaction = HistoryData().obs;

  final isCertificate = false.obs;
  final isLoadingHistory = false.obs;
  final isSubscriptionHistories = false.obs;
  final isSubscriptionSetting = false.obs;

  final isLoadingAccountBank = false.obs;

  final isUTScription = false.obs;
  final isPaymentSummary = false.obs;
  final isSelectyIndex = 0.obs;

  final isLoadingRequestPayment = false.obs;
  final test = ''.obs;

  final referalID = 0.obs;
  final isConfirm = false.obs;
  final subscriptionStatus = "".obs;
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController utPriceController = TextEditingController();
  onClear() {
    accountNameController.text = "";
    accountNumberController.text = "";
    accountName.value = "";
    accountNumber.value = "";
    cashoutAmount.value = 0.0;
    bankName.value = "";
    diplayNewUTAmount.value = 0;
    subscriptionAmount.value = 0;
  }

  onClearBank() {
    bankName.value = "";
    accountName.value = "";
    accountNumber.value = "";
  }

  List<DurationModel> durationList = [
    DurationModel(title: '3 months', isSelected: false),
    DurationModel(title: '4 months', isSelected: false),
    DurationModel(title: '5 months', isSelected: false),
    DurationModel(title: '6 months', isSelected: false),
  ].obs;

  String? tokenKey;
  PageController pageController = PageController();
  final currentIndexPage = 0.obs;

//available balance
  final balanceModel = Balance().obs;
  Future<Balance> fectchBalance() async {
    isLoadingBalance(true);

    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}wallet-available-balance';

    try {
      http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          balanceModel.value = Balance.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingBalance(false);
    }
    return balanceModel.value;
  }

  //History card

  Future<List<HistoryData>> fetchTransationHistory({String? type}) async {
    tokenKey = await LocalData.getCurrentUser();

    String url = type != null
        ? '${GlobalConfiguration().get('api_base_urlv3')}history?type=$type'
        : '${GlobalConfiguration().get('api_base_urlv3')}history';

    // if (type == "subscription") {
    //   isSubscriptionHistories(true);
    // } else {
    //   isLoadingHistory(true);
    // }
    isLoadingHistory(true);
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];
          if (type == "cash-in") {
            cashInTransactionList.clear();
          } else if (type == "cash-out") {
            cashOutTransactionList.clear();
          } else if (type == "subscription") {
            subscriptionList.clear();
          } else if (type == "cash-out-cash-in") {
            cashInOutTransactionList.clear();
          } else {
            historyList.clear();
          }
          responseJson.map((e) {
            historyModel.value = HistoryData.fromJson(e);
            if (type == "cash-in") {
              cashInTransactionList.add(historyModel.value);
            } else if (type == "cash-out") {
              cashOutTransactionList.add(historyModel.value);
            } else if (type == "subscription") {
              subscriptionList.add(historyModel.value);
            } else if (type == "cash-out-cash-in") {
              cashInOutTransactionList.add(historyModel.value);
            } else {
              historyList.add(historyModel.value);
            }
          }).toList();
        }
      });
    } finally {
      // if (type == "subscription") {
      //   isSubscriptionHistories(false);
      // } else {
      //   isLoadingHistory(false);
      // }

      isLoadingHistory(false);
    }
    return historyList;
  }

  Future<List<HistoryData>> fetchPendingTransaction() async {
    isPending(true);
    final tokenKey = await LocalData.getCurrentUser();
    try {
      final String url =
          '${GlobalConfiguration().get('api_base_urlv3')}pending-subscription-payment';
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
          pendingtransactionList.clear();
          responseJson.map((e) {
            pendingtransaction.value = HistoryData.fromJson(e);

            pendingtransactionList.add(pendingtransaction.value);
          }).toList();
        }
      });
    } finally {
      isPending(false);
    }
    return pendingtransactionList;
  }

//get member account

  Future<List<Bank>> fetchBankMember({String? cicBank}) async {
    isLoadingAccountBank(true);
    final tokenKey = await LocalData.getCurrentUser();
    try {
      final String url = cicBank == null
          ? '${GlobalConfiguration().get('api_base_urlv3')}bank?member_id=1'
          : '${GlobalConfiguration().get('api_base_urlv3')}bank?type=UT-Subscription';
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
          bankMemberDataList.clear();
          responseJson.map((e) {
            bankMemberData.value = Bank.fromJson(e);

            bankMemberDataList.add(bankMemberData.value);
            bankId.value = bankMemberDataList.last.id!.toInt();
            // if (isNewBank.value == true) {
            //   fifController.textReceivingAccount.value =
            //       bankMemberDataList.last.bankName!;
            // }
            // bankId.value = bankMemberDataList.lastIndexOf(e.id);
          }).toList();
        }
      });
    } finally {
      isLoadingAccountBank(false);
      // isNewBank.value = false;
    }
    return bankMemberDataList;
  }

  Future<List<BankData>> fetchBankInfo() async {
    isbankInfo(true);
    final tokenKey = await LocalData.getCurrentUser();
    try {
      final String url =
          '${GlobalConfiguration().get('api_base_urlv3')}bank-type';
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
          bankInfoList.clear();
          responseJson.map((e) {
            bankinfo.value = BankData.fromJson(e);

            bankInfoList.add(bankinfo.value);
          }).toList();
        }
      });
    } finally {
      isbankInfo(false);
    }
    return bankInfoList;
  }

//post and update account bank

  final isCreateBank = false.obs;

  Future<void> onCreateBankAccount({
    BuildContext? context,
  }) async {
    final tokenKey = await LocalData.getCurrentUser();
    isCreateBank(true);
    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}create-bank-account';
    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({
                "bank_name": "${bankinfoId.value}",
                "account_name": accountName.value,
                "account_number": accountNumber.value,
              }))
          .then((response) {
        if (response.statusCode == 200) {
          Future.delayed(const Duration(seconds: 0), () {
            fetchBankMember();
            fifController.fetchPayment();

            Navigator.pop(context!);

            isSubmitCashOut.value = false;
            // customSnackbar(
            //     imgUrl: 'assets/images/svgfile/successIcon.svg',
            //     color: Colors.green,
            //     titleText: 'Submit Bank Successful!',
            //     messageText: 'Your Submit Bank has been Successful!');
          });
        } else {
          var responseJson =
              json.decode(response.body)['errors']['account_number'][0];

          debugPrint("====bank info:$responseJson");

          customSnackbar(
              isFailed: true,
              color: Colors.red,
              titleText: 'Submit bank Failed',
              messageText: '$responseJson');
        }
      });
    } finally {
      isCreateBank(false);
    }
  }

  // Cash out
  Future<void> onCashout({
    BuildContext? context,
  }) async {
    final tokenKey = await LocalData.getCurrentUser();
    isCashout(true);
    String url = '${GlobalConfiguration().get('api_base_urlv3')}cash-out';
    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({
                "bank_id": "${bankId.value}",
                "amount": "${cashoutAmount.value}",
              }))
          .then((response) {
        if (response.statusCode == 200) {
          customSnackbar(
              imgUrl: 'assets/images/svgfile/successIcon.svg',
              color: Colors.green,
              titleText: 'Cash Out',
              messageText: 'Your cash out request is submitted successfully.');
          Future.delayed(const Duration(seconds: 3), () {
            fectchBalance();
            fetchTransationHistory(type: "all");
            Navigator.pop(Get.context!);
            isLoadingHistory.value = true;
            isSubmited.value = false;
            onClear();
          });
        } else {
          customSnackbar(
              isFailed: true,
              color: Colors.red,
              titleText: 'Cash Out Failed',
              messageText: 'Please Try Again Later.');
        }
      });
    } finally {
      isCashout(false);
    }
  }

  Future<void> onSubscription({
    BuildContext? context,
  }) async {
    final tokenKey = await LocalData.getCurrentUser();
    isSubscription(true);
    String url = '${GlobalConfiguration().get('api_base_urlv3')}subscription';
    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({"number_of_share": subscriptionAmount.value}))
          .then((response) {
        if (response.statusCode == 200) {
          customSnackbar(
              imgUrl: 'assets/images/svgfile/successIcon.svg',
              color: Colors.green,
              titleText: 'Subscription',
              messageText: 'Your subscription is submitted successfully.');
          Future.delayed(const Duration(seconds: 3), () {
            fectchBalance();
            fetchTransationHistory(type: 'all');
            fetchPendingTransaction();
            subscriptionAmount.value = 0;
            displaysubscriptionCoast.value = 0.0;
            diplayNewUTAmount.value = 0;

            Navigator.pop(Get.context!);
            isLoadingHistory.value = true;
            isSubmited.value = false;
            // onClear();
          });
        } else {
          customSnackbar(
              isFailed: true,
              color: Colors.red,
              titleText: 'Subscription Failed',
              messageText: 'Please Try Again Later.');
        }
      });
    } finally {
      isSubscription(false);
    }
  }

  Future<UTSubscription> fetchUTScription() async {
    tokenKey = await LocalData.getCurrentUser();

    String url = '${GlobalConfiguration().get('api_base_urlv3')}subscription';

    try {
      isUTScription(true);
      http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];

          utSubscription.value = UTSubscription.fromJson(responseJson);
        } else {}
      });
    } finally {
      isUTScription(false);
    }
    return utSubscription.value;
  }

  Future<PaymentSummary> fetchPaymentSummary() async {
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}subscription-summary';

    try {
      isPaymentSummary(true);
      http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];

          paymentSummary.value = PaymentSummary.fromJson(responseJson);
        } else {}
      });
    } finally {
      isPaymentSummary(false);
    }
    return paymentSummary.value;
  }

  Future<BonusSetting> fetchbonusSetting() async {
    tokenKey = await LocalData.getCurrentUser();

    String url = '${GlobalConfiguration().get('api_base_urlv3')}bonus-setting';
    isSubscriptionSetting(true);
    try {
      http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];

          bonusSetting.value = BonusSetting.fromJson(responseJson);
        } else {}
      });
    } finally {
      isSubscriptionSetting(false);
    }
    return bonusSetting.value;
  }

  Future<void> onRequestPayment(BuildContext? context) async {
    final token = await LocalData.getCurrentUser();
    isLoadingRequestPayment(true);
    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}request-payment';
    try {
      http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token'
              },
              body: json.encode({
                "amount": payable.value,
                "referal_id": referalID.value,
              }))
          .then((response) {
        if (response.statusCode == 200) {
          debugPrint("Payment able:${payable.value}");
          debugPrint("Referal id:${referalID.value}");
          customSnackbar(
              imgUrl: 'assets/images/svgfile/successIcon.svg',
              color: Colors.green,
              titleText: 'Reqest Payment',
              messageText: 'Your request payment is submitted successfully.');
          Future.delayed(const Duration(seconds: 3), () {
            fetchTransationHistory(type: "all");
            fetchPendingTransaction();
            fectchBalance();

            Navigator.pop(Get.context!);
            isSubscriptionHistories.value = true;
          });
        } else {
          customSnackbar(
              isFailed: true,
              color: Colors.red,
              titleText: 'Request payment Failed',
              messageText: 'Please Try Again Later.');
        }
      });
    } finally {
      isLoadingRequestPayment(false);
    }
  }

  @override
  void onInit() async {
    fetchBankMember();
    super.onInit();
  }
}

class FormatToK {
  static String convertNumber(num? number) {
    String formatNumber =
        NumberFormat.compactCurrency(decimalDigits: 2, symbol: '')
            .format(number);
    return formatNumber;
  }

  static String digitNumber(num? dnumber) {
    String digitNum = NumberFormat.currency(name: '').format(dnumber ?? 0);
    return digitNum;
  }
}

class DurationModel {
  final String? title;
  bool? isSelected;
  DurationModel({this.title, this.isSelected});
}