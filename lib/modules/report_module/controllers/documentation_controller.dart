import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/flavor/flavor_configuration.dart';
import '../models/catigories_card_report_model.dart';

class DocumentationController extends GetxController {
  final documentationModel = DocumentationModel();
  //Categories report Model======
  List<DocumentationModel> documentationList = <DocumentationModel>[];
  final isLoading = false.obs;
  String? tokenKey;
  final List<CategoriesCardReportModel> listCategoriesReport = [
    CategoriesCardReportModel(
        title: 'Investor', icons: 'assets/images/investor.svg', item: '16'),
    CategoriesCardReportModel(
        title: 'Whitepaper', icons: 'assets/images/whitepaper.svg', item: '9'),
    CategoriesCardReportModel(
        title: 'Publications',
        icons: 'assets/images/publications.svg',
        item: '8'),
    CategoriesCardReportModel(
        title: 'Newsletter', icons: 'assets/images/newsletter.svg', item: '5'),
    CategoriesCardReportModel(
        title: 'Tax & Legal', icons: 'assets/images/tax_legal.svg', item: '18'),
    CategoriesCardReportModel(
        title: 'Others', icons: 'assets/images/others.svg', item: '0'),
  ].obs;

  Future<List<DocumentationModel>> getDocumentList(String docType) async {
    tokenKey = await LocalData.getCurrentUser();
    DocumentationModel documentModel = DocumentationModel();
    List<DocumentationModel> documentationList = <DocumentationModel>[];
    documentationList.clear();
    try {
      isLoading(true);
      final String url =
          '${FlavorConfig.instance.values!.apiBaseUrlV3}documentation-by-type?type=$docType';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          responseJson.map((e) {
            documentModel = DocumentationModel.fromJson(e);
            documentationList.add(documentModel);
            documentationList = documentationList;
          }).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return documentationList;
  }

  Future<List<DocumentationModel>> getallDocument() async {
    tokenKey = await LocalData.getCurrentUser();
    try {
      documentationList.clear();
      isLoading(true);
      final String url =
          '${FlavorConfig.instance.values!.apiBaseUrlV3}documentation';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          responseJson.map((e) {
            var doc = DocumentationModel.fromJson(e);
            if (!documentationList.contains(doc)) {
              documentationList.add(doc);
            }
          }).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return documentationList;
  }
}
