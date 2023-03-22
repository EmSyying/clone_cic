import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/custom_shimmer_allshop.dart';
import '../../../../widgets/privilege/privilege/costom_all_stores.dart';
import '../privilege_detail/privilege_detail_screen.dart';

class ItemCategoryPrivilegeScreen extends StatefulWidget {
  final int? id;
  final String? tabTitle;

  const ItemCategoryPrivilegeScreen({Key? key, this.id, this.tabTitle})
      : super(key: key);

  @override
  State<ItemCategoryPrivilegeScreen> createState() =>
      _ItemCategoryPrivilegeScreenState();
}

class _ItemCategoryPrivilegeScreenState
    extends State<ItemCategoryPrivilegeScreen> {
  final priCont = Get.put(PrivilegeController());

  @override
  void initState() {
    priCont.onFetchCategoryItem(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0.5,
        title: widget.tabTitle,
      ),
      body: Obx(
        () => priCont.isLoadingCateItem.value
            ? const Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomShimmerAllShop(),
              )
            : priCont.shopCategoryItemList.isNotEmpty
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      NotificationListener<ScrollEndNotification>(
                        onNotification: (ScrollEndNotification scroll) {
                          if (scroll.metrics.pixels ==
                              scroll.metrics.maxScrollExtent) {
                            if (priCont.shopCategoryItem.value.links!.next !=
                                null) {
                              priCont.isLoadingMoreItem(true);
                              priCont.pageNumber.value++;
                              priCont.onFetchCategoryItem(widget.id);
                            }
                          }
                          return false;
                        },
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${priCont.shopCategoryItem.value.meta!.total} Stores',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.chartLabelColor,
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: priCont.shopCategoryItemList
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
                                              id: priCont
                                                  .shopCategoryItemList[e.key]
                                                  .id,
                                            ),
                                          ),
                                        ).then((value) {
                                          priCont
                                              .onFetchCategoryItem(widget.id);
                                        });
                                        // context.push(
                                        //     "/privilege/all-store/privilege-detail/${priCont.shopCategoryItemList[e.key].id}");
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18.0),
                                        child: CustomCardAllStores(
                                          isFav: e.value.isFavorite!,
                                          privilegeShopList: e.value,
                                          onTapFav: () {
                                            priCont
                                                .setFavouriteStore(
                                              id: priCont
                                                  .shopCategoryItemList[e.key]
                                                  .id!,
                                              boolFav: priCont
                                                  .shopCategoryItemList[e.key]
                                                  .isFavorite!,
                                            )
                                                .then((value) {
                                              if (priCont
                                                  .shopCategoryItemList[e.key]
                                                  .isFavorite!) {
                                                priCont.shopCategoryItemList[
                                                    e
                                                        .key] = priCont
                                                    .shopCategoryItemList[e.key]
                                                    .copyWith(
                                                        isFavorite: false);
                                              } else {
                                                priCont.shopCategoryItemList[
                                                    e
                                                        .key] = priCont
                                                    .shopCategoryItemList[e.key]
                                                    .copyWith(isFavorite: true);
                                              }
                                            });
                                            priCont.shopCategoryItemList.clear;
                                            // setState(() {});
                                            // preCont.shopModelList.refresh();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      if (priCont.isLoadingMoreItem.value)
                        Positioned(
                            bottom: 0.0,
                            child: Row(
                              children: const [
                                CupertinoActivityIndicator(),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Loading...")
                              ],
                            ))
                    ],
                  )
                : const CustomEmptyState(
                    colors: true,
                    title: 'Item Categories',
                    description: 'No Item Categories !',
                  ),
      ),
    );
  }
}
