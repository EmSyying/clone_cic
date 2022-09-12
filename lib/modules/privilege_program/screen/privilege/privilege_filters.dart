import 'package:cicgreenloan/modules/privilege_program/screen/privilege/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/custom_loading_button.dart';
import '../../../../widgets/dirctory/filter_option.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../controller/privilege_controller.dart';

class PrivilegeFilters extends StatefulWidget {
  final int? index;
  final bool showLocation;
  const PrivilegeFilters({
    Key? key,
    this.index,
    this.showLocation = true,
  }) : super(key: key);

  @override
  State<PrivilegeFilters> createState() => _PrivilegeFiltersState();
}

class _PrivilegeFiltersState extends State<PrivilegeFilters> {
  final privilegeController = Get.put(PrivilegeController());

  @override
  void initState() {
    privilegeController.onFetchStoreLocation(1);
    super.initState();
  }

  @override
  void dispose() {
    privilegeController.page.value = 1;
    privilegeController.onClearSelected();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        title: 'Filters',
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: customTitleText(titleText: 'Categories'),
              ),
              SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: privilegeController.categoriesModelList
                        .asMap()
                        .entries
                        .map((cardListCat) => Padding(
                              padding: const EdgeInsets.only(
                                top: 4.0,
                                bottom: 4.0,
                              ),
                              child: ComponentCardCategory(
                                onTapCatego: () {
                                  setState(() {
                                    privilegeController.selectedCategFil.value =
                                        cardListCat.value.name!;
                                  });
                                  privilegeController.categoriesId.value =
                                      cardListCat.value.id!;
                                  privilegeController
                                      .onFilterByCategoriesByLocation(
                                    categoryId: cardListCat.value.id,
                                  );
                                },
                                selected: privilegeController
                                        .selectedCategFil.value ==
                                    cardListCat.value.name,
                                modelCardCategory: cardListCat.value,
                              ),
                            ))
                        .toList(),
                  )),
              if (widget.showLocation)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 6.0),
                  child: customTitleText(titleText: 'Locations'),
                ),
              if (widget.showLocation)
                Column(
                  children: privilegeController.locationPrivilageList
                      .asMap()
                      .entries
                      .map((e) {
                    return GestureDetector(
                      onTap: () {
                        privilegeController.locationName.value =
                            e.value.nameEn!;
                        privilegeController.onSelected(
                          index: e.key,
                          selectedItemCode: e.value.code,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                          left: 10.0,
                        ),
                        child: FilterByType(
                          isSelect: privilegeController
                              .locationPrivilageList[e.key].isSelected,
                          display: e.value.nameEn,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              if (widget.showLocation)
                Container(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    left: 20.0,
                    top: 10.0,
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      privilegeController.isLoadingPriLocation.value
                          ? const CupertinoActivityIndicator()
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          privilegeController.seeMore();
                        },
                        child: Text(
                          privilegeController.isShowMore.value
                              ? 'See More'
                              : 'See Less',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title: "Clear All",
                  isOutline: true,
                  isDisable: false,
                  onPressed: () {
                    privilegeController.onClearSelected();
                  },
                )),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Obx(
                () => privilegeController.isLoadingCategoryFilter.value
                    ? const Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 20.0, bottom: 25.0, top: 20.0),
                        child: CustomLoadingButton(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 20.0, bottom: 25.0, top: 20.0),
                        child: CustomButton(
                          title:
                              'Show Result ${privilegeController.selectedCategFil.isNotEmpty || privilegeController.locationCodeList.isNotEmpty ? "(${privilegeController.categoryFilterList.length})" : ''}',
                          isDisable:
                              // privilegeController
                              //             .isLoadingCategoryFilter.value ==
                              //         false
                              privilegeController.selectedCategFil.isEmpty &&
                                      privilegeController
                                          .locationCodeList.isEmpty
                                  ? true
                                  : false,
                          isOutline: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(
                                  locationName:
                                      privilegeController.locationName.value,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTitleText({String? titleText}) {
    return Text(
      titleText ?? '',
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
