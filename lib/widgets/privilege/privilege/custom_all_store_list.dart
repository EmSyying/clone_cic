import 'package:cicgreenloan/widgets/privilege/privilege/costom_all_stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/privilege_program/controller/privilege_controller.dart';
import '../../../modules/privilege_program/model/stores_model/model_pre.dart';
import '../../../modules/privilege_program/screen/privilege_detail/privilege_detail_screen.dart';

class CustomAllStoreList extends StatefulWidget {
  const CustomAllStoreList({Key? key, required this.storeList})
      : super(key: key);
  final List<StoreModel> storeList;

  @override
  State<CustomAllStoreList> createState() => _CustomAllStoreListState();
}

class _CustomAllStoreListState extends State<CustomAllStoreList> {
  @override
  Widget build(BuildContext context) {
    final previlageCon = Get.put(PrivilegeController());
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 20.0,
        //     bottom: 8.0,
        //   ),
        //   child: CustomNumberStoresFilter(
        //     onTapFilter: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const PrivilegeFilters(),
        //         ),
        //       );
        //     },
        //     titleStores: '${widget.storeList.length} Stores',
        //   ),
        // ),
        Column(
          children: widget.storeList
              .asMap()
              .entries
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivilegeDetailScreen(
                          index: e.key,
                          storeDetail: e.value,
                        ),
                      ),
                    );
                  },
                  child: CustomCardAllStores(
                    isFav: e.value.isFav,
                    storeModel: e.value,
                    onTapFav: () {
                      setState(() {
                        widget.storeList[e.key].isFav =
                            !widget.storeList[e.key].isFav;
                        previlageCon.favoritesList.refresh();

                        if (widget.storeList[e.key].isFav == true) {
                          previlageCon.favoritesList
                              .add(widget.storeList[e.key]);
                        } else {
                          previlageCon.favoritesList
                              .remove(widget.storeList[e.key]);
                        }
                      });
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
