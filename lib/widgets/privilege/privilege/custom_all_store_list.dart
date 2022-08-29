import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:cicgreenloan/widgets/privilege/custom_shimmer_allshop.dart';
import 'package:cicgreenloan/widgets/privilege/privilege/costom_all_stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';

class CustomAllStoreList extends StatefulWidget {
  final int? id;
  const CustomAllStoreList({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<CustomAllStoreList> createState() => _CustomAllStoreListState();
}

class _CustomAllStoreListState extends State<CustomAllStoreList> {
  final preCont = Get.put(PrivilegeController());
  @override
  void initState() {
    preCont.onFetchAllStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => preCont.isLoadingShopList.value
          ? const CustomShimmerAllShop()
          : Column(
              children: preCont.shopModelList
                  .asMap()
                  .entries
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        // context.go('/allstores/family/${widget.id}');
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
                        isFav: e.value.isFavorite!,
                        privilegeShopList: e.value,
                        onTapFav: () {
                          preCont
                              .setFavouriteStore(
                                  id: preCont.shopModelList[e.key].id!,
                                  fav: preCont.shopModelList[e.key].isFavorite!)
                              .then((value) {
                            if (preCont.shopModelList[e.key].isFavorite!) {
                              preCont.shopModelList[e.key] = preCont
                                  .shopModelList[e.key]
                                  .copyWith(isFavorite: false);
                            } else {
                              preCont.shopModelList[e.key] = preCont
                                  .shopModelList[e.key]
                                  .copyWith(isFavorite: true);
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
    );
  }
}
