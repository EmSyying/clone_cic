import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
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
    // priCont.onFetchAllStore(1);
    //priCont.onFetchShopDetail(widget.id);

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
        () => priCont.isLoadingShopList.value
            ? const Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomShimmerAllShop(),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${priCont.shopModelList.length} Stores',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.chartLabelColor,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: priCont.shopModelList
                          .asMap()
                          .entries
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                context.push(
                                    "/privilege/all-store/privilege-detail/${priCont.shopModelList[e.key].id}");
                              },
                              child: CustomCardAllStores(
                                isFav: e.value.isFavorite!,
                                privilegeShopList: e.value,
                                onTapFav: () {
                                  priCont
                                      .setFavouriteStore(
                                    id: priCont.shopModelList[e.key].id!,
                                    boolFav: priCont
                                        .shopModelList[e.key].isFavorite!,
                                  )
                                      .then((value) {
                                    if (priCont
                                        .shopModelList[e.key].isFavorite!) {
                                      priCont.shopModelList[e.key] = priCont
                                          .shopModelList[e.key]
                                          .copyWith(isFavorite: false);
                                    } else {
                                      priCont.shopModelList[e.key] = priCont
                                          .shopModelList[e.key]
                                          .copyWith(isFavorite: true);
                                    }
                                  });
                                  priCont.shopModelList.clear;
                                  // setState(() {});
                                  // preCont.shopModelList.refresh();
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
