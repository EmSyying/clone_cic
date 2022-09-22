import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CiCGuidController extends GetxController {
  var investmentKey = [
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
