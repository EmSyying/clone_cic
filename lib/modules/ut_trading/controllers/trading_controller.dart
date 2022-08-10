import 'dart:async';
import 'dart:convert';
import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/ut_trading/models/cic_equity_fun.dart';
import 'package:cicgreenloan/modules/ut_trading/models/instruction.dart';
import 'package:cicgreenloan/modules/ut_trading/models/last_trading_card_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/last_trading_date_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/market_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_data.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

class InquiryController extends GetxController {
  final isSubmitting = false.obs;
  final isLoadingPrice = false.obs;
  InquiryData inquiryData = InquiryData();
  final sharePrice = CiCEquityFun().obs;
  final inquiryModel = InquiryModel();
  final inquiryList = <InquiryModel>[].obs;
  final videoTradingData = VideoPost().obs;
  final videoTradingList = <VideoPost>[];
  final isLoadingMore = false.obs;
  final isVideoTrading = false.obs;
  final isloading = false.obs;
  final isLoadingAll = false.obs;
  final page = 0.obs;

  late Future<List<InquiryModel>> inquiryFuture;
  late Future futureList;
  late Future allFutureList;
  late Future sellFuture;
  final isLoadingMarket = false.obs;
  final isLoadingInquiry = false.obs;
  final isValidateNumberShare = true.obs;
  final isValidatedPriceShare = true.obs;

  List<InquiryModel> listinquiryData = [];
  List<InquiryModel> listInquiryallData = [];
  //data store submit
  final demandInfo = ''.obs;
  final qtyShare = 0.0.obs;
  final priceShare = 0.0.obs;
  final operation = ''.obs;
  final selectTrade = 1.obs;
  final specificMember = Member().obs;
  late TabController tabController;
  final tapcurrentIndex = 0.obs;

  final isInstructionLoading = false.obs;
  final isSelect = false.obs; // test select last trading
  final lastTradinInfoIndex = 0.obs; // te
  final initTabNumber = 0.obs;
  final tabIndex = 0.obs;
  final idOption = 0.obs;
  final isInitSelct = true.obs;
  MarketModel marketData = MarketModel();
  Instruction instructionData = Instruction();
  TradingSettingModel tradingSettingData = TradingSettingModel();

  final constomerController = Get.put(CustomerController());
  Future<void> onRefresh() async {
    tabController.index == 2
        ? getInquiryList(
            'cancelled',
            '',
            constomerController.customer.value.customerId.toString(),
          )
        : tabController.index == 1
            ? getInquiryList(
                'upsuccess',
                '',
                constomerController.customer.value.customerId.toString(),
              )
            : getInquiryList(
                'success',
                '',
                constomerController.customer.value.customerId.toString(),
              );
    getTradingSetting();
    getSharePrice();
    getInquiryListAll(constomerController.customer.value.customerId.toString());
  }

  String? tokenKey;
  final operationType = ''.obs;
  Future<void> onSubmitInquiry(
      BuildContext context,
      String operation,
      double qty,
      double price,
      String description,
      int id,
      String marketID) async {
    if (operation == 'buy') {
      operationType.value = 'Buy';
    } else {
      operationType.value = 'Sell';
    }

    tokenKey = await LocalData.getCurrentUser();
    isSubmitting(true);
    String url = '${GlobalConfiguration().get('api_base_urlv2')}trading';
    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }, body: {
        'description': description.toString(),
        'market_id': marketID,
        'member_id': '$id',
        'operation': operation,
        'number_of_share': '$qty',
        'price': '$price',
        'trading_with':
            selectTrade.value == 2 ? 'specific-platform' : 'cic-platform',
        'target_member':
            selectTrade.value == 2 ? '${specificMember.value.id!}' : '',
      }).then((response) {
        if (response.statusCode == 200) {
          Get.snackbar("${operationType.value} Request",
              "Your ${operationType.value} request submitted successfully.",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xff60AD00),
              colorText: Colors.white,
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: Text(
                '${operationType.value} Request',
                style: const TextStyle(color: Colors.white),
              ),
              messageText: Text(
                'Your ${operationType.value} request submitted successfully.',
                style: const TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context);
            Navigator.pop(context, true);
          });
          onRefresh();
          update();
        } else if (response.statusCode == 422) {
          Get.snackbar("${operationType.value} Request", "",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Submit Trading Failed',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'The given data was invalid.',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);

          update();
        } else {
          Get.snackbar("${operationType.value} Request",
              'The mininum UT to trade is ${tradingSettingData.data!.minNumberOfShareForSelling!} UT.',
              borderRadius: 8,
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: Text(
                '${operationType.value} Request',
                style: const TextStyle(color: Colors.white),
              ),
              messageText: Text(
                'The mininum UT to trade is ${tradingSettingData.data!.minNumberOfShareForSelling!} UT.',
                style: const TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } finally {
      isSubmitting(false);
    }
  }

  onDeleteInquiry(int id) async {
    isSubmitting(true);

    String url = '${GlobalConfiguration().get('api_base_urlv2')}trading/$id';
    try {
      await http.delete(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          Get.snackbar("", "Your Trade was cancel Successful...!",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xff60AD00),
              colorText: Colors.white,
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Canceled Trading',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'Your Trade was cancel Successful...!',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
          onRefresh();
          update();
        } else {
          Get.snackbar("", "Trading Deleted Failed...!",
              borderRadius: 8,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(10),
              overlayBlur: 3.0,
              titleText: const Text(
                'Delete Trading',
                style: TextStyle(color: Colors.white),
              ),
              messageText: const Text(
                'Trading Deleted Failed...!',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }
      });
    } finally {
      isSubmitting(false);
    }
  }

  Future<void> onUpdate(
      BuildContext context,
      String operation,
      double qty,
      num price,
      String description,
      int id,
      int inquiryId,
      String marketID,
      String tradingWith,
      num? targetWith) async {
    tokenKey = await LocalData.getCurrentUser();
    isSubmitting(true);
    String url =
        '${GlobalConfiguration().get('api_base_urlv2')}trading/$inquiryId';

    try {
      await http.put(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }, body: {
        'description': description.toString(),
        'operation': operation,
        'number_of_share': '$qty',
        'price': '$price',
        'member_id': '$id',
        "market_id": marketID,
        'trading_with': tradingWith == 'specific-platform'
            ? 'specific-platform'
            : 'cic-platform',
        'target_member': targetWith != null ? '$targetWith' : '',
      }).then(
        (response) {
          if (response.statusCode == 200) {
            Get.snackbar("", "Trading Updated Successful...!",
                borderRadius: 8,
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.green,
                colorText: Colors.white,
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                snackPosition: SnackPosition.TOP,
                margin: const EdgeInsets.all(10),
                overlayBlur: 3.0,
                titleText: Text(
                  '${operation.capitalize} Request',
                  style: const TextStyle(color: Colors.white),
                ),
                messageText: Text(
                  'Your ${operation.capitalize} request updated successfully.',
                  style: const TextStyle(color: Colors.white),
                ),
                snackStyle: SnackStyle.FLOATING);
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pop(context, true);
            });
            onRefresh();
            update();
          } else {
            Get.snackbar("", "Trading Updated Failed...!",
                borderRadius: 8,
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
                colorText: Colors.white,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                snackPosition: SnackPosition.TOP,
                margin: const EdgeInsets.all(10),
                overlayBlur: 3.0,
                titleText: const Text(
                  'Updted Trading',
                  style: TextStyle(color: Colors.white),
                ),
                messageText: const Text(
                  'Trading Updated Failed...!',
                  style: TextStyle(color: Colors.white),
                ),
                snackStyle: SnackStyle.FLOATING);
          }
        },
      );
    } finally {
      isSubmitting(false);
    }
  }

  Future<List<InquiryModel>> getInquiryData() async {
    page.value = 0;
    tokenKey = await LocalData.getCurrentUser();
    isSubmitting(true);
    String url =
        '${GlobalConfiguration().getValue('api_base_url')}inquiry?page=${(page.value + 1).toString()}';
    try {
      if (page.value != 0) {
        isLoadingMore(true);
      }
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          inquiryData = InquiryData.fromJson(responseJson);

          inquiryList.clear();
          if (!inquiryList.contains(inquiryModel)) {
            inquiryList.addAll(inquiryData.data!);
          }

          page.value = inquiryData.meta!.currentPage!;
        }
      });
    } finally {
      isSubmitting(false);
    }
    return inquiryList;
  }

  getmarkt() async {
    tokenKey = await LocalData.getCurrentUser();
    try {
      String url = '${GlobalConfiguration().getValue('api_base_urlv2')}market';
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          marketData = MarketModel();
          marketData = MarketModel.fromJson(responseJson['data']);
        } else {}
      });
    } finally {
      // update();
    }
  }

  Future<TradingSettingModel> getTradingSetting() async {
    isLoadingMarket(true);
    tokenKey = await LocalData.getCurrentUser();
    try {
      String url =
          '${GlobalConfiguration().getValue('api_base_urlv2')}trading-setting';
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          tradingSettingData = TradingSettingModel.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingMarket(false);
    }
    return tradingSettingData;
  }

  Future<List<InquiryModel>> getInquiryListAll(String memberID) async {
    isLoadingInquiry(true);
    tokenKey = await LocalData.getCurrentUser();
    InquiryModel _inquiryModel = InquiryModel();
    List<InquiryModel> _inquiryList = <InquiryModel>[];
    listinquiryData.clear();
    try {
      final String url =
          '${GlobalConfiguration().get('api_base_urlv2')}trading?type=all&member_id=$memberID';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          listInquiryallData.clear();
          var responseJson = json.decode(response.body)['data'];
          responseJson.map((e) {
            _inquiryModel = InquiryModel.fromJson(e);
            _inquiryList.add(_inquiryModel);
            listInquiryallData = _inquiryList;
          }).toList();
        } else {}
      });
    } finally {
      isLoadingInquiry(false);
    }
    return listInquiryallData;
  }

  final isLoadingInquiryMatch = false.obs;
  final isLoadingInquiryUnsucess = false.obs;
  final isLoadingInquiryCancel = false.obs;
  Future<List<InquiryModel>> getInquiryList(
    String type,
    String? operation,
    String memberID,
  ) async {
    if (type == 'success' || type == 'all') {
      isLoadingInquiryMatch(true);
    } else if (type == 'upsuccess' || operation == 'buy') {
      isLoadingInquiryUnsucess(true);
    } else {
      isLoadingInquiryCancel(true);
    }
    tokenKey = await LocalData.getCurrentUser();
    InquiryModel _inquiryModel = InquiryModel();
    List<InquiryModel> _inquiryList = <InquiryModel>[];
    listinquiryData.clear();
    try {
      final String url = type != '' && operation != ''
          ? '${GlobalConfiguration().get('api_base_urlv2')}trading?type=$type&operation=$operation&member_id=$memberID'
          : type == ''
              ? '${GlobalConfiguration().get('api_base_urlv2')}trading?operation=$operation&member_id=$memberID'
              : '${GlobalConfiguration().get('api_base_urlv2')}trading?type=$type&member_id=$memberID';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          responseJson.map((e) {
            _inquiryModel = InquiryModel.fromJson(e);
            _inquiryList.add(_inquiryModel);

            listinquiryData = _inquiryList;
          }).toList();
        } else {}
      });
    } finally {
      if (type == 'success' || type == 'all') {
        isLoadingInquiryMatch(false);
      } else if (type == 'upsuccess' || operation == 'buy') {
        isLoadingInquiryUnsucess(false);
      } else {
        isLoadingInquiryCancel(false);
      }
    }
    return listinquiryData;
  }

  Future<CiCEquityFun> getSharePrice() async {
    final client = http.Client();
    isLoadingPrice(true);
    tokenKey = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get('api_base_urlv2')}investment-available-fund';
    try {
      await client.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${tokenKey!}'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          sharePrice.value = CiCEquityFun.fromJson(responseJson);
        }
      });
    } finally {
      isLoadingPrice(false);
      client.close();
    }
    return sharePrice.value;
  }

  Future<Instruction> getInstruction() async {
    tokenKey = await LocalData.getCurrentUser();
    isInstructionLoading.value = true;
    try {
      String url =
          '${GlobalConfiguration().getValue('api_base_urlv2')}trading-instruction';
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          instructionData = Instruction.fromJson(responseJson);
        } else {}
      });
    } finally {
      isInstructionLoading.value = false;
    }
    return instructionData;
  }

  final apiBaseHelper = ApiBaseHelper();

  Future<List<VideoPost>> getVideoTrading() async {
    page.value = 0;
    tokenKey = await LocalData.getCurrentUser();
    isVideoTrading(true);
    String url =
        '${GlobalConfiguration().getValue('api_base_urlv2')}trading-video?page=1}';

    try {
      // if (page.value != 0) {
      //   isLoadingMore(true);
      // }
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          videoTradingList.clear();

          responseJson.map((e) {
            videoTradingData.value = VideoPost.fromJson(e);
            videoTradingList.add(videoTradingData.value);
          }).toList();
        }
      });
    } finally {
      isVideoTrading(false);
    }
    return videoTradingList;
  }

  final lastTradingInfoModel = TradingOption().obs;
  final lastTradingOptionModelList = <TradingOption>[].obs;
  final islastTrading = false.obs;

  Future<List<TradingOption>> fetchLastTradingOption() async {
    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}trading-last-session';

    try {
      islastTrading(true);
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];

          lastTradingOptionModelList.clear();

          responseJson.map((json) {
            lastTradingInfoModel.value = TradingOption.fromJson(json);

            lastTradingOptionModelList.add(lastTradingInfoModel.value);
          }).toList();
        } else {}
      });
    } finally {
      islastTrading(false);
    }

    return lastTradingOptionModelList;
  }

  final lastTradingCardModel = TradingCardData().obs;
  final isLoadingCard = false.obs;
  Future<TradingCardData> fetchLastTradingDetail({int? id}) async {
    isLoadingCard(true);

    tokenKey = await LocalData.getCurrentUser();

    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}trading-last-session-info/$id';
    try {
      http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          lastTradingCardModel.value = TradingCardData.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingCard(false);
    }
    return lastTradingCardModel.value;
  }
}
