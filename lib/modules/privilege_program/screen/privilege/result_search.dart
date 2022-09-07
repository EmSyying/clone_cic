import 'dart:async';

import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_filters.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../widgets/privilege/custom_shimmer_allshop.dart';
import '../../../../widgets/privilege/privilege/costom_all_stores.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';

class ResultSearch extends StatefulWidget {
  final String? locationCode;
  final String? locationName;
  const ResultSearch({
    Key? key,
    this.locationCode,
    this.locationName,
  }) : super(key: key);

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final privilegCon = Get.put(PrivilegeController());
  Timer? searchOnStoppedTyping;
  @override
  void initState() {
    super.initState();
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
              // onChangeHandler1(v);
            },
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: Obx(
        () => privilegCon.isLoadingCategoryFilter.value
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
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
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
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: Text(
                          "${privilegCon.categoryFilterList.length} store search in",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff000000),
                                    letterSpacing: 0.2,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20.0, left: 10.0),
                        child: Text(
                          "\"${widget.locationName ?? ''}\"",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
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
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: privilegCon.categoryFilterList
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
                                    privilegCon
                                        .setFavouriteStore(
                                            id: privilegCon
                                                .categoryFilterList[e.key].id!,
                                            boolFav: privilegCon
                                                .categoryFilterList[e.key]
                                                .isFavorite!)
                                        .then((value) {
                                      if (privilegCon.categoryFilterList[e.key]
                                          .isFavorite!) {
                                        privilegCon.categoryFilterList[e.key] =
                                            privilegCon
                                                .categoryFilterList[e.key]
                                                .copyWith(isFavorite: false);
                                      } else {
                                        privilegCon.categoryFilterList[e.key] =
                                            privilegCon
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
      ),
    );
  }
}
