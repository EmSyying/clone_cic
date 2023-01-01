import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Utils/helper/api_base_helper.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../models/model_categories_report/categories_report_model.dart';
import '../models/model_detail_report/reports_group_by_year.model.dart';
import '../models/model_list_report/list_report_model.dart';

class DocumentationController extends GetxController {
  final documentationModel = DocumentationModel();
  //Categories report Model======
  List<DocumentationModel> documentationList = <DocumentationModel>[];
  final isLoading = false.obs;
  String? tokenKey;

  ///Category report
  final listCategoryCardReport = <CategorieReportModel>[].obs;
  CategorieReportModel cardCategoryReport = CategorieReportModel();
  final loadingCardReport = false.obs;
  final _apiBasehelper = ApiBaseHelper();
  Future<List<CategorieReportModel>> fetchCategoriesCardReport() async {
    loadingCardReport(true);
    await _apiBasehelper
        .onNetworkRequesting(
      url: 'documentation/category/card',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      listCategoryCardReport.clear();
      debugPrint('Categories card report :===${response!}');

      response['data'].map((e) {
        cardCategoryReport = CategorieReportModel.fromJson(e);
        if (cardCategoryReport.category?.toLowerCase() != "cic app manual") {
          listCategoryCardReport.add(cardCategoryReport);
        }

        // listCategoryCardReport = listCategoryCardReport;
        // listCategoryCardReport.add(
        //   CategorieReportModel.fromJson(e),
        // );
      }).toList();
      debugPrint(
          'Categories report name========:${listCategoryCardReport[0].category}');

      loadingCardReport(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint('categories report error=======${errorModel.bodyString}}');
      loadingCardReport(false);
    });

    return listCategoryCardReport;
  }

//Report group by years
  onClearSearch() {
    modelReportGroupByYear.clear();

    textSearchController.clear();
  }

  final modelReportGroupByYear = <ListReportModel>[].obs;
  final getTitle = ''.obs;
  final isLoadingReportFile = false.obs;
  final TextEditingController textSearchController = TextEditingController();
  Future<void> fetchReportFileByYear(int? id, String? keySearch) async {
    isLoadingReportFile(true);
    await _apiBasehelper
        .onNetworkRequesting(
      methode: METHODE.get,
      isAuthorize: true,
      url: 'documentation/list?category_id=$id&term=$keySearch',
    )
        .then((response) {
      debugPrint('Report group by file :===${response!}');
      modelReportGroupByYear.clear();
      response['data'].map((e) {
        modelReportGroupByYear.add(ListReportModel.fromJson(e));
      }).toList();

      // modelReportGroupByYear.value.reports!.map((value) {
      //   getTitle.value = value.title!;
      // }).toList();

      isLoadingReportFile(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint('Report group error:======${errorModel.bodyString}');
      isLoadingReportFile(false);
    });
  }

// function search report by term
  // final searchReport = ListReportModel().obs;
  // final searchReportList = <ListReportModel>[].obs;
  // final searchReportLoading = false.obs;
  // final TextEditingController textSearchController = TextEditingController();
  // Future<List<ListReportModel>> onSearchReport() async {
  //   searchReportLoading(true);
  //   await _apiBasehelper
  //       .onNetworkRequesting(
  //     url: 'documentation/list?category_id=98&term=05',
  //     methode: METHODE.get,
  //     isAuthorize: true,
  //   )
  //       .then((response) {
  //     debugPrint('Report Search function data:===${response!}');
  //     var responseJson = response['data'];
  //     searchReportList.clear();
  //     responseJson.map((e) {
  //       searchReport.value = ListReportModel.fromJson(e);
  //       searchReportList.add(searchReport.value);
  //     }).toList();
  //     debugPrint('Report Search key reports :===${searchReportList.length}');
  //     searchReportLoading(false);
  //   }).onError((ErrorModel errorModel, stackTrace) {
  //     debugPrint('Report error :===${errorModel.bodyString}');
  //     searchReportLoading(false);
  //   });

  //   return searchReportList;
  // }

  Future<List<ReportGroupByYearModel>> getDocumentList(String docType) async {
    tokenKey = await LocalData.getCurrentUser();
    ReportGroupByYearModel documentModel = ReportGroupByYearModel();
    List<ReportGroupByYearModel> documentationList = <ReportGroupByYearModel>[];
    documentationList.clear();
    try {
      isLoading(true);
      final String url =
          '${FlavorConfig.instance.values!.apiBaseUrl}documentation-by-type?type=$docType';
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenKey'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          responseJson.map((e) {
            documentModel = ReportGroupByYearModel.fromJson(e);
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
          '${FlavorConfig.instance.values!.apiBaseUrl}documentation';
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
