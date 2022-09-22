import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CiCGuidController extends GetxController {
  List<GuidelineModel> investmentKey = <GuidelineModel>[
    GuidelineModel(
        title: 'CiC Equity Fund',
        description: 'This tab contains UT Information and UT Evolution'),
    GuidelineModel(
        title: 'UT Information', description: 'Here are information about UT.'),
    GuidelineModel(
        title: 'Certificate',
        description:
            'Here you can view and download your digital Certificate.'),
    GuidelineModel(
        title: 'UT Price Evolution',
        description: 'Here are Evolution of UT price from previous year.'),
    GuidelineModel(
        title: 'CiC Fixed Income Fund',
        description:
            'Here is Fixed Income investment plateform where you can invest up to 50M\$'),
  ];

  List<GuidelineModel> utTrading = <GuidelineModel>[
    GuidelineModel(
      title: 'Trading Status',
      description: 'Here is Trading Status indicator.',
    ),
    GuidelineModel(
      title: 'Trading Date and Time',
      description: 'Here is specific datetime for our Trading Hour.',
    ),
    GuidelineModel(
      title: 'Minimum Price',
      description: 'Here is minimum price of UT during Trading Hour.',
    ),
    GuidelineModel(
      title: 'Base Price',
      description: 'Here is base price of UT during Trading Hour.',
    ),
    GuidelineModel(
      title: 'Maximum Price',
      description: 'Here is max price of UT during Trading Hour.',
    ),
    GuidelineModel(
      title: 'View Last Trading',
      description: 'Here is you can view all your last trading record.',
    ),
    GuidelineModel(
      title: 'Buy In',
      description: 'Click this button then it take you to UT buy screen.',
    ),
    GuidelineModel(
      title: 'Sell Out',
      description: 'Click this button then it take you to UT sell screen.',
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
