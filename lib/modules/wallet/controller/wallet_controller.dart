import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
import 'package:cicgreenloan/modules/wallet/model/deposit/deposit_detail.dart';
import 'package:cicgreenloan/modules/wallet/model/mma_deposit_card_model.dart';
import 'package:cicgreenloan/modules/wallet/model/wallet/wallet_data_model.dart';
import 'package:cicgreenloan/utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:cicgreenloan/utils/helper/custom_success_screen.dart';
import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../qr_code/qrcode_controller/qr_type.dart';
import '../model/exchange_point_transaction.dart/exchange_point_transaction.dart';
import '../model/invest/invest_option_model.dart';

import '../model/transaction/wallet_transaction.dart';
import '../model/transaction/wallet_transaction_detail.dart';
import '../model/transfer_recieved/transfer_model.dart';

class WalletController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();
  // Transaction Card
  PageController pageController = PageController();
  final currentIndexPage = 0.obs;
  final isConfirm = false.obs;
  //End
  final name = ''.obs;

  List<MMADepositCardModel> mmacardlist = [
    MMADepositCardModel(
      title: 'To deposit via Banks / Wallets',
      imageMMACard: 'assets/images/wallet/fontisto_wallet.svg',
    ),
    MMADepositCardModel(
      title: 'To receive from other MM Account',
      imageMMACard: 'assets/images/wallet/navigation_icons.svg',
    ),
  ].obs;
  List<MMADepositCardModel> mmAccountTransferList = [
    MMADepositCardModel(
      title: 'Cash Out',
      imageMMACard: 'assets/images/svgfile/cashout.svg',
    ),
    MMADepositCardModel(
      title: 'Transfer to other MM Account',
      imageMMACard: 'assets/images/wallet/transferto-other-account.svg',
    ),
  ].obs;

  ///Fetch FiF Option List
  final listFiFOption = <InvestOptionModel>[].obs;
  final listFiFOptionLoading = false.obs; //Loading

  Future<void> fetchFiFOptionList() async {
    listFiFOptionLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get,
            isAuthorize: true,
            url: 'wallet/invest/option')
        .then((response) {
      debugPrint('Success $response');
      listFiFOption.clear();
      response['data'].map((e) {
        listFiFOption.add(InvestOptionModel.fromJson(e));
      }).toList();
      listFiFOptionLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      listFiFOptionLoading(false);
      debugPrint('Error ${error.statusCode}');
    });
  }

  // Wallet Transaction

  Future<List<WalletTransaction>> fetchWalletTransaction(String param) async {
    final tempList = <WalletTransaction>[];

    await _apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get,
            isAuthorize: true,
            url: 'user/wallet/transaction?$param')
        .then((response) {
      debugPrint('Success $response');
      response['data'].map((e) {
        tempList.add(WalletTransaction.fromJson(e));
      }).toList();
    }).onError((ErrorModel error, _) {
      debugPrint('Error ${error.statusCode}');
    });
    return tempList;
  }

  // Cash Out All Transaction
  final cashoutAllTransactionList = <WalletTransaction>[].obs;
  final isLoadingCashoutAllTran = false.obs;
  Future<List<WalletTransaction>> fetchCashOutAllTransaction() async {
    final cashoutAllTransactionTempList = <WalletTransaction>[];
    isLoadingCashoutAllTran(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get,
            isAuthorize: true,
            url: 'user/wallet/transaction?deposit=1&cashout=1')
        .then((response) {
      debugPrint('Success $response');
      response['data'].map((e) {
        cashoutAllTransactionTempList.add(WalletTransaction.fromJson(e));
      }).toList();
      cashoutAllTransactionList.value = cashoutAllTransactionTempList;
      isLoadingCashoutAllTran(false);
    }).onError((ErrorModel error, _) {
      isLoadingCashoutAllTran(false);
      debugPrint('Error ${error.statusCode}');
    });
    return cashoutAllTransactionList;
  }

  // Wallet Transaction Detail
  final walletTransactionDetail = WalletTransactionDetail().obs;
  final transactionDetailLoading = false.obs;
  Future<WalletTransactionDetail> onFetchWalletTransactionDetail(
      int id, String model) async {
    debugPrint("Model:$model");
    transactionDetailLoading(true);
    debugPrint('transactionDetailLoading 1:$transactionDetailLoading');
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'user/wallet/transaction/$id?model=$model',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      walletTransactionDetail.value =
          WalletTransactionDetail.fromJson(response['data']);
      debugPrint('transactionDetailLoading 2:$transactionDetailLoading');
      debugPrint('Transactoinn Detail:${walletTransactionDetail.value}');
      transactionDetailLoading(false);
      debugPrint('transactionDetailLoading 3:$transactionDetailLoading');
      update();
    }).onError((ErrorModel error, stackTrace) {
      transactionDetailLoading(false);
      debugPrint('Error : ${error.statusCode} : ${error.bodyString}');
    });
    return walletTransactionDetail.value;
  }

  ///all transaction
  final loadingTransaction = false.obs;
  List<WalletTransaction> allTransaction = <WalletTransaction>[];
  List<WalletTransaction> pendingTransaction = <WalletTransaction>[];

  Future<Map<String, List<WalletTransaction>>> getAllTransaction() async {
    loadingTransaction(true);
    List<WalletTransaction> tempAllList = <WalletTransaction>[];
    List<WalletTransaction> tempPendingList = <WalletTransaction>[];
    tempAllList = await fetchWalletTransaction('type=all');
    // tempPendingList = await fetchWalletTransaction('pending=1');
    loadingTransaction(false);
    allTransaction = tempAllList;
    pendingTransaction = tempPendingList;
    debugPrint('Success ===> ${tempAllList.length}');
    debugPrint('Success ===> ${tempPendingList.length}');

    return {
      'all': allTransaction,
      'pending': pendingTransaction,
    };
  }

  ///income transaction
  List<WalletTransaction> incomeTransactionList = <WalletTransaction>[];
  final loadingfetchIncome = false.obs;
  Future<List<WalletTransaction>> getIncomeTransaction() async {
    loadingfetchIncome(true);
    List<WalletTransaction> tempList = <WalletTransaction>[];
    tempList = await fetchWalletTransaction('income=1');
    loadingfetchIncome(false);
    incomeTransactionList = tempList;
    return incomeTransactionList;
  }

  ///Expense transaction
  List<WalletTransaction> expenseTransactionList = <WalletTransaction>[];
  final loadingfetchExpense = false.obs;
  Future<List<WalletTransaction>> getExpenseTransaction() async {
    loadingfetchExpense(true);
    List<WalletTransaction> tempList = <WalletTransaction>[];
    tempList = await fetchWalletTransaction('expense=1');
    loadingfetchExpense(false);
    expenseTransactionList = tempList;
    return expenseTransactionList;
  }

  ///Cash-Out transaction
  List<WalletTransaction> cashoutTransactionList = <WalletTransaction>[];
  final loadingfetchCashoutTransaction = false.obs;
  Future<List<WalletTransaction>> getCashoutTransaction() async {
    loadingfetchCashoutTransaction(true);
    List<WalletTransaction> tempList = <WalletTransaction>[];
    tempList = await fetchWalletTransaction('cashout=1');
    loadingfetchCashoutTransaction(false);
    cashoutTransactionList = tempList;
    return cashoutTransactionList;
  }

  ///Cash-In transaction
  List<WalletTransaction> cashinTransactionList = <WalletTransaction>[];
  final loadingfetchCashinTransaction = false.obs;
  Future<List<WalletTransaction>> getCashinTransaction() async {
    loadingfetchCashinTransaction(true);
    List<WalletTransaction> tempList = <WalletTransaction>[];
    tempList = await fetchWalletTransaction('cashin=1');
    loadingfetchCashinTransaction(false);
    cashinTransactionList = tempList;
    return cashinTransactionList;
  }

  // Wallet Transaction Pending
  final walletTransactionPendingList = <WalletTransactionDetail>[].obs;
  final isWalletTrnsactionPending = false.obs;
  Future<List<WalletTransactionDetail>>
      onFetchWalletTransactionPending() async {
    final walletTransactionListPendingLocal = <WalletTransactionDetail>[];
    isWalletTrnsactionPending(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            methode: METHODE.get,
            isAuthorize: true,
            url: '/user/wallet/transaction?pending=1')
        .then((response) {
      debugPrint('Success $response');
      listFiFOption.clear();
      response['data'].map((e) {
        walletTransactionListPendingLocal
            .add(WalletTransactionDetail.fromJson(e));
      }).toList();
      walletTransactionPendingList.value = walletTransactionListPendingLocal;

      isWalletTrnsactionPending(false);
    }).onError((ErrorModel error, stackTrace) {
      isWalletTrnsactionPending(false);
      debugPrint('Error ${error.statusCode}');
    });
    return walletTransactionPendingList;
  }

// Fetch on Deposit Detail
  final depositDetail = DepositDetail().obs;
  final isDepositDetail = false.obs;
  Future<DepositDetail> onFetchDepositDetail(int id) async {
    isDepositDetail(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'user/wallet/deposit/$id',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      depositDetail.value = DepositDetail.fromJson(response['data']);

      isDepositDetail(false);
    }).onError((ErrorModel error, stackTrace) {
      isDepositDetail(false);
      debugPrint('Error : ${error.statusCode} : ${error.bodyString}');
    });
    return depositDetail.value;
  }

  ///Fetch Wallet Amount
  final walletAmount = WalletDataModel().obs;
  final fetchWalletLoading = false.obs;
  final walletAccount = ''.obs;
  Future<WalletDataModel> fetchWalletAmount() async {
    fetchWalletLoading(true);
    debugPrint("is loading wallet accounnt1");
    try {
      await _apiBaseHelper
          .onNetworkRequesting(
              url: 'user/wallet', methode: METHODE.get, isAuthorize: true)
          .then((response) {
        debugPrint("is loading wallet accounnt2 :$response");
        if (response == null) {
          debugPrint("is loading wallet accounnt222");
          fetchWalletLoading(false);
          walletAccount.value = '';
          update();
        }

        var wallet = response['data'];
        debugPrint("is loading wallet accounnt2 ::$wallet");
        walletAmount.value = WalletDataModel.fromJson(wallet);
        transferModel.value = transferModel.value.copyWith(
          phoneNumber: walletAmount.value.wallet!.accountNumber,
          idQR: walletAmount.value.invester!.investerId,
          userName: walletAmount.value.invester!.investerName,
        );
        debugPrint("is loading wallet accounnt3");
        fetchWalletLoading(false);
      }).onError((ErrorModel error, stackTrace) {
        fetchWalletLoading(false);
        debugPrint(
            'FetchWalletAmount Error : ${error.statusCode} : ${error.bodyString}');
      });
    } catch (e) {
      fetchWalletLoading(false);
      debugPrint("Error$e");
    } finally {
      fetchWalletLoading(false);
    }
    return walletAmount.value;
  }

  // To Deposit Via Bank/Wallet
  void clearDepositAmount() {
    depositAmount.value = '';
  }

  final depositAmount = ''.obs;
  final isToDeposit = false.obs;
  Future<void> onToDepositBankOrWallet(BuildContext context) async {
    debugPrint("wallet is working");
    isToDeposit(true);
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet/deposit',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'amount': onConvertToDouble(depositAmount.value),
      },
    ).then((response) {
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (context) {
            return CustomSucessScreen(
              title: 'Success',
              description: 'The deposit request is submitted',
              buttonTitle: 'Done',
              onPressedButton: () {
                debugPrint("wallet is working1");
                fetchWalletAmount().then(
                  (value) => context.go('/wallet'),
                );
              },
            );
          },
        ),
      );

      depositAmount.value = '';
      isToDeposit(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("Message Error:${error.bodyString}");
      isToDeposit(false);
      customRouterSnackbar(
          title: 'Failed',
          description: '${error.bodyString['message']}',
          type: SnackType.error);
    });
  }

  ///transaction by Qr Code
  Future<void> oscanWalletQr(String amount, String receiver) async {
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'sender': walletAmount.value.wallet!.accountNumber,
        'receiver': '296566817',
        'amount': amount,
      },
    ).then((response) {
      customRouterSnackbar(
          title: 'Done', description: 'Success', type: SnackType.done);
    }).onError((ErrorModel error, stackTrace) {
      customRouterSnackbar(
          title: 'Done', description: 'Success', type: SnackType.error);
    });
  }

  ///Set Amount
  void clearDeposit() {
    recievingAmount('');
    amountController.text = '';
  }

  final recievingAmount = ''.obs;
  TextEditingController amountController = TextEditingController();
  // final frm = NumberFormat("#,###", "en");
  void onchageKeyboard(dynamic value) {
    if (value.isNotEmpty) {
      depositAmount.value = value;
    } else {
      depositAmount.value = '';
    }
    update();
  }

  ///MMA Transfer
  final transferModel = TransferModel(qrType: CiCQr.wallet.key).obs;
  TextEditingController qrRecievingPhone = TextEditingController();
  TextEditingController qrRecievingAmount = TextEditingController();
  TextEditingController remarkTextController = TextEditingController();

  void onScanTransfer(String result) {
    try {
      var decodedResult = TransferModel.fromJson(result);
      qrRecievingPhone.text = decodedResult.phoneNumber ?? '';
      qrRecievingAmount.text = decodedResult.amount ?? '';
      checkValidateAccount();
    } catch (e) {
      debugPrint('Error $e');
    }
  }

  void clearMMATransfer() {
    qrRecievingPhone.text = '';
    qrRecievingAmount.text = '';
    remarkTextController.text = '';
    validateMessage('');
    userFound(false);
  }

  Future<void> transferToOtherMMA(BuildContext context) async {
    debugPrint('AMOUNT = ${qrRecievingAmount.text}');
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet/transaction',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'sender': walletAmount.value.wallet!.accountNumber ?? '',
        'receiver': qrRecievingPhone.text,
        'amount': qrRecievingAmount.text.clean(),
        'description': remarkTextController.value.text
      },
    ).then((response) {
      debugPrint("SUCCESS$response");
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (context) {
            return CustomSucessScreen(
              title: 'Success',
              description: 'The Transfer request is submitted',
              buttonTitle: 'Done',
              onPressedButton: () {
                context.go('/wallet');
                fetchWalletAmount();
              },
            );
          },
        ),
      );
    }).onError(
      (ErrorModel error, _) {
        customRouterSnackbar(
            title: 'Error',
            description: error.bodyString['message'] ?? '',
            type: SnackType.error);
        debugPrint(
            'transferToOtherMMA Error : ${error.statusCode} : ${error.bodyString}  ');
      },
    );
  }

  final _checkValidateLoading = false.obs;
  final validateMessage = ''.obs;
  final userFound = false.obs;
  Future<void> checkValidateAccount() async {
    // String numberSubmit = qrRecievingPhone.text.startsWith('0')
    //     ? '+855${qrRecievingPhone.text.substring(1)}'
    //     : qrRecievingPhone.text;
    _checkValidateLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
      url: 'wallet/verify/Account',
      body: {'receiver_number': qrRecievingPhone.text},
      methode: METHODE.post,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint('checkValidateAccount Success  : $response');
      userFound(response['success']);
      validateMessage(response['receiver_name']);

      _checkValidateLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          'checkValidateAccount Error : ${error.statusCode} : ${error.bodyString}');
      userFound(error.bodyString['success']);
      validateMessage(error.bodyString['message']);

      _checkValidateLoading(false);
    });
  }

  //Exchange Wallet to point
  onClearExchange() {
    pointAmountController.value.text = '';
    inputAmountField.value = '';
    isExchangeValidate.value = true;
    exChangeValidateMessage.value = '';
  }

  final inputAmountField = ''.obs;
  final pointAmountController = TextEditingController().obs;
  final exChangeValidateMessage = ''.obs;
  final isExchangeValidate = true.obs;
  final isExhange = false.obs;
  Future<void> onExchange(BuildContext context) async {
    isExhange(true);
    // Convert string to int(1,500 to 1500)
    var exchangeAmount = pointAmountController.value.text.replaceAll(',', '');
    debugPrint("ACCount id:${walletAmount.value.wallet?.accountId}");

    try {
      await _apiBaseHelper.onNetworkRequesting(
        url: 'point',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'account_id': walletAmount.value.wallet?.accountId,
          'exchange_amount': exchangeAmount,
        },
      ).then((response) {
        context.pushNamed(
          'SuccessScreen',
          queryParams: {
            'title': 'Success',
            'description': 'Exchange successfully',
            'appbarTitle': 'MVP Exchange',
          },
          extra: {
            'onPressedButton': () {
              context.go('/wallet');
              fetchWalletAmount();
              getAllTransaction();
            },
          },
        );
        onClearExchange();
        isExhange(false);

        update();
      }).onError((ErrorModel error, stackTrace) {
        debugPrint("Exchange Error:${error.bodyString}");
        isExhange(false);
        isExchangeValidate(false);
        exChangeValidateMessage.value = error.bodyString['message'] ?? '';
        update();
      });
    } catch (e) {
      isExhange(false);
      debugPrint("on Exchange:$e");
    } finally {
      isExhange(false);
    }
  }

  // Fetch my point
  final isMyPoint = false.obs;
  final myPoint = 0.obs;
  Future onFetchMyPoin() async {
    isMyPoint(true);
    try {
      await _apiBaseHelper
          .onNetworkRequesting(
              url: 'point', methode: METHODE.get, isAuthorize: true)
          .then((response) {
        debugPrint("My Poin::$response");
        var responseJson = response['point_amount'];
        debugPrint("My Poin:1:$responseJson");
        myPoint.value = responseJson;

        isMyPoint(false);
      }).onError((ErrorModel error, stackTrace) {
        isMyPoint(false);
        debugPrint('Error : ${error.statusCode} : ${error.bodyString}');
      });
    } catch (e) {
      debugPrint("Fetch My Point$e");
    } finally {
      isMyPoint(false);
    }
    return myPoint;
  }
  // Point Transaction

  Future<List<ExchangePointTransaction>> onFetchPointTransaction(
      String param) async {
    final tempList = <ExchangePointTransaction>[];

    try {
      await _apiBaseHelper
          .onNetworkRequesting(
              methode: METHODE.get,
              isAuthorize: true,
              url: 'point/transaction?$param')
          .then((response) {
        debugPrint('Success  $response');
        response['data'].map((e) {
          tempList.add(ExchangePointTransaction.fromJson(e));
        }).toList();
      }).onError((ErrorModel error, _) {
        debugPrint('Error ${error.statusCode}');
      });
    } catch (e) {
      debugPrint("Point Transaction$e");
    } finally {}
    return tempList;
  }

  // MVP Reward Transaction
  List<ExchangePointTransaction> mvpRewardTransactionList =
      <ExchangePointTransaction>[];
  final isMVPRewardTransaction = false.obs;
  Future<List<ExchangePointTransaction>> mvpRewardTransaction() async {
    isMVPRewardTransaction(true);
    List<ExchangePointTransaction> tempList = <ExchangePointTransaction>[];
    tempList = await onFetchPointTransaction('type=reward');
    isMVPRewardTransaction(false);
    mvpRewardTransactionList = tempList;
    return mvpRewardTransactionList;
  }

  // MVP Recent Activities Transaction
  List<ExchangePointTransaction> recentActivitiesTransactionList =
      <ExchangePointTransaction>[];
  final isRecentActivitiesTransaction = false.obs;
  Future<List<ExchangePointTransaction>> recentActivitiesTransaction() async {
    isRecentActivitiesTransaction(true);
    List<ExchangePointTransaction> tempList = <ExchangePointTransaction>[];
    tempList = await onFetchPointTransaction('type=reward');
    isRecentActivitiesTransaction(false);
    recentActivitiesTransactionList = tempList;
    return recentActivitiesTransactionList;
  }
}
