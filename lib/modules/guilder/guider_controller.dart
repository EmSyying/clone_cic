import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CiCGuidController extends GetxController {
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
