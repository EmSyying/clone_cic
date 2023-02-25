import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../modules/privilege_program/controller/privilege_controller.dart';
import '../custom_shimmer_allshop.dart';
import 'costom_all_stores.dart';

class CustomStoreListing extends StatefulWidget {
  final int? index;
  final int? page;
  final String? filterString;
  const CustomStoreListing({
    Key? key,
    this.index,
    this.page,
    this.filterString,
  }) : super(key: key);

  @override
  State<CustomStoreListing> createState() => _CustomCardFavoriesListState();
}

class _CustomCardFavoriesListState extends State<CustomStoreListing> {
  final privillageCon = Get.put(PrivilegeController());
  @override
  void initState() {
    privillageCon.onFetchStoreData(widget.index ?? 0, widget.page ?? 1,
        filterString: widget.filterString ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => privillageCon.isLoadingStoreListing.value
          ? const CustomShimmerAllShop()
          : Column(
              children: privillageCon.shopPrivilegeList
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          // if (Get.put(SettingController())
                          //         .getCurrentTapBottom
                          //         .value ==
                          //     0) {
                          //   context.go(
                          //       "/privilege/all-store/privilege-detail/${privillageCon.favshopModelList[e.key].id}");
                          // } else {
                          context.go(
                              "/privilege/all-store/privilege-detail/${privillageCon.shopPrivilegeList[e.key].id}");
                          // Navigator.push(
                          // }

                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PrivilegeDetailScreen(
                          //       id: e.value.id,
                          //     ),
                          //   ),
                          // );
                        },
                        child: CustomCardAllStores(
                          isFav: e.value.isFavorite!,
                          privilegeShopList: e.value,
                          onTapFav: () {
                            privillageCon
                                .setFavouriteStore(
                              id: privillageCon.shopPrivilegeList[e.key].id!,
                              boolFav: privillageCon
                                  .shopPrivilegeList[e.key].isFavorite!,
                            )
                                .then((value) {
                              if (privillageCon.segmentedControlValue.value ==
                                  0) {
                                privillageCon
                                    .setFavouriteStore(
                                  id: privillageCon
                                      .shopPrivilegeList[e.key].id!,
                                  boolFav: privillageCon
                                      .shopPrivilegeList[e.key].isFavorite!,
                                )
                                    .then((value) {
                                  if (privillageCon
                                      .shopPrivilegeList[e.key].isFavorite!) {
                                    privillageCon.shopPrivilegeList[e.key] =
                                        privillageCon.shopPrivilegeList[e.key]
                                            .copyWith(isFavorite: false);
                                  } else {
                                    privillageCon.shopPrivilegeList[e.key] =
                                        privillageCon.shopPrivilegeList[e.key]
                                            .copyWith(isFavorite: true);
                                  }
                                });
                              } else {
                                if (privillageCon
                                    .shopPrivilegeList[e.key].isFavorite!) {
                                  privillageCon.shopPrivilegeList[e.key] =
                                      privillageCon.shopPrivilegeList[e.key]
                                          .copyWith(isFavorite: false);
                                  privillageCon.shopPrivilegeList
                                      .removeAt(e.key);
                                } else {
                                  privillageCon.shopPrivilegeList[e.key] =
                                      privillageCon.shopPrivilegeList[e.key]
                                          .copyWith(isFavorite: true);
                                  debugPrint(
                                      ' privillageCon.shopPrivilegeList${privillageCon.shopPrivilegeList}');
                                }
                              }
                            });
                            setState(() {});

                            // privillageCon.favshopModelList.refresh();

                            // privillageCon.favshopModelList.refresh();
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
