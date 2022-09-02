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
  final priCont = Get.put(PrivilegeController());

  @override
  void initState() {
    priCont.onFetchAllStore(1);
    priCont.onFetchShopDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('/privilege/all-store/id=============${widget.id}');
    return Obx(
      () => priCont.isLoadingShopList.value
          ? const CustomShimmerAllShop()
          : Column(
              children: priCont.shopModelList
                  .asMap()
                  .entries
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        //context.go('/privilege/all-store/${widget.id}');
                        // context.push("/privilege/all-store/id=${widget.id}");
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
                          priCont
                              .setFavouriteStore(
                            id: priCont.shopModelList[e.key].id!,
                            boolFav: priCont.shopModelList[e.key].isFavorite!,
                          )
                              .then((value) {
                            if (priCont.shopModelList[e.key].isFavorite!) {
                              priCont.shopModelList[e.key] = priCont
                                  .shopModelList[e.key]
                                  .copyWith(isFavorite: false);
                            } else {
                              priCont.shopModelList[e.key] = priCont
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
