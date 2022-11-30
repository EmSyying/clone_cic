// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Flavor { DEV, PRE, PRODUCTION }

class FlavorValues {
  FlavorValues(
      {required this.baseUrl,
      required this.apiBaseUrl,
      required this.mainApiUrl,
      required this.baseUrlV2,
      required this.apiBaseUrlV2,
      required this.mainApiUrlV2,
      required this.apiBaseUrlV3});
  final String baseUrl;
  final String apiBaseUrl;
  final String mainApiUrl;
  final String baseUrlV2;
  final String apiBaseUrlV2;
  final String mainApiUrlV2;
  final String apiBaseUrlV3;
  //Add other flavor specific values, e.g database name
}

//  "base_url": "https://cicstaging.z1central.com/",
//   "api_base_url": "https://cicstaging.z1central.com/api/v1/",
//   "main_api_url": "https://cicstaging.z1central.com/api/",
//   "base_urlv2": "https://cicstaging.z1central.com/",
//   "api_base_urlv2": "https://cicstaging.z1central.com/api/v2/",
//   "main_api_urlv2": "https://cicstaging.z1central.com/api/",
//   "api_base_urlv3": "https://cicstaging.z1central.com/api/v3/"
class FlavorConfig {
  final Flavor? flavor;
  final String? name;
  final Color? color;
  final FlavorValues? values;
  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      Color color = Colors.blue,
      required FlavorValues values}) {
    _instance ??=
        FlavorConfig._internal(flavor, flavor.toString(), color, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;
  static bool isQA() => _instance!.flavor == Flavor.PRE;
}
