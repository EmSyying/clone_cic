import 'dart:async';

import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';

class PrivilegeSeeAllScreen extends StatefulWidget {
  const PrivilegeSeeAllScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PrivilegeSeeAllScreen> createState() => _PrivilegeSeeAllScreenState();
}

class _PrivilegeSeeAllScreenState extends State<PrivilegeSeeAllScreen> {
  Timer? searchOnStoppedTyping;
  final priCon = Get.put(PrivilegeController());
  @override
  void initState() {
    priCon.onSearchCategories('');

    super.initState();
  }

  onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(
      () => searchOnStoppedTyping = Timer(duration, () => searchText(value)),
    );
  }

  searchText(textSearch) async {
    await priCon.onSearchCategories(textSearch).then((value) {
      // priCon.textSearchCategoriesController.text = textSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Categories',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Container(
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
                    onChanged: (v) async {
                      await onChangeHandler(v);
                    },
                    //  controller: priCon.textSearchCategoriesController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                priCon.isLoadingSearchCate.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : priCon.categoriesListSeeAll.isNotEmpty
                        ? Column(
                            children: priCon.categoriesListSeeAll
                                .asMap()
                                .entries
                                .map((seeall) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 14.0,
                                      ),
                                      child: ComponentCardCategory(
                                        height: 96, //hieght card category
                                        heightIcon: 48, //height icon
                                        widthIcon: 109, //width icon
                                        isHeight: true,
                                        widthTrue: true,
                                        numStoresTrue: true,
                                        mineTye: seeall.value.mimeTypeImag,
                                        cardTitle: seeall.value.name,
                                        iconCard: seeall.value.image,
                                        countShop:
                                            seeall.value.countShop.toString(),
                                        onTapCatego: () {
                                          final titleName = seeall.value.name
                                              ?.replaceAll('&', '%26');
                                          context.push(
                                            '/privilege/all-store/privilege-item-category?tabTitle=$titleName&id=${seeall.value.id}',
                                          );
                                          // priCon
                                          //     .onFetchCategoryItem(
                                          //         cardListCat.value.id)
                                          //     .then((value) {
                                          //   context.push(
                                          //     '/privilege/all-store/privilege-item-category?tabTitle=$titleName',
                                          //   );
                                          // });
                                        },
                                      ),
                                    ))
                                .toList(),
                          )
                        : const CustomEmptyState(
                            colors: true,
                            title: 'Categories',
                            description: 'No Card Categories !',
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
