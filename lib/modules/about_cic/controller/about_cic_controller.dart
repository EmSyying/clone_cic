import 'dart:convert';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/about_cic/model/about_cic_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../../../core/flavor/flavor_configuration.dart';

class AboutCICController extends GetxController {
  AboutCICModel aboutCICModel = AboutCICModel();
  List<AboutCICModel> aboutCicList = <AboutCICModel>[];

  Future<List<AboutCICModel>> fetchAboutCicList() async {
    var token = await LocalData.getCurrentUser();
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}about-company';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        aboutCicList.clear();
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          responseJson.map((e) {
            aboutCICModel = AboutCICModel.fromJson(e);
            if (!aboutCicList.contains(aboutCICModel)) {
              aboutCicList.add(aboutCICModel);
            }
          }).toList();
        } else {}
      });
    } finally {}
    return aboutCicList;
  }

  @override
  void onInit() {
    fetchAboutCicList();
    super.onInit();
  }
}
