import 'dart:async';

import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_filters.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/result_search.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/helper/color.dart';
import '../../../../widgets/privilege/custom_shimmer_allshop.dart';
import '../../../../widgets/privilege/privilege/costom_all_stores.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege/custom_location_card.dart';
import '../../controller/privilege_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    this.locationCode,
    this.locationName,
    this.fromPage,
  }) : super(key: key);
  final String? locationCode;
  final String? locationName;
  final String? fromPage;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchChangeFov;
  String? filterChaFav;
  int segmentedControlValue = 0;

  PageController controller = PageController();
  final privilegController = Get.put(PrivilegeController());

  Timer? searchOnStoppedTyping;
  int index = 0;
  @override
  void dispose() {
    privilegController.onClearSearch();

    super.dispose();
  }

  onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      // clear timer
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(
        () => searchOnStoppedTyping = Timer(duration, () => searchText(value)));
  }

  searchText(textSearch) async {
    if (textSearch.replaceAll(' ', '').isNotEmpty) {
      privilegController.onSearchStores(
          keySearch: textSearch, isLocation: true);
      privilegController.onSearchStores(keySearch: textSearch);
    } else {
      privilegController.searchShopList.clear();
      privilegController.searchLocationList.clear();

      privilegController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(
              left: 20.0,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 30,
        // titleSpacing: 0,
        title: Container(
          height: 38,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomFormFieldSearch(
            onSaved: (e) {},
            onChanged: (v) {
              onChangeHandler(v);
              searchChangeFov = v;
            },
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: Obx(() => widget.locationName != null
          ? privilegController.isLoadingCategoryFilter.value
              ? const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: CustomShimmerAllShop(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivilegeFilters(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, top: 14, bottom: 16),
                        decoration: BoxDecoration(
                            color: AppColor.lightblue.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 87,
                        height: 34,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 7.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              'assets/images/privilege/filter_icon.svg',
                              color: AppColor.mainColor,
                            ),
                            Text(
                              'Filter',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          children: privilegController.categoryFilterList
                              .asMap()
                              .entries
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    // context.go(
                                    //     "/privilege/all-store/${privilegController.shopModelList[e.key].id}");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PrivilegeDetailScreen(
                                          id: e.value.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: CustomCardAllStores(
                                    isFav: e.value.isFavorite!,
                                    privilegeShopList: e.value,
                                    onTapFav: () {
                                      privilegController
                                          .setFavouriteStore(
                                              id: privilegController
                                                  .categoryFilterList[e.key]
                                                  .id!,
                                              boolFav: privilegController
                                                  .categoryFilterList[e.key]
                                                  .isFavorite!)
                                          .then((value) {
                                        if (privilegController
                                            .categoryFilterList[e.key]
                                            .isFavorite!) {
                                          privilegController
                                                  .categoryFilterList[e.key] =
                                              privilegController
                                                  .categoryFilterList[e.key]
                                                  .copyWith(isFavorite: false);
                                        } else {
                                          privilegController
                                                  .categoryFilterList[e.key] =
                                              privilegController
                                                  .categoryFilterList[e.key]
                                                  .copyWith(isFavorite: true);
                                        }
                                        // privilegController.onFetchAllStore(1);
                                        // privilegController
                                        //     .onFetchFavouriteStore();
                                        // privilegController.update();
                                      });
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                )
          : privilegController.searchShopList.isNotEmpty ||
                  privilegController.searchLocationList.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      color: Colors.transparent,
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl(
                        groupValue: segmentedControlValue,
                        backgroundColor:
                            const Color(0xff252552).withOpacity(0.1),
                        children: <int, Widget>{
                          0: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Stores',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          1: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Location',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        },
                        onValueChanged: (int? value) {
                          setState(() {
                            index = value!;
                            debugPrint("Page View index:$value");
                            segmentedControlValue = value;
                            // if (value == 0) {
                            //   privilegController.onSearchStores(keySearch: keySearch);
                            // } else {
                            //   privilegController.onSearchStores(
                            //       keySearch: keySearch, isLocation: true);
                            // }
                            controller.animateToPage(segmentedControlValue,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.fastLinearToSlowEaseIn);
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: controller,
                        onPageChanged: (value) {
                          segmentedControlValue = value;

                          setState(() {});
                        },
                        children: [
                          //Store/Shop
                          privilegController.isSearchLoading.value
                              ? const Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 20.0,
                                  ),
                                  child: CustomShimmerAllShop(),
                                )
                              : SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Column(
                                      children: privilegController
                                          .searchShopList
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => GestureDetector(
                                              onTap: () {
                                                // context.go(
                                                //     "/privilege/all-store/${privilegController.shopModelList[e.key].id}");
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PrivilegeDetailScreen(
                                                      id: e.value.id,
                                                    ),
                                                  ),
                                                ).then((value) {
                                                  searchText(searchChangeFov);
                                                });
                                              },
                                              child: CustomCardAllStores(
                                                isFav: e.value.isFavorite!,
                                                privilegeShopList: e.value,
                                                onTapFav: () {
                                                  privilegController
                                                      .setFavouriteStore(
                                                          id: privilegController
                                                              .searchShopList[
                                                                  e.key]
                                                              .id!,
                                                          boolFav:
                                                              privilegController
                                                                  .searchShopList[
                                                                      e.key]
                                                                  .isFavorite!)
                                                      .then((value) {
                                                    if (privilegController
                                                        .searchShopList[e.key]
                                                        .isFavorite!) {
                                                      privilegController
                                                                  .searchShopList[
                                                              e.key] =
                                                          privilegController
                                                              .searchShopList[
                                                                  e.key]
                                                              .copyWith(
                                                                  isFavorite:
                                                                      false);
                                                    } else {
                                                      privilegController
                                                                  .searchShopList[
                                                              e.key] =
                                                          privilegController
                                                              .searchShopList[
                                                                  e.key]
                                                              .copyWith(
                                                                  isFavorite:
                                                                      true);
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),

                          // Location
                          privilegController.isSearchLoading.value
                              ? const Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 20.0,
                                  ),
                                  child: CustomShimmerAllShop(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: privilegController
                                        .searchLocationList
                                        .asMap()
                                        .entries
                                        .map(
                                          (location) => GestureDetector(
                                            onTap: () {
                                              privilegController.locationCode
                                                  .value = location.value.code!;
                                              debugPrint(
                                                  "is go to search by location");
                                              privilegController
                                                  .onFilterByCategoriesByLocation(
                                                location: location.value.code,
                                              );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultSearch(
                                                    locationName:
                                                        location.value.province,
                                                    locationCode:
                                                        location.value.code,
                                                  ),
                                                ),
                                              );
                                              debugPrint(
                                                  "is go to search by location 11:${location.value.code}");
                                            },
                                            child: CustomLocationCard(
                                              locatModel: location.value,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/privilege/search.png',
                        width: 200,
                        height: 200,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      Text('Find Shop',
                          style: Theme.of(context).textTheme.headline4),
                      Text('Search shops name that you want to find !',
                          style: Theme.of(context).textTheme.headline2),
                    ],
                  ),
                )),
    );
  }
}
