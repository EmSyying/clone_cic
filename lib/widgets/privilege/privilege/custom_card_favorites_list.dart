import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../modules/privilege_program/controller/privilege_controller.dart';
import '../custom_shimmer_allshop.dart';
import 'costom_all_stores.dart';

class CustomCardFavoriesList extends StatefulWidget {
  final int? id;
  const CustomCardFavoriesList({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<CustomCardFavoriesList> createState() => _CustomCardFavoriesListState();
}

class _CustomCardFavoriesListState extends State<CustomCardFavoriesList> {
  final privillageCon = Get.put(PrivilegeController());
  @override
  void initState() {
    privillageCon.onFetchFavouriteStore();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => privillageCon.isLoadingFav.value
          ? const CustomShimmerAllShop()
          : Column(
              children: privillageCon.favshopModelList
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          if (Get.put(SettingController())
                                  .getCurrentTapBottom
                                  .value ==
                              0) {
                            context.go(
                                "/privilege/all-store/privilege-detail/${privillageCon.favshopModelList[e.key].id}");
                          } else {
                            context.go(
                                "/profile/setting/privilege/all-store/privilege-detail/${privillageCon.favshopModelList[e.key].id}");
                            // Navigator.push(
                          }

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
                              id: privillageCon.favshopModelList[e.key].id!,
                              boolFav: privillageCon
                                  .favshopModelList[e.key].isFavorite!,
                            )
                                .then((value) {
                              if (privillageCon
                                  .favshopModelList[e.key].isFavorite!) {
                                privillageCon.favshopModelList[e.key] =
                                    privillageCon.favshopModelList[e.key]
                                        .copyWith(isFavorite: false);
                                privillageCon.favshopModelList.removeAt(e.key);
                              } else {
                                privillageCon.favshopModelList[e.key] =
                                    privillageCon.favshopModelList[e.key]
                                        .copyWith(isFavorite: true);
                              }
                            });

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
