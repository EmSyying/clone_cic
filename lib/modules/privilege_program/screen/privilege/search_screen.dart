import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/privilege/custom_shimmer_allshop.dart';
import '../../../../widgets/privilege/privilege/costom_all_stores.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../../widgets/privilege/privilege/custom_location card.dart';
import '../../controller/privilege_controller.dart';
import '../privilege_detail/privilege_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int segmentedControlValue = 0;
  PageController controller = PageController();
  final privilegController = Get.put(PrivilegeController());

  Timer? searchOnStoppedTyping;
  int index = 0;
  onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      // clear timer
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(
        () => searchOnStoppedTyping = Timer(duration, () => searchText(value)));
  }

  String keySearch = '';
  searchText(textSearch) async {
    setState(() {
      keySearch = textSearch;
    });
    if (textSearch.isNotEmpty) {
      setState(() {
        keySearch = textSearch;
      });
      index == 1
          ? privilegController.onSearchStores(keySearch: keySearch)
          : privilegController.onSearchStores(keySearch: keySearch);
    }
    if (textSearch.isEmpty) {
      index == 1
          ? privilegController.onSearchStores(keySearch: keySearch)
          : () {
              privilegController.onSearchStores(keySearch: keySearch);
            }();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
          onPressed: () {
            //context.router.pop();
            Navigator.pop(context);
          },
        ),
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
              if (v == '') {
                privilegController.searchShopList.value = [];
                privilegController.update();
              } else {
                onChangeHandler(v);
              }
              debugPrint('hiii123++++z:$v');
            },
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            color: Colors.transparent,
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              groupValue: segmentedControlValue,
              backgroundColor: const Color(0xff252552).withOpacity(0.1),
              children: <int, Widget>{
                0: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Stores',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                1: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Location',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              },
              onValueChanged: (int? value) {
                setState(() {
                  segmentedControlValue = value!;
                  controller.animateToPage(segmentedControlValue,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastLinearToSlowEaseIn);
                });
              },
            ),
          ),
          SizedBox(
            height: 520,
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                segmentedControlValue = value;
                setState(() {});
              },
              children: [
                //Store/Shop
                Obx(
                  () => privilegController.isSearchLoading.value
                      ? const CustomShimmerAllShop()
                      : SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              children: privilegController.searchShopList
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
                                              id: e.value.id,
                                            ),
                                          ),
                                        );
                                      },
                                      child: CustomCardAllStores(
                                        isFav: e.value.isFavorite!,
                                        privilegeShopList: e.value,
                                        onTapFav: () {
                                          privilegController
                                              .setFavouriteStore(
                                                  id: privilegController
                                                      .searchShopList[e.key]
                                                      .id!,
                                                  fav: privilegController
                                                      .searchShopList[e.key]
                                                      .isFavorite!)
                                              .then((value) {
                                            if (privilegController
                                                .searchShopList[e.key]
                                                .isFavorite!) {
                                              privilegController
                                                      .searchShopList[e.key] =
                                                  privilegController
                                                      .searchShopList[e.key]
                                                      .copyWith(
                                                          isFavorite: false);
                                            } else {
                                              privilegController
                                                      .searchShopList[e.key] =
                                                  privilegController
                                                      .searchShopList[e.key]
                                                      .copyWith(
                                                          isFavorite: true);
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
                          ),
                        ),
                ),
                //Location
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: privilegController.listAllStores
                        .map(
                          (location) => CustomLocationCard(
                            locatModel: location,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
