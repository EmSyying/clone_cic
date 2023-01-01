import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/api_base_helper.dart';
import 'model/all_guide_model.dart';
import 'model/guide_model.dart';

class CiCGuidController extends GetxController {
  final isDisplayGuideLine = false.obs;
  List<GuidelineModel> investmentFiF = <GuidelineModel>[
    GuidelineModel(
        title: 'Total Investment in USD',
        description:
            'Here vou can see vour current total CiC Fixed Income Fund investment'),
    GuidelineModel(
        title: 'Invest More',
        description: 'Create a new Fixed Income Fund application'),
  ];
  List<GuidelineModel> investmentKey = <GuidelineModel>[
    GuidelineModel(
        title: 'View CiC Equity Fund',
        description:
            'Quickly check your CiC equity fund by just switching the tab'),
    GuidelineModel(
        title: 'UT Information',
        description:
            'View the current UT price, price evolution, and your total UT'),
    GuidelineModel(
        title: 'Certificate',
        description: 'View or download your investor certificate'),
    GuidelineModel(
        title: 'UT Price Evolution',
        description:
            'See UT price evolution, filter quarterly, yearly, or all time'),
    GuidelineModel(
        title: 'CiC Fixed Income Fund',
        description:
            'Quickly check your CiC Fixed Income Fund by just switching the tab'),
  ];

  List<GuidelineModel> utTrading = <GuidelineModel>[
    GuidelineModel(
      title: 'Trading Status',
      description: 'Letting you know whether trading is open or close',
    ),
    GuidelineModel(
      title: 'Trading Date and Time',
      description: 'Display trading date and time',
    ),
    GuidelineModel(
      title: 'Minimum Price',
      description:
          'Display the recommended minimum UT trading price on the trading date',
    ),
    GuidelineModel(
      title: 'Base Price',
      description: 'Display the current UT price on trading date',
    ),
    GuidelineModel(
      title: 'Maximum Price',
      description:
          'Display the recommended maximum UT trading price on the trading date',
    ),
    GuidelineModel(
      title: 'View Last Trading',
      description:
          'View trading related information and last trading information',
    ),
    GuidelineModel(
      title: 'Buy In',
      description: 'Click this button then it take you to UT buy screen',
    ),
    GuidelineModel(
      title: 'Sell Out',
      description: 'Click this button then it take you to UT sell screen',
    ),
  ];
  List<GuidelineModel> getFundingGuide = <GuidelineModel>[
    GuidelineModel(
      title: 'Equity Investment',
      description: 'Check your equity investment by just switching the tab',
    ),
    GuidelineModel(
      title: 'Debt Investment',
      description: 'Check your debt investment by just switching the tab',
    ),
  ];
  List<GuidelineModel> directoryGuide = <GuidelineModel>[
    GuidelineModel(
      title: 'Search',
      description: 'Here vou can search for specific members of CiC',
    ),
    GuidelineModel(
      title: 'Filter',
      description: 'You can filter member directory here',
    ),
  ];
  List<GuidelineModel> reportGuide = <GuidelineModel>[
    GuidelineModel(
      title: 'Investor',
      description: 'Read Investor Report here',
    ),
    GuidelineModel(
      title: 'Publications',
      description: 'Read Publications here',
    ),
    GuidelineModel(
      title: 'Others',
      description: 'Read other documents here',
    ),
    GuidelineModel(
      title: 'Newsletter',
      description: 'Read Newsletter here',
    ),
    GuidelineModel(
      title: 'Tax & Legal',
      description: 'Read Tax & Legal documets here',
    ),
    GuidelineModel(
      title: 'Whitepaper',
      description: 'Read Whitepaper here',
    ),
  ];
  List<GuidelineModel> walletGuide = <GuidelineModel>[
    GuidelineModel(
      title: 'Deposit',
      description:
          'Deposit fund to your MM account via wallets, banks, or from other MM account',
    ),
    GuidelineModel(
      title: 'Transfer',
      description:
          'Transfer our fund to your bank of choices, or to other MM account',
    ),
    GuidelineModel(
      title: 'Invest',
      description:
          'Here you can invest in CiC Fixed Income Fund, or CiC Equity Fund',
    ),
    GuidelineModel(
      title: 'Pay',
      description: 'Here you can Pay to any Merchant connected with CiC',
    ),
  ];

  final _apibasehelper = ApiBaseHelper();

  AllGuideLine _allGuidLineList = AllGuideLine();

  Future<AllGuideLine> fetchGuide() async {
    await _apibasehelper
        .onNetworkRequesting(
      url: 'guideline',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      _allGuidLineList = AllGuideLine.fromJson(response['body']);
    }).onError((ErrorModel error, _) {
      debugPrint('Error Guide ${error.bodyString}');
    });

    return _allGuidLineList;
  }

  List<GuideModel> get bonus => _allGuidLineList.bonus ?? [];
  List<GuideModel> get directory => _allGuidLineList.directory ?? [];
  List<GuideModel> get investment => _allGuidLineList.investment ?? [];
  List<GuideModel> get report => _allGuidLineList.report ?? [];
  List<GuideModel> get trading => _allGuidLineList.trading ?? [];

  bool get showBonus => _allGuidLineList.bonus?.length == 5 ? true : false;

  // List<GuideModel> equityFundGuide = <GuideModel>[];

}

class GuidelineModel {
  GlobalKey? key;
  String? title;
  String? description;
  GuidelineModel({
    this.key,
    this.title,
    this.description,
  });
}
