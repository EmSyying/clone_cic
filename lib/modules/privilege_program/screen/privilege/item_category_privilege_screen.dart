import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/custom_shimmer_allshop.dart';
import '../../../../widgets/privilege/privilege/costom_all_stores.dart';

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
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${priCont.shopCategoryItemList.length} Stores',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                    context.push(
                                        "/privilege/all-store/privilege-detail/${priCont.shopCategoryItemList[e.key].id}");
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
                                              .shopCategoryItemList[e.key].id!,
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
                                                .copyWith(isFavorite: false);
                                          } else {
                                            priCont.shopCategoryItemList[
                                                    e.key] =
                                                priCont
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
