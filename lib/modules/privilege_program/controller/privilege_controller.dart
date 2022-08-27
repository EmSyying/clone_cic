import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/option_model/option_form.dart';
import '../model/category_model/model_categories.dart';
import '../model/location/location.dart';
import '../model/search_loation_list/search_location_list.dart';
import '../model/stores_model/model_pre.dart';

class PrivilegeController extends GetxController {
  final favoritesList = <StoreModel>[].obs;
  final optionSelecList = <OptionForm>[].obs;
  final isSelectFilter = false.obs;
  final selectedCategFil = ''.obs;

  ////function getListShop======
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  final shopModel = PrivilegeShopModel().obs;
  final shopModelList = <PrivilegeShopModel>[].obs;
  final isFavorites = false.obs;
  final isLoadingShopList = false.obs;
  Future<List<PrivilegeShopModel>> onFetchAllStore() async {
    isLoadingShopList(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/shop',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      shopModelList.clear();
      responseJson.map((e) {
        shopModel.value = PrivilegeShopModel.fromJson(e);
        debugPrint('heloooo12345:${shopModel.value.isFavorite}');
        shopModelList.add(shopModel.value);
      }).toList();
      isLoadingShopList(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingShopList(false);
    });

    return shopModelList;
  }

  // Search Shop/Store
  final searchShop = PrivilegeShopModel().obs;
  final searchShopList = <PrivilegeShopModel>[].obs;
  final searLocationModel = SearchLocationListModel().obs;
  final searchLocationList = <SearchLocationListModel>[].obs;
  final isSearchLoading = false.obs;
  Future<List<PrivilegeShopModel>> onSearchStores(
      {String? keySearch, bool isLocation = false}) async {
    debugPrint("is location $isLocation");
    isSearchLoading(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: isLocation == false
          ? 'privilege/global/search?queries=$keySearch'
          : 'privilege/global/search?queries=$keySearch&location=true',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      if (isLocation == true) {
        searchLocationList.clear();
        responseJson.map((e) {
          searLocationModel.value = SearchLocationListModel.fromJson(e);

          searchLocationList.add(searLocationModel.value);
        }).toList();
      } else {
        shopModelList.clear();
        responseJson.map((e) {
          searchShop.value = PrivilegeShopModel.fromJson(e);

          searchShopList.add(searchShop.value);
        }).toList();
      }
      isSearchLoading(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isSearchLoading(false);
    });

    return searchShopList;
  }

  ///Fetch Favourite Store
  final isLoadingFav = false.obs;
  final favshopModelList = <PrivilegeShopModel>[].obs;

  Future<List<PrivilegeShopModel>> onFetchFavouriteStore() async {
    isLoadingFav(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/shop?favorite=1',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      favshopModelList.clear();
      responseJson.map((e) {
        favshopModelList.add(PrivilegeShopModel.fromJson(e));
      }).toList();
      isLoadingFav(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingFav(false);
    });

    return favshopModelList;
  }

  ///Set Favourite Store
  Future setFavouriteStore({required num id, required bool fav}) async {
    apiBaseHelper
        .onNetworkRequesting(
          url: 'privilege/shop/$id',
          methode: METHODE.update,
          isAuthorize: true,
          body: {"is_favorite": fav ? 0 : 1},
        )
        .then(
          (value) {},
        )
        .onError((ErrorModel error, stackTrace) {
          debugPrint('setFavouriteStore : ${error.statusCode}');
        });
  }

  ////function onFetchShopDetail
  final shopDetailModel = PrivilegeShopModel().obs;
  final isLoadingShopDetail = false.obs;
  Future<PrivilegeShopModel> onFetchShopDetail(num? id) async {
    debugPrint("Privilege 1");
    isLoadingShopDetail(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/shop/$id',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      // debugPrint("Resonse body json privilege:$response");

      var responseJson = response['data'];
      shopDetailModel.value = PrivilegeShopModel.fromJson(responseJson);
      // debugPrint(
      //     "Privilege Data:${shopDetailModel.value.openingDays![0].dayName}");

      isLoadingShopDetail(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingShopDetail(false);
    });
    return shopDetailModel.value;
  }

  ////function onFetchCategories

  final categoriesModelList = <ModelsCategories>[].obs;
  final isLoadingCategories = false.obs;
  Future<List<ModelsCategories>> onFetchCategories() async {
    isLoadingCategories(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/category',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint('Categories========200===');
      var responseJson = response['data'];
      categoriesModelList.clear();
      debugPrint('Categories data:===${responseJson!}');
      responseJson.map((e) {
        categoriesModelList.add(
          ModelsCategories.fromJson(e),
        );
        debugPrint('Categories=====name:${categoriesModelList[0].name}');
      }).toList();

      isLoadingCategories(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint('categories error=======${errorModel.bodyString}}');
      isLoadingCategories(false);
    });

    return categoriesModelList;
  }

  // category & location filter
  final locationName = "".obs;
  final isLoadingCategoryFilter = false.obs;
  final categoryFilterModel = PrivilegeShopModel().obs;
  final categoryFilterList = <PrivilegeShopModel>[].obs;

  Future<List<PrivilegeShopModel>> onFilterByCategoriesByLocation(
      {String? location, int? categoryId}) async {
    debugPrint("Filter is working");
    isLoadingCategoryFilter(true);
    apiBaseHelper
        .onNetworkRequesting(
            url: 'privilege/filer?location=$location&category=$categoryId',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responseJson = response['data'];
      shopModelList.clear();
      categoryFilterList.clear();
      responseJson.map((e) {
        shopModel.value = PrivilegeShopModel.fromJson(e);

        categoryFilterList.add(shopModel.value);
        shopModelList.add(shopModel.value);
      }).toList();
      debugPrint("categoryFilterList:${categoryFilterList.length}");
      isLoadingCategoryFilter(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingCategoryFilter(false);
    });

    return shopModelList;
  }

  // On Select Filter
  final sectedLicationList = <PrivilageLocation>[].obs;
  final locationCodeList = <dynamic>[].obs;
  final categoriesId = 0.obs;

  onSelected(
      {int? index, PrivilageLocation? location, String? unSelectedItem}) {
    // Assign value check or not(true/fale)
    if (locationPrivilageList[index!].isSelected == false) {
      locationPrivilageList[index] =
          locationPrivilageList[index].copyWith(isSelected: true);
    } else {
      locationPrivilageList[index] =
          locationPrivilageList[index].copyWith(isSelected: false);
    }
    if (locationPrivilageList[index].isSelected == true) {
      // Add items to selected list
      sectedLicationList.add(location!);
      locationCodeList.clear();
      sectedLicationList.map((element) {
        // Add location code to list
        locationCodeList.add(element.code);
      }).toList();
    } else {
      locationCodeList.removeWhere((element) => element == unSelectedItem);
    }

    String right =
        locationCodeList.toString().trim().trimRight().replaceAll(']', "");
    String locationCode =
        right.toString().trim().trimRight().replaceAll('[', "");
// Filter by Location and Categories
    onFilterByCategoriesByLocation(
        location: locationCode, categoryId: categoriesId.value);
    update();
  }

  onClearSelected() {
    locationPrivilageList.asMap().entries.map((e) {
      locationPrivilageList[e.key] = e.value.copyWith(isSelected: false);
    }).toList();

    locationCodeList.clear();
    locationCodeList.refresh();
    categoryFilterList.clear();

    update();
  }

  //get location
  final isLoadingPriLocation = false.obs;
  final locationPrivilageModel = PrivilageLocation().obs;
  final locationPrivilageList = <PrivilageLocation>[].obs;
  Future<List<PrivilageLocation>> onFetchStoreLocation() async {
    isLoadingPriLocation(true);
    apiBaseHelper
        .onNetworkRequesting(
            url: 'privilege/address?page=2',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      var responeJson = response['data'];
      locationPrivilageList.clear();
      responeJson.map((e) {
        locationPrivilageModel.value = PrivilageLocation.fromJson(e);
        locationPrivilageList.add(locationPrivilageModel.value);
        isLoadingPriLocation(false);
      }).toList();
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingPriLocation(false);
    });

    return locationPrivilageList;
  }
}
