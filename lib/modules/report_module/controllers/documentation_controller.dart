import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DocumentationController extends GetxController {
  final documentationModel = DocumentationModel();
  List<DocumentationModel> documentationList = <DocumentationModel>[];
  final isLoading = false.obs;
  String? tokenKey;

  Future<List<DocumentationModel>> getDocumentList(String docType) async {
    tokenKey = await LocalData.getCurrentUser();
    DocumentationModel documentModel = DocumentationModel();
    List<DocumentationModel> documentationList = <DocumentationModel>[];
    documentationList.clear();
    try {
      isLoading(true);
      final String url =
          '${GlobalConfiguration().get('api_base_urlv3')}documentation-by-type?type=$docType';
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
          '${GlobalConfiguration().get('api_base_url')}documentation';
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
