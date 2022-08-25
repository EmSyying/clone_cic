import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/option_model/option_form.dart';
import '../model/category_model/model_categories.dart';
import '../model/location/location.dart';
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
  final isSearchLoading = false.obs;
  Future<List<PrivilegeShopModel>> onSearchStores({String? keySearch}) async {
    isSearchLoading(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/global/quiries?name=$keySearch',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      shopModelList.clear();
      responseJson.map((e) {
        searchShop.value = PrivilegeShopModel.fromJson(e);

        searchShopList.add(searchShop.value);
      }).toList();
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

  ////function onFetchShopDetail======
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

    onFilterByCategoriesByLocation(location: locationCode);
    update();
  }

  onClearSelected() {
    locationPrivilageList.asMap().entries.map((e) {
      locationPrivilageList[e.key] = e.value.copyWith(isSelected: false);
    }).toList();

    locationCodeList.clear();
    locationCodeList.refresh();

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

  final listAllStores = <StoreModel>[
    StoreModel(
      steusTitle: 'OPEN NOW',
      titleStores: 'Champei Spa',
      description:
          'Turpis nisl et facilisis aliquam, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam.',
      location: 'Sangkat Tuek Thla',
      descLocation: 'Sangkat Tuek Thla,Sangkat Tuek Thla,Sangkat Tuek Thla',
      imageStores:
          'https://ecs7.tokopedia.net/img/cache/800/ANWSwT/2021/12/6/30801d63-152b-4f97-9f60-1ab6624dba97.jpg',
      numberPercentage: 40,
      logoCard: 'assets/images/privilege/image_card_detail.png',
      titleServTab: 'Description',
      ourTitle: 'Our Service',
      titleDes: 'Traditional Khmer Massage',
      descDetail:
          'Oil free massage that concentrates on pressure points and gentle stretching palm and thumbs are applied to pressure points for relieving tired muscles and improving blood circulation.',
    ),
    StoreModel(
      steusTitle: 'OPEN NOW',
      titleStores: 'Pizza Hut',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam.',
      location: 'Preak Ta Sek',
      descLocation: 'Preak Ta Sek, Phnom Penh, Preak Ta Sek, Phnom Penh',
      imageStores: 'https://pbs.twimg.com/media/E_5sA_QUcAsgDhg.jpg',
      numberPercentage: 50,
      logoCard: 'assets/images/privilege/image_card_detail.png',
      titleServTab: 'Description',
      ourTitle: 'Our Service',
      titleDes: 'Traditional Khmer Massage',
      descDetail:
          'Oil free massage that concentrates on pressure points and gentle stretching palm and thumbs are applied to pressure points for relieving tired muscles and improving blood circulation.',
    ),
    StoreModel(
      steusTitle: 'CLOSED',
      titleStores: 'Park Cafe',
      description:
          'Gravida sit tortor nisl fringilla porttitor viverra scelerisque, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida sit tortor nisl fringilla porttitor viverra scelerisque. Turpis nisl et facilisis aliquam.',
      location: 'Toul tom pung',
      descLocation:
          'Timberland, Shop G38, G/F, Mikiki, No. 638 Prince Edward Road East',
      imageStores:
          'https://images.deliveryhero.io/image/fd-kh/LH/t0oo-hero.jpg',
      numberPercentage: 15,
      logoCard: 'assets/images/privilege/image_card_detail.png',
      titleServTab: 'Description',
      ourTitle: 'Our Service',
      titleDes: 'Traditional Khmer Massage',
      descDetail:
          'Oil free massage that concentrates on pressure points and gentle stretching palm and thumbs are applied to pressure points for relieving tired muscles and improving blood circulation.',
    ),
  ].obs;
}
