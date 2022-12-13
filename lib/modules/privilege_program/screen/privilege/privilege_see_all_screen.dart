import 'dart:async';

import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';

class PrivilegeSeeAllScreen extends StatefulWidget {
  const PrivilegeSeeAllScreen({Key? key}) : super(key: key);

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
        backgroundColor: AppColor.mainColor,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
              left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                                .map((cardListCat) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 14.0,
                                      ),
                                      child: ComponentCardCategory(
                                        height: 96,
                                        heightIcon: 48,
                                        widthIcon: 109,
                                        isHeight: true,
                                        widthTrue: true,
                                        numStoresTrue: true,
                                        mineTye: cardListCat.value.mimeTypeImag,
                                        cardTitle: cardListCat.value.name,
                                        iconCard: cardListCat.value.image,
                                        countShop: cardListCat.value.countShop
                                            .toString(),
                                        onTapCatego: () {
                                          final titleName = cardListCat
                                              .value.name
                                              ?.replaceAll('&', '%26');
                                          priCon
                                              .onFetchCategoryItem(
                                                  cardListCat.value.id)
                                              .then((value) {
                                            context.push(
                                              '/privilege/all-store/privilege-item-category?tabTitle=$titleName',
                                            );
                                          });
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
