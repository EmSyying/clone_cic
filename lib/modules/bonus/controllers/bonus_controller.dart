import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/function/get_sharepreference_data.dart';
import '../../../Utils/helper/custom_route_snackbar.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../../investment_module/controller/investment_controller.dart';
import '../../ut_trading/models/detail_model.dart';
import '../../wallet/controller/wallet_controller.dart';
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
  final tapcurrentIndex = 0.obs;
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
  final isEnablebutton = false.obs;
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
    isAgree.value = false;
    isValidateCashoutAmount.value = true;
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
        '${FlavorConfig.instance.values!.apiBaseUrl}wallet-available-balance';

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
        ? '${FlavorConfig.instance.values!.apiBaseUrl}history?type=$type'
        : '${FlavorConfig.instance.values!.apiBaseUrl}history';

    // if (type == "subscription") {
    //   isSubscriptionHistories(true);
    // } else {
    //   isLoadingHistory(true);
    // }
    debugPrint('Subsription is working:Type:$type');

    isLoadingHistory(true);
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          debugPrint("suscription${response.body}");
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
        } else {
          isLoadingHistory(false);
          debugPrint("Subsription is working error${response.statusCode}");
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
          '${FlavorConfig.instance.values!.apiBaseUrl}pending-subscription-payment';
      await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenKey'
        },
      ).then((response) {
        debugPrint("Subscription Pending:${response.body}");
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
          ? '${FlavorConfig.instance.values!.apiBaseUrl}bank?member_id=1'
          : '${FlavorConfig.instance.values!.apiBaseUrl}bank?type=UT-Subscription';
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
      final String url = '${FlavorConfig.instance.values!.apiBaseUrl}bank-type';
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
        '${FlavorConfig.instance.values!.apiBaseUrl}create-bank-account';
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

          customRouterSnackbar(
              title: 'Submit bank Failed',
              description: '$responseJson',
              type: SnackType.error);
        }
      });
    } finally {
      isCreateBank(false);
    }
  }

  // Cash out

  Future<void> onCashout(
    BuildContext context,
  ) async {
    final tokenKey = await LocalData.getCurrentUser();
    isCashout(true);
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}user/wallet/cash-out';
    try {
      debugPrint('print amout:===${cashoutAmount.value}');
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({
                "amount": cashoutAmount.value,
                "bank_id": "${bankId.value}",
              }))
          .then((response) {
        if (response.statusCode == 200) {
          onClear();

          context.pushNamed(
            'SuccessScreen',
            queryParams: {
              'title': 'Success',
              'description': 'The cash out request has been submitted',
              'appbarTitle': 'Done',
            },
            extra: {
              'onPressedButton': () {
                context.go('/wallet/mma-transfer/mma-cash-out/history-cashout');
              },
            },
          );
        } else {
          var responseJson = json.decode(response.body)['message'];
          // debugPrint("Cash out boday:$responseJson");
          customRouterSnackbar(
              title: 'Cash Out Failed',
              description: responseJson,
              type: SnackType.error);
        }
      });
    } finally {
      isCashout(false);
    }
  }

  Future<void> onSubscription(BuildContext context, {String? fromPage}) async {
    final tokenKey = await LocalData.getCurrentUser();
    isSubscription(true);
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}subscription';
    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode(
                {"number_of_share": subscriptionAmount.value},
              ))
          .then((response) {
        if (response.statusCode == 200) {
          debugPrint(
              'hany test submit subscription====: ${subscriptionAmount.value}');
          context.pushNamed(
            'SuccessScreen',
            queryParams: {
              'title': 'Success',
              'description': 'The UT Subscription request has been submitted',
              'appbarTitle': '',
            },
            extra: {
              'onPressedButton': () {
                if (fromPage == 'investment') {
                  context.go(
                      '/ut-subscription/histories-subscription?fromPage=investment');
                } else {
                  context.go(
                      '/wallet/invest-fif/cic-equity-fund/ut-subscription/histories-subscription');
                }
              },
            },
          );

          fectchBalance();
          fetchTransationHistory(type: 'all');
          fetchPendingTransaction();
          subscriptionAmount.value = 0;
          displaysubscriptionCoast.value = 0.0;
          diplayNewUTAmount.value = 0;

          isSubmited.value = false;
          onClear();
          update();
        } else {
          debugPrint("Subscriptionn Failed:${response.body}");
          var responseJson = json.decode(response.body)['message'];
          customRouterSnackbar(
            title: 'Subscription Failed',
            description: '$responseJson',
            type: SnackType.error,
          );
        }
      });
    } finally {
      isSubscription(false);
    }
  }

  Future<UTSubscription> fetchUTScription() async {
    tokenKey = await LocalData.getCurrentUser();

    String url = '${FlavorConfig.instance.values!.apiBaseUrl}subscription';
    isUTScription(true);
    try {
      http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)["data"];

          utSubscription.value = UTSubscription.fromJson(responseJson);
        } else {
          isUTScription(false);
        }
      });
    } finally {
      isUTScription(false);
    }
    return utSubscription.value;
  }

  Future<PaymentSummary> fetchPaymentSummary() async {
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}subscription-summary';

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

    String url = '${FlavorConfig.instance.values!.apiBaseUrl}bonus-setting';
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

  final _walletController = Get.put(WalletController());
  Future<void> onRequestPayment(BuildContext? context) async {
    final token = await LocalData.getCurrentUser();
    isConfirm.value = false;
    isLoadingRequestPayment(true);
    debugPrint("Submit payment with deduction:1");
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}request-payment';
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
        debugPrint("Submit payment with deduction:111:${response.body}");
        if (response.statusCode == 200) {
          Navigator.pop(context!);
          customRouterSnackbar(
              title: 'Reqest Payment',
              description: 'Your request payment is submitted successfully.');

          Future.delayed(const Duration(seconds: 3), () {
            _walletController.fetchWalletAmount();
            _walletController.getAllTransaction();
            fetchTransationHistory(type: "all");
            fetchPendingTransaction();
            fectchBalance();

            Navigator.pop(context);
            isSubscriptionHistories.value = true;
          });
        } else {
          debugPrint("Submit failed: ====$response");
          Navigator.pop(context!);

          customRouterSnackbar(
              title: 'Request payment Failed',
              description: response.statusCode == 422
                  ? 'The balance is not enough.'
                  : '',
              type: SnackType.error);
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
