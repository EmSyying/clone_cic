import 'dart:async';

import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_filters.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/helper/color.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
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

  int segmentedControlValue = 0;
  PageController controller = PageController();
  final privilegController = Get.put(PrivilegeController());
  Timer? searchOnStoppedTyping;
  int index = 0;

  bool showData = false;

  @override
  void dispose() {
    privilegController.onClearSearch();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
      await privilegController.onSearchStores(
          keySearch: textSearch, isLocation: true);
      await privilegController
          .onSearchStores(keySearch: textSearch)
          .then((value) {
        privilegController.textSearchController.text = textSearch;
        searchChangeFov = textSearch;
      });
      showData = true;
      setState(() {});
    } else {
      privilegController.searchShopList.clear();
      privilegController.searchLocationList.clear();
      showData = false;
      setState(() {});

      privilegController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: SizedBox(
          width: 22,
          height: 22,
          child: GestureDetector(
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
            },
            controller: privilegController.textSearchController,
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: widget.locationName != null
          ? Obx(
              () => privilegController.isLoadingCategoryFilter.value
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
                                builder: (context) => const PrivilegeFilters(
                                  showLocation: false,
                                ),
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 20.0),
                              child: Text(
                                "${privilegController.categoryFilterList.length} store search in",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xff000000),
                                      letterSpacing: 0.2,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0),
                              child: Text(
                                "\"${widget.locationName ?? ''}\"",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff000000),
                                      letterSpacing: 0.2,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              children: privilegController.categoryFilterList
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        // context.go(
                                        //     "/privilege/all-store/${privilegController.shopModelList[e.key].id}");
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         PrivilegeDetailScreen(
                                        //       id: e.value.id,
                                        //     ),
                                        //   ),
                                        // );
                                        context.push(
                                            "/privilege/all-store/privilege-detail/${privilegController.categoryFilterList[e.key].id}");
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
                                                      .categoryFilterList[
                                                  e
                                                      .key] = privilegController
                                                  .categoryFilterList[e.key]
                                                  .copyWith(isFavorite: false);
                                            } else {
                                              privilegController
                                                      .categoryFilterList[
                                                  e
                                                      .key] = privilegController
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
                    ),
            )
          : showData
              ? Obx(
                  () => Column(
                    children: [
                      // if (privilegController.searchShopList.isNotEmpty ||
                      //     privilegController.searchLocationList.isNotEmpty)
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
                                : privilegController.searchShopList.isNotEmpty
                                    ? SingleChildScrollView(
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
                                                        searchText(
                                                            searchChangeFov);
                                                      });
                                                    },
                                                    child: CustomCardAllStores(
                                                      isFav:
                                                          e.value.isFavorite!,
                                                      privilegeShopList:
                                                          e.value,
                                                      onTapFav: () {
                                                        privilegController
                                                            .setFavouriteStore(
                                                                id: privilegController
                                                                    .searchShopList[
                                                                        e.key]
                                                                    .id!,
                                                                boolFav: privilegController
                                                                    .searchShopList[
                                                                        e.key]
                                                                    .isFavorite!)
                                                            .then((value) {
                                                          if (privilegController
                                                              .searchShopList[
                                                                  e.key]
                                                              .isFavorite!) {
                                                            privilegController
                                                                    .searchShopList[
                                                                e
                                                                    .key] = privilegController
                                                                .searchShopList[
                                                                    e.key]
                                                                .copyWith(
                                                                    isFavorite:
                                                                        false);
                                                          } else {
                                                            privilegController
                                                                    .searchShopList[
                                                                e
                                                                    .key] = privilegController
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
                                      )
                                    : _buildEmptyState(),

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
                                : privilegController
                                        .searchLocationList.isNotEmpty
                                    ? Padding(
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
                                                    // privilegController.onSearchStores(
                                                    //     keySearch:
                                                    //         searchText(location));
                                                    privilegController
                                                        .textSearchController
                                                        .text;
                                                    debugPrint(
                                                        'print textSearch hany=====:${privilegController.textSearchController.text}');
                                                    privilegController
                                                            .locationCode
                                                            .value =
                                                        location.value.code!;
                                                    debugPrint(
                                                        "is go to search by location");
                                                    privilegController
                                                        .onFilterByCategoriesByLocation(
                                                      location:
                                                          location.value.code,
                                                    );
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SearchScreen(
                                                          locationName: location
                                                              .value.province,
                                                          locationCode: location
                                                              .value.code,
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
                                    : _buildEmptyState(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomEmptyState(
                  title: 'Find Shop',
                  description: 'Search shops name that you want to find !',
                ),
    );
  }

  _buildEmptyState() => const CustomEmptyState(
        colors: true,
        title: 'No Results',
        description: '',
      );
}
