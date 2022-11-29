import 'package:cicgreenloan/modules/member_directory/models/filter_option.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/utils/helper/option_model/option_form.dart';
import 'package:cicgreenloan/utils/select_address/address_model/document_type.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/flavor/flavor_configuration.dart';
import '../helper/option_model/option_data.dart';

class DocumentCategory extends GetxController {
  final documentType = DocumentType().obs;
  final documentTypeList = <DocumentTypes>[].obs;
  final fieldOfStudyList = <DocumentType>[].obs;
  final degreeList = <DocumentType>[].obs;
  final reportList = <DocumentType>[].obs;
  final reportListByType = <DocumentType>[].obs;
  final documentBytype = DocumentType().obs;
  final subreportList = <DocumentTypes>[].obs;
  final positionList = <DocumentType>[].obs;
  final optionFormFilterList = <OptionFormFilter>[].obs;
  final nationalList = <DocumentType>[].obs;
  final relationShip = <DocumentType>[].obs;
  final identityTypeList = <DocumentType>[].obs;
  final genderList = <DocumentType>[].obs;
  final shiftWorkList = <DocumentType>[].obs;
  final optionFilter = OptionFormFilter().obs;
  final filterByTypeList = <OptionFormFilter>[].obs;
  final optionFormTypeList = <OptionForm>[].obs;
  final copyFilterByTyeList = <OptionFormFilter>[].obs;
  // final optionList = <DocumentType>[].obs;

  final optionData = OptionData().obs;
  final filterByType = OptionFormFilter().obs;

  final isLoading = false.obs;
  final isloadingMore = false.obs;
  final isLoadingOption = false.obs;
  final page = 1.obs;
  final tokenKey = ''.obs;
  final isNomoreData = false.obs;
  final currentPage = 0.obs;
  final isEmty = false.obs;
  final documentTypeId = 0.obs;

  Future<List<DocumentTypes>> fetchDocumentCategory() async {
    var token = await LocalData.getCurrentUser();

    isLoading(true);
    final documentType = DocumentTypes().obs;

    String url = '${FlavorConfig.instance.values!.apiBaseUrlV3}option';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['document_types'];
          var responseJson = json.decode(response.body);
          nationalList.clear();
          if (responseJson['nationality'] != null) {
            responseJson['nationality'].map(
              (jsonData) {
                nationalList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }
          genderList.clear();
          if (responseJson['gender'] != null) {
            responseJson['gender'].map(
              (jsonData) {
                genderList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }

          documentTypeList.clear();
          responseData.map(
            (jsonData) {
              documentType.value = DocumentTypes.fromJson(jsonData);
              if (documentType.value.display != "CiC App Manual") {
                documentTypeList.add(documentType.value);
              }
              // documentTypeList.add(documentType.value);
            },
          ).toList();

          degreeList.clear();
          if (responseJson['degree'] != null) {
            responseJson['degree'].map(
              (jsonData) {
                degreeList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }
          reportList.clear();
          if (responseJson['document_types'] != null) {
            responseJson['document_types'].map(
              (jsonData) {
                documentBytype.value = DocumentType.fromJson(jsonData);
                reportListByType.add(DocumentType.fromJson(jsonData));
                if (documentBytype.value.display != "CiC App Manual") {
                  reportList.add(documentBytype.value);
                }
              },
            ).toList();
            reportListByType.map((type) {
              if (type.display == "CiC App Manual") {
                documentTypeId.value = type.id!;
              }
            }).toList();
          }

          fieldOfStudyList.clear();
          if (responseJson['field_of_study'] != null) {
            responseJson['field_of_study'].map(
              (jsonData) {
                fieldOfStudyList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }
          identityTypeList.clear();
          if (responseJson['identity_type'] != null) {
            responseJson['identity_type'].map(
              (jsonData) {
                identityTypeList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }

          positionList.clear();
          if (responseJson['position'] != null) {
            responseJson['position'].map(
              (jsonData) {
                positionList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }
          shiftWorkList.clear();
          if (responseJson['shift_works'] != null) {
            responseJson['shift_works'].map(
              (jsonData) {
                shiftWorkList.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }
          relationShip.clear();
          if (responseJson['relationship'] != null) {
            responseJson['relationship'].map(
              (jsonData) {
                relationShip.add(DocumentType.fromJson(jsonData));
              },
            ).toList();
          }

          // optionList.clear();
          // if (responseJson['shift_works'] != null) {
          //   responseJson['shift_works'].map(
          //     (jsonData) {
          //       optionList.add(DocumentType.fromJson(jsonData));
          //     },
          //   ).toList();
          // }
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return documentTypeList;
  }

//  FetchFilterOption

  Future<List<OptionFormFilter>> fetchFiltersOption() async {
    // var _token = await LocalData.getCurrentUser();
    final optionFormFilterLocal = OptionFormFilter().obs;

    final optionFormFilterListLocal = <OptionFormFilter>[].obs;
    isLoading(true);
    String url = '${FlavorConfig.instance.values!.apiBaseUrlV2}option';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['directory_filter'];

          responseData.map(
            (jsonData) {
              optionFormFilterLocal.value = OptionFormFilter.fromJson(jsonData);

              optionFormFilterListLocal.add(optionFormFilterLocal.value);

              optionFormFilterList.value = optionFormFilterListLocal;
            },
          ).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return optionFormFilterList;
  }

  Future<List<OptionFormFilter>> fetchFilterOptionByType(String type) async {
    var token = await LocalData.getCurrentUser();
    final filterByTypeLocal = OptionFormFilter().obs;

    final filterByTypeListLocal = <OptionFormFilter>[].obs;
    isLoading(true);
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV2}fetch-option-by-type?type=$type';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['data'];
          responseData.map(
            (jsonData) {
              filterByTypeLocal.value = OptionFormFilter.fromJson(jsonData);
              //    print('Response Json: $jsonData');
              filterByTypeListLocal.add(filterByTypeLocal.value);

              filterByTypeList.value = filterByTypeListLocal;
            },
          ).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return filterByTypeList;
  }

  Future<List<OptionFormFilter>> searchDataByOption(
      {String? type, String? search}) async {
    var token = await LocalData.getCurrentUser();

    // print('Page Number : $pageNumber');
    final searchDataByOptionList = <OptionFormFilter>[].obs;
    final searchDataByOption = OptionFormFilter().obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV2}option/search?type=$type&&search=$search';

    try {
      isLoading(true);
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['data'];
          responseData.map(
            (jsonData) {
              searchDataByOption.value = OptionFormFilter.fromJson(jsonData);

              searchDataByOptionList.add(searchDataByOption.value);
              filterByTypeList.value = searchDataByOptionList;
            },
          ).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return filterByTypeList;
  }

  Future<List<OptionForm>> optionForm(String type) async {
    var token = await LocalData.getCurrentUser();
    final optionForm = OptionForm().obs;
    isLoading(true);
    final optionFormList = <OptionForm>[].obs;
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrlV2}fetch-option-by-type?type=$type';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['data'];
          responseData.map(
            (jsonData) {
              optionForm.value = OptionForm.fromJson(jsonData);

              optionFormList.add(optionForm.value);

              optionFormTypeList.value = optionFormList;
            },
          ).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return optionFormTypeList;
  }

  Future<OptionData> fetchAllOptions() async {
    var token = await LocalData.getCurrentUser();
    isLoadingOption(true);
    String url = '${FlavorConfig.instance.values!.apiBaseUrlV3}option';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);

          optionData.value = OptionData.fromJson(responseJson);
        } else {
          isLoadingOption(false);
        }
      });
    } catch (e) {
      isLoadingOption(false);
    }
    isLoadingOption(false);
    return optionData.value;
  }

  @override
  void onInit() {
    fetchDocumentCategory();
    fetchFiltersOption();
    super.onInit();
  }
}
