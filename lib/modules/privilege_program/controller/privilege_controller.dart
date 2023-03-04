import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/modules/privilege_program/model/payment_summary.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/store_branch_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/format_Number.dart';
import '../../../Utils/helper/option_model/option_form.dart';

import '../../../utils/helper/custom_route_snackbar.dart';
import '../../../utils/helper/pagination/pagination_model.dart';
import '../../google_map_module/controllers/google_map_controller.dart';
import '../model/category_model/model_categories.dart';
import '../model/history/model_history_privilege.dart';
import '../model/location/location.dart';
import '../model/mvp_history_model/mpv_history_model.dart';
import '../model/search_loation_list/search_location_list.dart';
import '../model/slide_privilege/privilege_slide_model.dart';
import '../model/stores_model/model_pre.dart';
import '../model/stores_model/privilege_data_model.dart';
import '../model/stores_model/store_home_data_model.dart';

class PrivilegeController extends GetxController {
  final favoritesList = <StoreModel>[].obs;
  final optionSelecList = <OptionForm>[].obs;
  final isSelectFilter = false.obs;
  final selectedCategFil = ''.obs;
  final categoryId = 0.obs;
  final storeHomeDataModel = StoreHomeDataModel().obs;
  final storeBranchMetaModel = StoreBranchMetaModel().obs;
  final storeBranchList = <StoreBranchModel>[].obs;
  final isLoadingstoreBranch = false.obs;
  final isHasStoreMoreLoading = false.obs;
  final storeBranchListPage = 1.obs;
  final numberOfBranch = "".obs;
  final googleMapCon = Get.put(GoogleMapsController());
//Refreshscreen====F
  Future<void> onRefreshPrivilege() async {
    await onFetchCategories();
    await onFetchStoreData(0, shopPage, filterString: filterString.value);
    // await onFetchFavouriteStore();
    // shopPage = 1;
    // onFetchStoreData(1, shopPage);
  }

  ////function getListShop======
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  final shopModel = PrivilegeShopModel().obs;
  final shopModelList = <PrivilegeShopModel>[].obs;

  final isLoadingShopList = false.obs;
  final isLoadingMoreShop = false.obs;
  final segmentedControlValue = 0.obs;
  final privilegeShopData = PrivilegeDataModel().obs;
  String? next;
  final storeAmount = 0.obs;
  // Future<List<PrivilegeShopModel>> onFetchAllStore(int page) async {
  //   debugPrint("Page Number: $page");
  //   if (page == 1) {
  //     isLoadingShopList(true);
  //     isLoadingMoreShop(false);
  //   } else {
  //     isLoadingShopList(false);
  //     isLoadingMoreShop(true);
  //   }
  //   debugPrint(
  //       'Success Page: $page More: ${isLoadingMoreShop.value} Shimmer: ${isLoadingShopList.value}');
  //   try {
  //     await apiBaseHelper
  //         .onNetworkRequesting(
  //       url:
  //           'privilege/shop?page=$page&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}',
  //       methode: METHODE.get,
  //       isAuthorize: true,
  //     )
  //         .then(
  //       (response) {
  //         privilegeShopData.value = PrivilegeDataModel.fromJson(response);

  //         // ignore: iterable_contains_unrelated_type
  //         if (!shopModelList.contains(privilegeShopData.value.data)) {
  //           shopModelList.addAll(privilegeShopData.value.data!);
  //         }

  //         shopModelList.map((amount) {
  //           storeAmount.value = amount.numberShop!.toInt();
  //         }).toList();
  //       },
  //     ).onError(
  //       (ErrorModel errorModel, stackTrace) {
  //         isLoadingShopList(false);
  //         return null;
  //       },
  //     );
  //   } catch (_) {
  //   } finally {
  //     isLoadingShopList(false);
  //     isLoadingMoreShop(false);
  //   }

  //   return shopModelList;
  // }

  ///Fetch MVP Transaction History
  final mvpTransactionHistoryLoading = false.obs;
  final mvpTransactionHistoryLoadingMore = false.obs;
  final listTransactionHistory = <MVPHistoryModel>[].obs;

  PaginationModel paginationModel = PaginationModel();

  void _noLoading() {
    mvpTransactionHistoryLoading(false);
    mvpTransactionHistoryLoadingMore(false);
  }

  Future<void> onFetchMVPTransactionHistory(
      {required String id, String filter = '', int page = 1}) async {
    if (page == 1) {
      mvpTransactionHistoryLoading(true);
      mvpTransactionHistoryLoadingMore(false);
    } else {
      mvpTransactionHistoryLoading(false);
      mvpTransactionHistoryLoadingMore(true);
    }

    await apiBaseHelper
        .onNetworkRequesting(
            url:
                'privilege/transaction-history?shop_id=$id&filter=$filter&page=$page',
            methode: METHODE.get,
            isAuthorize: true)
        .then((value) {
      debugPrint('Scroll Data : $value');
      if (page == 1) {
        listTransactionHistory([]);
      }

      paginationModel = PaginationModel.fromJson(value['meta']);

      value['data'].map((e) {
        listTransactionHistory.add(MVPHistoryModel.fromJson(e));
      }).toList();

      _noLoading();
    }).onError((ErrorModel error, _) {
      debugPrint('OnFetchMVPTransactionHistory Error : ${error.bodyString}');
      _noLoading();
    });
  }

  ///Allstore Pagination

  int shopPage = 1;
  bool onNotification(ScrollEndNotification scrollNotification) {
    if (scrollNotification.metrics.pixels ==
        scrollNotification.metrics.maxScrollExtent) {
      if (privilegeShopData.value.links!.next != null) {
        shopPage++;
        isLoadingMoreShop(true);
        debugPrint("Hello onnotification");
        onFetchStoreData(segmentedControlValue.value, shopPage,
            filterString: filterString.value);
      } else {
        isLoadingMoreShop(false);
      }
    }
    return true;
  }

  // Search Shop/Store======

  onClearSearch() {
    searchLocationList.clear();
    searchShopList.clear();
    textSearchController.clear();
  }

  Future<void> onFetchHomeStoreData() async {
    await apiBaseHelper
        .onNetworkRequesting(
            isAuthorize: true,
            methode: METHODE.get,
            url: "privilege/store-home-page")
        .then((value) {
      debugPrint("Hello world1");
      storeHomeDataModel.value = StoreHomeDataModel.fromJson(value);
    });
  }

  Future<void> onFetchNumberOfBranch() async {
    await apiBaseHelper
        .onNetworkRequesting(
            isAuthorize: true,
            methode: METHODE.get,
            url: "privilege/number-branches")
        .then((value) {
      numberOfBranch(value["number_of_branches"]);
    });
  }

  Future<void> onFetchShopBranchItemList(int page) async {
    debugPrint("PAGE: $page");
    if (page == 1) {
      isLoadingstoreBranch(true);
      isHasStoreMoreLoading(false);
      debugPrint("isHasStoreMoreLoading${isHasStoreMoreLoading.string}");
    } else {
      isLoadingstoreBranch(false);
      isHasStoreMoreLoading(true);
    }

    await apiBaseHelper
        .onNetworkRequesting(
            isAuthorize: true,
            methode: METHODE.get,
            url: "privilege/list-branches?page=$page")
        .then((value) {
      if (value["meta"] != null) {
        storeBranchMetaModel.value =
            StoreBranchMetaModel.fromJson(value["meta"]);
      }
      if (!isHasStoreMoreLoading.value) {
        storeBranchList.value.clear();
      }
      debugPrint("LENGTH=${storeBranchList.value.length}");

      value["data"]
          .map((json) =>
              storeBranchList.value.add(StoreBranchModel.fromJson(json)))
          .toList();
      debugPrint("After=${storeBranchList.value.length}");

      isLoadingstoreBranch(false);
      isHasStoreMoreLoading(false);
      // storeBranchList.addAll();
    }).onError((ErrorModel error, stackTrace) {
      isLoadingstoreBranch(false);
      isHasStoreMoreLoading(false);

      debugPrint("error${error.statusCode}");
    });
  }

  final searchShop = PrivilegeShopModel().obs;
  final searchShopList = <PrivilegeShopModel>[].obs;
  final searLocationModel = SearchLocationListModel().obs;
  final searchLocationList = <SearchLocationListModel>[].obs;
  final isSearchLoading = false.obs;
  final TextEditingController textSearchController = TextEditingController();
  //final isScreenSearch = false.obs;

  Future<List<PrivilegeShopModel>> onSearchStores(
      {String? keySearch, bool isLocation = false}) async {
    debugPrint("is location $isLocation");
    isSearchLoading(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: isLocation == false
          ? 'privilege/global/search?origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}&queries=$keySearch'
          : 'privilege/global/search?origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}&queries=$keySearch&location=true',
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
        searchShopList.clear();
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

  // Future<void> onFetchFavouriteStore() async {
  //   isLoadingFav(true);

  //   await apiBaseHelper
  //       .onNetworkRequesting(
  //     url: 'privilege/shop?favorite=true',
  //     methode: METHODE.get,
  //     isAuthorize: true,
  //   )
  //       .then((response) {
  //     var responseJson = response['data'];
  //     favshopModelList.clear();

  //     responseJson.map((e) {
  //       favshopModelList.add(PrivilegeShopModel.fromJson(e));
  //     }).toList();
  //     isLoadingFav(false);
  //   }).onError((ErrorModel errorModel, stackTrace) {
  //     isLoadingFav(false);
  //   });
  // }

  final isLoadingStoreListing = true.obs;
  final shopPrivilegeList = <PrivilegeShopModel>[];
  final filterString = "".obs;
  Future<void> onFetchStoreData(int index, int page,
      {String filterString = ""}) async {
    // isLoadingStoreListing(true);
    var url = "";
    if (page == 1) {
      shopPrivilegeList.clear();
      isLoadingStoreListing(true);
      isLoadingMoreShop(false);
    } else {
      isLoadingStoreListing(false);
      isLoadingMoreShop(true);
    }
    debugPrint("INDEX===$index");
    switch (index) {
      case 0:
        url =
            'privilege/shop?page=$page&filter=$filterString&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}';
        break;
      case 1:
        url = "privilege/shop?page=$page&favorite=true&filter=$filterString";
        break;
      default:
        url =
            'privilege/shop?page=$page&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}';
        break;
    }
    await apiBaseHelper
        .onNetworkRequesting(
      url: url,
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      debugPrint("responseJson$responseJson");

      privilegeShopData.value = PrivilegeDataModel.fromJson(response);

      // ignore: iterable_contains_unrelated_type
      if (!shopPrivilegeList.contains(privilegeShopData.value.data)) {
        debugPrint("Hello");
        shopPrivilegeList.addAll(privilegeShopData.value.data!);
      }

      shopPrivilegeList.map((amount) {
        storeAmount.value = amount.numberShop!.toInt();
      }).toList();
      // shopPrivilegeList.clear();

      // responseJson.map((e) {
      //   shopPrivilegeList.add(PrivilegeShopModel.fromJson(e));
      // }).toList();
      debugPrint("shopPrivilegeList${shopPrivilegeList.length}");

      isLoadingMoreShop(false);

      isLoadingStoreListing(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingStoreListing(false);
      isLoadingMoreShop(false);
    });
  }

  ///function Put Set Favourite Store=====
  Future setFavouriteStore({required num id, required bool boolFav}) async {
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/shop/$id?is_favorite=${!boolFav}',
      methode: METHODE.update,
      body: {},
      isAuthorize: true,
    )
        .then(
      (value) {
        debugPrint('bool favorite==:$boolFav');
      },
    ).onError((ErrorModel error, stackTrace) {
      debugPrint('setFavouriteStore : ${error.statusCode}');
    });
  }

  ////function onFetchShopDetail
  final shopDetailModel = PrivilegeShopModel().obs;
  final isLoadingShopDetail = false.obs;
  Future<PrivilegeShopModel> onFetchShopDetail(num? id) async {
    debugPrint("Privilege 1 detail is work $id");
    isLoadingShopDetail(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/shop/$id',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint("Resonse body json privilege:$response");

      var responseJson = response['data'];
      debugPrint("Response Json Data: $responseJson");
      shopDetailModel.value = PrivilegeShopModel.fromJson(responseJson);
      update();
      // debugPrint(
      //     "Privilege Data:${shopDetailModel.value.openingDays![0].dayName}");

      isLoadingShopDetail(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingShopDetail(false);
    });
    return shopDetailModel.value;
  }

  ///onFetch Categories shop

  final categoriesModelList = <ModelsCategories>[].obs;
  final isLoadingCategories = false.obs;
  Future<List<ModelsCategories>> onFetchCategories() async {
    isLoadingCategories(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url:
          'privilege/category?origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}',
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
        // debugPrint('Categories name========:${categoriesModelList[0].name}');
      }).toList();
      debugPrint('Categories data:===2');

      isLoadingCategories(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint('categories error=======${errorModel.bodyString}}');
      isLoadingCategories(false);
    });

    return categoriesModelList;
  }

  ///History privilege
  final privilegeHistoryList = <PrivilegeHistoryModel>[].obs;
  final isLoadingHistory = false.obs;
  Future<List<PrivilegeHistoryModel>> onFetchPrivilegeHistory() async {
    isLoadingHistory(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/payment-history',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      // debugPrint('status 200-===history:');

      var responseJson = response['data'];
      privilegeHistoryList.clear();
      //debugPrint('data history=====:$responseJson');
      responseJson.map((e) {
        privilegeHistoryList.add(PrivilegeHistoryModel.fromJson(e));
      }).toList();
      //debugPrint('history work===:');
      isLoadingHistory(false);
    }).onError((error, stackTrace) {
      // debugPrint('error history===:');
      isLoadingHistory(false);
    });
    return privilegeHistoryList;
  }

  ///history shop data
  final storeHistoryData = StoreHomeDataModel().obs;
  Future<void> fetchHistoryShopData(String id) async {
    await apiBaseHelper.onNetworkRequesting(
      isAuthorize: true,
      methode: METHODE.get,
      url: "privilege/transaction-history",
      body: {
        'id': id,
      },
    ).then((value) {
      storeHistoryData.value = StoreHomeDataModel.fromJson(value);
    }).onError(
      (ErrorModel error, _) {
        debugPrint('Error fetchHistoryShopData() : ${error.statusCode}');
      },
    );
  }

  /////search categories shop
  final categoriesListSeeAll = <ModelsCategories>[].obs;
  final isLoadingSearchCate = false.obs;
  Future<List<ModelsCategories>> onSearchCategories(String? keySearch) async {
    isLoadingSearchCate(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url:
          'privilege/category?term=$keySearch&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      categoriesListSeeAll.clear();

      responseJson.map((e) {
        categoriesListSeeAll.add(
          ModelsCategories.fromJson(e),
        );
      }).toList();

      isLoadingSearchCate(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingSearchCate(false);
    });
    return categoriesListSeeAll;
  }

  // category & location filter
  final locationName = "".obs;
  final locationCode = "".obs;
  final isLoadingCategoryFilter = false.obs;
  final categoryFilterModel = PrivilegeDataModel().obs;
  final categoryFilterList = <PrivilegeShopModel>[].obs;

  final pageNoForSearchResult = 1.obs;
  final isLoadingResultSearch = false.obs;

  Future<List<PrivilegeShopModel>> onFilterByCategoriesByLocation(
      {String? location, int? categoryId, int? page}) async {
    if (page == 1) {
      isLoadingCategoryFilter(true);
      isLoadingResultSearch.value = false;
    } else {
      isLoadingResultSearch.value = true;
      isLoadingCategoryFilter(false);
    }

    try {
      await apiBaseHelper
          .onNetworkRequesting(
              url: location == null
                  ? 'privilege/filer?page=$page&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}&category=$categoryId'
                  : 'privilege/filer??page=$page&location=$location&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}&category=$categoryId',
              methode: METHODE.get,
              isAuthorize: true)
          .then((response) {
        var responseJson = response['data'];
        categoryFilterModel.value = PrivilegeDataModel.fromJson(response);
        // ignore: iterable_contains_unrelated_type
        if (!categoryFilterList.contains(categoryFilterModel.value.data)) {
          categoryFilterList.addAll(categoryFilterModel.value.data!);
        }

        shopModelList.clear();
        // categoryFilterList.clear();
        // responseJson.map((e) {
        //   shopModel.value = PrivilegeShopModel.fromJson(e);
        //   categoryFilterList.add(shopModel.value);
        //   shopModelList.add(shopModel.value);
        // }).toList();
      }).onError((ErrorModel errorModel, stackTrace) {
        // if (page == 1) {
        //   isLoadingCategoryFilter(true);
        //   isLoadingResultSearch.value = false;
        // } else {
        //   isLoadingResultSearch.value = true;
        //   isLoadingCategoryFilter(false);
        // }
      });
    } catch (ex) {
      //
    } finally {
      isLoadingCategoryFilter(false);
      isLoadingResultSearch(false);
    }

    return categoryFilterList;
  }

  // On Select Filter

  final locationCodeList = <dynamic>[].obs;
  final categoriesId = 0.obs;

  void onSelected({int? index, String? selectedItemCode}) async {
    // Assign value check or not(true/fale)
    if (locationPrivilageList[index!].isSelected == false) {
      locationPrivilageList[index] =
          locationPrivilageList[index].copyWith(isSelected: true);
    } else {
      locationPrivilageList[index] =
          locationPrivilageList[index].copyWith(isSelected: false);
    }
    if (locationPrivilageList[index].isSelected == true) {
      locationCodeList.add(selectedItemCode);
    } else {
      locationCodeList.removeWhere((element) => element == selectedItemCode);
    }
    debugPrint('Location Req = $locationCodeList');
    String allLocation = locationCodeList
        .toString()
        .trim()
        .trimRight()
        .replaceAll('[', "")
        .replaceAll(']', "");
    debugPrint('Location Req = $allLocation');

// Filter by Location and Categories
    categoryFilterList.clear();
    await onFilterByCategoriesByLocation(
      location: allLocation,
      categoryId: categoriesId.value,
    );
    update();
  }

  void onClearSelected() {
    locationCodeList.clear();
    categoryFilterList.clear();
    selectedCategFil('');
    locationPrivilageList.asMap().entries.map((e) {
      locationPrivilageList[e.key] = e.value.copyWith(isSelected: false);
    }).toList();

    update();
  }

  //get location
  final isLoadingPriLocation = false.obs;
  final locationPrivilageModel = PrivilageLocation().obs;
  final locationPrivilageList = <PrivilageLocation>[].obs;
  final isShowMore = true.obs;
  Future<List<PrivilageLocation>> onFetchStoreLocation(int page) async {
    isLoadingPriLocation(true);
    apiBaseHelper
        .onNetworkRequesting(
            url: 'privilege/address?page=$page',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      isShowMore.value =
          response['meta']['current_page'] != response['meta']['last_page'];
      var responeJson = response['data'];
      locationPrivilageList.clear();
      if (page == 1) {
        locationPrivilageList.clear();
      }
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

  final page = 1.obs;
  seeMore() {
    if (isShowMore.value) {
      page.value += 1;
      onFetchStoreLocation(page.value);
    } else {
      page.value = 1;
      onFetchStoreLocation(1);
    }
  }

  ///Function Payment privilege=========
  final amountcontroller = TextEditingController().obs;
  final isPaymentLoading = false.obs;
  final shopId = 0.obs;
  final privilegeAmount = ''.obs;
  final validationPayment = false.obs;

  void validatePayment(String onchangeValue) {
    if (onchangeValue.isEmpty) {
      validationPayment(true);
    } else {
      validationPayment(false);
    }
  }

  void clearPaymentSetting() {
    //validationPayment.value = false;
    privilegeAmount.value = '';
    amountcontroller.value.text = '';
  }

  ////function onFetch categorh item
  final shopCategoryItemList = <PrivilegeShopModel>[].obs;
  final isLoadingCateItem = false.obs;
  final shopCategoryItem = PrivilegeShopModel().obs;
  Future<List<PrivilegeShopModel>> onFetchCategoryItem(int? id) async {
    isLoadingCateItem(true);
    debugPrint("catagories id====:$id");
    await apiBaseHelper
        .onNetworkRequesting(
            url:
                'privilege/shop-by?category_id=$id&origin=${googleMapCon.currentLatStore.value},${googleMapCon.currentLngStore.value}',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      debugPrint("Shop Categories item:$response");
      // var responeJson = jsonDecode(response['data']);
      shopCategoryItemList.clear();
      // debugPrint("category item===:$responeJson");
      response['data'].map((e) {
        shopCategoryItem.value = PrivilegeShopModel.fromJson(e);
        shopCategoryItemList.add(shopCategoryItem.value);
      }).toList();
      isLoadingCateItem(false);
      debugPrint("category item===add=:${shopCategoryItemList.length}");
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint("category item===error");
      isLoadingCateItem(false);
    });

    return shopCategoryItemList;
  }

//==slide Priviege===
  final privilegeSlideList = <PrivilegeSlideModel>[].obs;
  final slideList = PrivilegeSlideModel().obs;
  final isLoadingSlidePri = false.obs;
  Future<List<PrivilegeSlideModel>> fetchPrivilegeSlide() async {
    isLoadingSlidePri(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'slide?module=privilege',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint('Staus 200=====');
      var responseJson = response['data'];
      privilegeSlideList.clear();
      debugPrint('Slide privilege::List=====$responseJson');

      responseJson.map((e) {
        slideList.value = PrivilegeSlideModel.fromJson(e);
        // debugPrint('heloooo12345:${shopModel.value.isFavorite}');
        privilegeSlideList.add(slideList.value);
      }).toList();

      isLoadingSlidePri(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      debugPrint('errr=======slide===');
      isLoadingSlidePri(false);
    });
    return privilegeSlideList;
  }

  ///OnPaymentPrivilege=====================
  final fourDigitsCode = "".obs;
  final descountRate = "".obs;
  final messagePayment = "".obs;
  Future<void> onPaymentPrivilege({BuildContext? context, int? id}) async {
    debugPrint("Shop Id====:${shopId.value}");
    debugPrint("Amount====:${privilegeAmount.value}");
    isPaymentLoading(true);
    await apiBaseHelper.onNetworkRequesting(
        url: 'privilege/payment/via-cash',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "shop_id": id,
        }).then((response) {
      debugPrint("4 Digits code:$response");
      debugPrint('Clicked  ${GoRouter.of(context!).location}');

      // context.push('/privilege-payment/$shopId/payment-done-screen');

      try {
        debugPrint('payment body::=====$response');
        var responseJson = response;
        fourDigitsCode.value = responseJson['code'];
        descountRate.value = responseJson['descount_rate'];
        messagePayment.value = responseJson['message'];
      } catch (e) {
        debugPrint('Error $e');
      }

      clearPaymentSetting();
      isPaymentLoading(false);
    }).onError(
      (ErrorModel errorModel, stackTrace) {
        debugPrint("Error submit payment: ${errorModel.bodyString}");
        isPaymentLoading(false);
      },
    );
  }

  // Redeem MVP

  final isRedeemToMVPReview = false.obs;
  final shopStoreId = 0.obs;
  final amountToRedeem = 0.0.obs;
  final redeemAmountToPayController = TextEditingController().obs;
  final amountToRedeemDisplay = ''.obs;
  final receiveAccountNumber = ''.obs;
  final receiveAccountname = ''.obs;
  final remark = ''.obs;
  // Validate varriable
  final isValidateAmoutToRedeem = true.obs;
  final isRedeemToVerifyAccountValidateMessage = ''.obs;
  final isRedeemToVerifyAccountValidate = true.obs;
  onClearRedeemToMVP() {
    receiveAccountNumber.value = '';
    receiveAccountname.value = '';
    amountToRedeem.value = 0.0;
    redeemAmountToPayController.value.text = '';
    remark.value = '';
    isRedeemToVerifyAccountValidateMessage.value = '';
    isRedeemToVerifyAccountValidate.value = true;
  }

  // Verify Account
  Future<void> onRedeemToVerifyAccount(BuildContext context) async {
    isRedeemToMVPReview(true);
    debugPrint("receiveAccountNumber.value:${receiveAccountNumber.value}");

    try {
      await apiBaseHelper.onNetworkRequesting(
        url: 'wallet/verify/Account',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'receiver_number': receiveAccountNumber.value,
        },
      ).then((response) {
        debugPrint("Redeem to pay:$response");
        receiveAccountname.value = response['receiver_name'];

        isRedeemToMVPReview(false);
        isRedeemToVerifyAccountValidate(true);

        update();
      }).onError((ErrorModel error, stackTrace) {
        debugPrint("redeem Error:${error.bodyString}");

        isRedeemToVerifyAccountValidate.value = false;

        isRedeemToVerifyAccountValidateMessage.value =
            error.bodyString['message'] ?? '';
        isRedeemToMVPReview(false);
        update();
      });
    } catch (e) {
      isRedeemToMVPReview(false);
      debugPrint("on redeem:$e");
    } finally {
      isRedeemToMVPReview(false);
      // isRedeemValidateLoading(true);
    }
  }

  // Review Redeem To MVP

  final amountToPay = ''.obs;
  Future<void> onRedeemToMVPReview(BuildContext context) async {
    // Convert string to int(1,500 to 1500)
    var redeemMVPAmount =
        redeemAmountToPayController.value.text.replaceAll(',', '');
    isRedeemToMVPReview(true);

    try {
      await apiBaseHelper.onNetworkRequesting(
        url: 'privilege/preview/redeem-mvp',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'shop_id': shopStoreId.value,
          'amount': redeemMVPAmount,
          'receiver_account_number': receiveAccountNumber.value,
          'remark': remark.value
        },
      ).then((response) {
        debugPrint("Review Redeem to MVP:$response");
        amountToRedeemDisplay.value = response['amount'];
        receiveAccountname.value = response['account_name'];
        receiveAccountNumber.value = response['account_number'];
        amountToPay.value = response['amount_to_pay'];
        debugPrint("amountToPay.value:${amountToPay.value}");

        isRedeemToMVPReview(false);
        // isRedeemValidateLoading(true);

        update();
      }).onError((ErrorModel error, stackTrace) {
        debugPrint("redeem Error:${error.bodyString}");
        isRedeemToMVPReview(false);
        // isRedeemValidateLoading(false);

        isRedeemToVerifyAccountValidate.value =
            error.bodyString['message'] ?? '';
        customRouterSnackbar(
            title: 'Verify Payment',
            description: '${isRedeemToVerifyAccountValidate.value}',
            type: SnackType.error);
        update();
      });
    } catch (e) {
      isRedeemToMVPReview(false);
      debugPrint("on redeem:$e");
    } finally {
      isRedeemToMVPReview(false);
    }
  }

  // Redeem To Submit
  final paymentSummery = PaymentSummary().obs;
  final isRedeemToSubmitMVP = false.obs;
  Future<void> onRedeemToSubmitMVP(BuildContext context) async {
    // Convert string to int(1,500 to 1500)
    var redeemMVPAmount =
        redeemAmountToPayController.value.text.replaceAll(',', '');
    isRedeemToSubmitMVP(true);

    try {
      await apiBaseHelper.onNetworkRequesting(
        url: 'privilege/payment/via-mvp',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'shop_id': shopStoreId.value,
          'amount': redeemMVPAmount,
          'receiver_account_number': receiveAccountNumber.value,
          'remark': remark.value
        },
      ).then((response) {
        debugPrint("MVP Payment Response:$response");

        paymentSummery.value = PaymentSummary.fromJson(response);
        context.pushNamed(
          'PaymentSummeryMVP',
          queryParams: {
            'amount':
                '${FormatNumber.formatNumber(paymentSummery.value.amount!)}',
            'accountMVP': '${paymentSummery.value.shopName}',
            'transactionID': '${paymentSummery.value.transactionId}',
            'date': '${paymentSummery.value.date}',
            'reference': '${paymentSummery.value.reference}',
            'fromAccount': '${paymentSummery.value.fromAccount}',
            'marchant': '${paymentSummery.value.merchantAccount}',
            'originalAmount':
                '${FormatNumber.formatNumber(paymentSummery.value.originalAmount!)}',
            'remark': '${paymentSummery.value.remark}',
          },
          extra: {
            'onPressed': () {
              onClearRedeemToMVP();
              onFetchShopDetail(shopStoreId.value).then((value) {
                context.go(
                    "/privilege/all-store/privilege-detail/${shopStoreId.value}");
              });
              update();
            },
          },
        );

        isRedeemToSubmitMVP(false);
        // isRedeemValidateLoading(true);

        update();
      }).onError((ErrorModel error, stackTrace) {
        isRedeemToSubmitMVP(false);
        customRouterSnackbar(
            title: 'Redeem Failed',
            description: error.bodyString['message'] ?? '',
            type: SnackType.error);

        update();
      });
    } catch (e) {
      isRedeemToSubmitMVP(false);
      debugPrint("on redeem:$e");
    } finally {
      isRedeemToSubmitMVP(false);
    }
  }
}
