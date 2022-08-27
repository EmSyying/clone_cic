import 'dart:async';

import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../widgets/privilege/custom_shimmer_allshop.dart';
import '../../../../widgets/privilege/privilege/costom_all_stores.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege/custom_location_card.dart';
import '../../controller/privilege_controller.dart';
import '../privilege_detail/privilege_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.locationCode, this.locationName})
      : super(key: key);
  final String? locationCode;
  final String? locationName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int segmentedControlValue = 0;
  PageController controller = PageController();
  final privilegController = Get.put(PrivilegeController());

  Timer? searchOnStoppedTyping;
  int index = 0;
  onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      // clear timer
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(
        () => searchOnStoppedTyping = Timer(duration, () => searchText(value)));
  }

  String keySearch = '';
  searchText(textSearch) async {
    setState(() {
      keySearch = textSearch;
    });
    if (textSearch.isNotEmpty) {
      setState(() {
        keySearch = textSearch;
      });
      index == 1
          ? privilegController.onSearchStores(
              keySearch: keySearch, isLocation: true)
          : privilegController.onSearchStores(keySearch: keySearch);
    } else {
      privilegController.searchShopList.value = [];
      privilegController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
          onPressed: () {
            privilegController.onFetchAllStore();
            Navigator.pop(context);
          },
        ),
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
              if (v == '') {
                privilegController.searchShopList.value = [];
                privilegController.update();
              } else {
                onChangeHandler(v);
              }
            },
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: widget.locationCode != null ||
              privilegController.categoryFilterList.isNotEmpty
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
                                "\"${widget.locationName}\"",
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
                                                      .searchShopList[e.key]
                                                      .id!,
                                                  fav: privilegController
                                                      .searchShopList[e.key]
                                                      .isFavorite!)
                                              .then((value) {
                                            if (privilegController
                                                .searchShopList[e.key]
                                                .isFavorite!) {
                                              privilegController
                                                      .searchShopList[e.key] =
                                                  privilegController
                                                      .searchShopList[e.key]
                                                      .copyWith(
                                                          isFavorite: false);
                                            } else {
                                              privilegController
                                                      .searchShopList[e.key] =
                                                  privilegController
                                                      .searchShopList[e.key]
                                                      .copyWith(
                                                          isFavorite: true);
                                            }
                                          });

                                          setState(() {});
                                          // preCont.shopModelList.refresh();
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
          : Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                color: Colors.transparent,
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  groupValue: segmentedControlValue,
                  backgroundColor: const Color(0xff252552).withOpacity(0.1),
                  children: <int, Widget>{
                    0: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Stores',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    1: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Location',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                    Obx(
                      () => privilegController.isSearchLoading.value
                          ? const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: CustomShimmerAllShop(),
                            )
                          : SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Column(
                                  children: privilegController.searchShopList
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
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
                                                          .searchShopList[e.key]
                                                          .id!,
                                                      fav: privilegController
                                                          .searchShopList[e.key]
                                                          .isFavorite!)
                                                  .then((value) {
                                                if (privilegController
                                                    .searchShopList[e.key]
                                                    .isFavorite!) {
                                                  privilegController
                                                              .searchShopList[
                                                          e.key] =
                                                      privilegController
                                                          .searchShopList[e.key]
                                                          .copyWith(
                                                              isFavorite:
                                                                  false);
                                                } else {
                                                  privilegController
                                                              .searchShopList[
                                                          e.key] =
                                                      privilegController
                                                          .searchShopList[e.key]
                                                          .copyWith(
                                                              isFavorite: true);
                                                }
                                              });

                                              setState(() {});
                                              // preCont.shopModelList.refresh();
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                    ),

                    // Location
                    Obx(() => privilegController.isSearchLoading.value
                        ? const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: CustomShimmerAllShop(),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: privilegController.searchLocationList
                                  .asMap()
                                  .entries
                                  .map(
                                    (location) => GestureDetector(
                                      onTap: () {
                                        debugPrint(
                                            "is go to search by location");
                                        privilegController
                                            .onFilterByCategoriesByLocation(
                                                location: location.value.code);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                                locationName:
                                                    location.value.province,
                                                locationCode:
                                                    location.value.code),
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
                          ))
                  ],
                ),
              ),
            ]),
    );
  }
}
