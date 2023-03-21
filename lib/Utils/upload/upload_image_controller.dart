import 'dart:convert';

import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/flavor/flavor_configuration.dart';
import '../function/get_sharepreference_data.dart';

class UploadImageController extends GetxController {
  final _httpClient = GetConnect(timeout: const Duration(seconds: 10));

  set setTimeOut(Duration duration) => _httpClient.timeout = duration;

  Future<dynamic> uploadImage({
    required String endPoint,
    required Map<String, dynamic>? body,
  }) async {
    final String baseurl = FlavorConfig.instance.values!.apiBaseUrl;
    final token = await LocalData.getCurrentUser();

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = baseurl + endPoint;

    try {
      final response = await _httpClient.post(
        url,
        json.encode(body),
        headers: header,
      );

      debugPrint('===> ${response.bodyString}');

      final statusCode = response.statusCode;
      final responseBody = await json.decode(response.bodyString ?? '');
      if (statusCode != null &&
          (statusCode == 200 || statusCode == 201 || statusCode == 202)) {
        return responseBody;
      } else {
        return Future.error(
          ErrorModel(
            statusCode: statusCode,
            bodyString: responseBody,
          ),
        );
      }
    } catch (e) {
      debugPrint('Uploading fail => $e');
      return Future.error(
        ErrorModel(
          statusCode: null,
          bodyString: e,
        ),
      );
    }
  }
}
