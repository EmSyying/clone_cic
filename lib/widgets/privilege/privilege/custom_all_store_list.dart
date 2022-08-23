import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:cicgreenloan/widgets/privilege/custom_shimmer_allshop.dart';
import 'package:cicgreenloan/widgets/privilege/privilege/costom_all_stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/privilege_program/model/stores_model/privilege_shop_model.dart';
import '../../../modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';

class CustomAllStoreList extends StatefulWidget {
  final List<PrivilegeShopModel> shopList;

  const CustomAllStoreList({
    Key? key,
    required this.shopList,
  }) : super(key: key);

  @override
  State<CustomAllStoreList> createState() => _CustomAllStoreListState();
}

class _CustomAllStoreListState extends State<CustomAllStoreList> {
  @override
  Widget build(BuildContext context) {
    final preCont = Get.put(PrivilegeController());
    return preCont.isLoadingShopList.value
        ? const CustomShimmerAllShop()
        : Column(
            children: widget.shopList
                .asMap()
                .entries
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      // context.router.push(PrivilegeDetailScreen(
                      //   index: e.key,
                      //   storeDetail: e.value,
                      // ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivilegeDetailScreen(
                            id: e.value.id,
                          ),
                        ),
                      );
                    },
                    child: CustomCardAllStores(
                      isFav: e.value.isFavorite,
                      privilegeShopList: e.value,
                      onTapFav: () {
                        setState(() {
                          widget.shopList[e.key].isFavorite;
                          preCont.shopModelList.refresh();
                          preCont.isFavorites.value =
                              !preCont.isFavorites.value;
                          // if (widget.shopList[e.key].isFavorite == true) {
                          //   preCont.shopModelList.add(widget.shopList[e.key]);
                          // } else {
                          //   preCont.shopModelList
                          //       .remove(widget.shopList[e.key]);
                          // }
                        });
                        // setState(() {
                        //   preCont.isFavorites.value =
                        //       !preCont.isFavorites.value;
                        //   //  widget.shopList[e.key].isFavorite= ! widget.shopList[e.key].isFavorite!;
                        //   preCont.shopModelList[e.key].isFavorite;
                        // });
                      },
                    ),
                  ),
                )
                .toList(),
          );
  }
}
