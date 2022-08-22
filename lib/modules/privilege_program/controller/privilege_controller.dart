import 'package:cicgreenloan/Utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/option_model/option_form.dart';
import '../model/category_model/model_categories.dart';
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
  final isFavorites = 0.obs;
  final isLoadingShopList = false.obs;
  Future<List<PrivilegeShopModel>> onFetchListShop() async {
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
        shopModelList.add(PrivilegeShopModel.fromJson(e));
      }).toList();
      isLoadingShopList(false);
    }).onError((ErrorModel errorModel, stackTrace) {
      isLoadingShopList(false);
    });

    return shopModelList;
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

  ////function onFetchCategories======
  //final categoriesModel = ModelsCategories().obs;
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

  final filterOption = <OptionForm>[
    OptionForm(id: 1, display: "Sihanouk VIlle"),
    OptionForm(id: 2, display: "Phnom Penh"),
    OptionForm(id: 3, display: "Siem Reap"),
    OptionForm(id: 4, display: "Ratanakiri"),
    OptionForm(id: 5, display: "Krong Kep"),
    OptionForm(id: 6, display: "Oddar Maenchey"),
    OptionForm(id: 7, display: "Banteay Meanchey"),
    OptionForm(id: 8, display: "Preah VIhear"),
    OptionForm(id: 9, display: "Kampong Spue"),
  ].obs;

  final listAllCategories = <ModelsCategories>[
    ModelsCategories(
      name: 'Education Training',
      image: 'assets/images/privilege/education.png',
    ),
    ModelsCategories(
      name: 'Retail Baby Product',
      image: 'assets/images/privilege/product.png',
    ),
    ModelsCategories(
      name: 'Construction Architect',
      image: 'assets/images/privilege/construction.png',
    ),
  ].obs;

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
