import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/option_model/option_form.dart';
import '../../google_map_module/controllers/google_map_controller.dart';
import '../model/category_model/model_categories.dart';
import '../model/history/model_history_privilege.dart';
import '../model/location/location.dart';
import '../model/search_loation_list/search_location_list.dart';
import '../model/slide_privilege/privilege_slide_model.dart';
import '../model/stores_model/model_pre.dart';

class PrivilegeController extends GetxController {
  final favoritesList = <StoreModel>[].obs;
  final optionSelecList = <OptionForm>[].obs;
  final isSelectFilter = false.obs;
  final selectedCategFil = ''.obs;
  final googleMapCon = Get.put(GoogleMapsController());
//Refreshscreen====F
  Future<void> onRefreshPrivilege() async {
    await onFetchCategories();
    await onFetchAllStore(1);
    await onFetchFavouriteStore();
  }

  ////function getListShop======
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  final shopModel = PrivilegeShopModel().obs;
  final shopModelList = <PrivilegeShopModel>[].obs;
  final isFavorites = false.obs;
  final isLoadingShopList = false.obs;
  final isfetcheAllStoredata = false.obs;
  Future<List<PrivilegeShopModel>> onFetchAllStore(int page) async {
    // isLoadingShopList(true);
    if (page == 1) {
      isLoadingShopList(true);
    } else {
      isfetcheAllStoredata(true);
    }

    await apiBaseHelper
        .onNetworkRequesting(
      url:
          'privilege/shop?page=$page?origin=${googleMapCon.latitute.toString()},${googleMapCon.longtitute.toString()}',
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((response) {
      var responseJson = response['data'];
      debugPrint('hany privilege have latelong:=======$responseJson');
      shopModelList.clear();
      if (page == 1) {
        shopModelList.clear();
      }
      responseJson.map((e) {
        shopModel.value = PrivilegeShopModel.fromJson(e);
        // debugPrint('heloooo12345:${shopModel.value.isFavorite}');
        shopModelList.add(shopModel.value);
      }).toList();
      isLoadingShopList(false);
      isfetcheAllStoredata(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingShopList(false);
      return null;
    });

    return shopModelList;
  }

  // Search Shop/Store======
  onClearSearch() {
    searchLocationList.clear();
    searchShopList.clear();
    textSearchController.clear();
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
          ? 'privilege/global/search?origin=${googleMapCon.latitute.toString()},${googleMapCon.longtitute.toString()}&queries=$keySearch'
          : 'privilege/global/search?origin=${googleMapCon.latitute.toString()},${googleMapCon.longtitute.toString()}&queries=$keySearch&location=true',
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

  Future<List<PrivilegeShopModel>> onFetchFavouriteStore() async {
    isLoadingFav(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url: 'privilege/shop?favorite=true',
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
    debugPrint("Privilege 1 $id");
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
      shopDetailModel.value = PrivilegeShopModel.fromJson(responseJson);
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

  /////search categories shop
  final categoriesListSeeAll = <ModelsCategories>[].obs;
  final isLoadingSearchCate = false.obs;
  Future<List<ModelsCategories>> onSearchCategories(String? keySearch) async {
    isLoadingSearchCate(true);
    await apiBaseHelper
        .onNetworkRequesting(
      url:
          'privilege/category?term=$keySearch&origin=${googleMapCon.latitute.toString()},${googleMapCon.longtitute.toString()}',
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
  final categoryFilterModel = PrivilegeShopModel().obs;
  final categoryFilterList = <PrivilegeShopModel>[].obs;

  Future<List<PrivilegeShopModel>> onFilterByCategoriesByLocation(
      {String? location, int? categoryId}) async {
    debugPrint("Filter is working");
    isLoadingCategoryFilter(true);
    apiBaseHelper
        .onNetworkRequesting(
            url:
                'privilege/filer?location=$location&origin=${googleMapCon.latitute.toString()},${googleMapCon.longtitute.toString()}&category=$categoryId',
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

    return categoryFilterList;
  }

  // On Select Filter

  final locationCodeList = <dynamic>[].obs;
  final categoriesId = 0.obs;

  void onSelected({int? index, String? selectedItemCode}) {
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
    onFilterByCategoriesByLocation(
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
      // locationPrivilageList.clear();
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
                'privilege/shop-by?category_id=$id&origin=${googleMapCon.latitute.toString()},${googleMapCon.longtitute.toString()}',
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
        debugPrint(
            'Slide privilege index 00000000=======${privilegeSlideList[0].title}');
      }).toList();
      debugPrint(
          'Slide privilege index 1233=======${privilegeSlideList[0].title}');

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
  Future<void> onPaymentPrivilege({
    BuildContext? context,
  }) async {
    debugPrint("Shop Id====:${shopId.value}");
    debugPrint("Amount====:${privilegeAmount.value}");
    isPaymentLoading(true);
    await apiBaseHelper.onNetworkRequesting(
        url: 'privilege/payment',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "shop_id": shopId.value,
          "amount": privilegeAmount.value,
        }).then((response) {
      debugPrint("4 Digits code:$response");
      debugPrint('Clicked  ${GoRouter.of(context!).location}');
      context.push('/privilege-payment/$shopId/payment-done-screen');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const PaymentDoneScreen(),
      //   ),
      // );

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
        isPaymentLoading(false);
      },
    );
  }

  // Redeem MVP
  final isRedeemToMVPReview = false.obs;
  final shopStoreId = 0.obs;
  final amountToRedeem = 0.0.obs;
  final receiveAccountNumber = ''.obs;
  final receiveAccountname = ''.obs;
  final remark = ''.obs;
  // Validate varriable
  final isValidateAmoutToRedeem = true.obs;
  final isRedeemToVerifyAccountValidateMessage = ''.obs;
  final isRedeemToVerifyAccountValidate = true.obs;
  onClearRedeemToMVP() {
    amountToRedeem.value = 0.0;
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
  final amountToPay = 0.obs;
  Future<void> onRedeemToMVPReview(BuildContext context) async {
    isRedeemToMVPReview(true);

    try {
      await apiBaseHelper.onNetworkRequesting(
        url: 'privilege/preview/redeem-mvp',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'shop_id': shopStoreId.value,
          'amount': amountToRedeem.value,
          'receiver_account_number': receiveAccountNumber.value,
          'remark': remark.value
        },
      ).then((response) {
        debugPrint("Review Redeem to MVP:$response");
        amountToRedeem.value = response['amount'];
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
  final isRedeemToSubmitMVP = false.obs;
  Future<void> onRedeemToSubmitMVP(BuildContext context) async {
    isRedeemToSubmitMVP(true);

    try {
      await apiBaseHelper.onNetworkRequesting(
        url: 'privilege/payment/via-mvp',
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          'shop_id': shopStoreId.value,
          'amount': amountToRedeem.value,
          'receiver_account_number': receiveAccountNumber.value,
          'remark': remark.value
        },
      ).then((response) {
        context.pushNamed(
          'SuccessScreen',
          queryParams: {
            'title': 'Success',
            'description': 'MVP redeem successfully',
            'appbarTitle': 'MVP Redemption',
          },
          extra: {
            'onPressedButton': () {
              context.go(
                  "/profile/setting/privilege/all-store/privilege-detail/${shopStoreId.value}");
            },
          },
        );
        isRedeemToSubmitMVP(false);
        // isRedeemValidateLoading(true);

        update();
      }).onError((ErrorModel error, stackTrace) {
        debugPrint("redeem Error:${error.bodyString}");
        isRedeemToSubmitMVP(false);

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
