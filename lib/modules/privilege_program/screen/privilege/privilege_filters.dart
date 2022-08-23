import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/dirctory/filter_option.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../controller/privilege_controller.dart';

class PrivilegeFilters extends StatefulWidget {
  final int? index;
  const PrivilegeFilters({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<PrivilegeFilters> createState() => _PrivilegeFiltersState();
}

class _PrivilegeFiltersState extends State<PrivilegeFilters> {
  final privilegeController = Get.put(PrivilegeController());
  @override
  void initState() {
    privilegeController.onFetchStoreLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        title: 'Filters',
      ),
      body: SingleChildScrollView(
        child: Column(
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
                              isOnClickCard:
                                  privilegeController.selectedCategFil.value ==
                                      cardListCat.value.name,
                              modelCardCategory: cardListCat.value,
                              onTapCatego: () {
                                setState(() {
                                  privilegeController.selectedCategFil.value =
                                      cardListCat.value.name!;
                                });
                              },
                            ),
                          ))
                      .toList(),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 6.0),
              child: customTitleText(titleText: 'Locations'),
            ),
            Obx(
              () => (Column(
                children: privilegeController.locationPrivilageList
                    .asMap()
                    .entries
                    .map((e) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (privilegeController
                                .locationPrivilageList[e.key].isSelected ==
                            false) {
                          privilegeController.locationPrivilageList[e.key] =
                              privilegeController.locationPrivilageList[e.key]
                                  .copyWith(isSelected: true);
                        } else {
                          privilegeController.locationPrivilageList[e.key] =
                              privilegeController.locationPrivilageList[e.key]
                                  .copyWith(isSelected: false);
                        }
                      });
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
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'See More',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
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
                  onPressed: () {},
                )),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title: "Show Result",
                  // "Show Result ${priCon.optionSelecList.isNotEmpty ? "(${priCon.optionSelecList.length.toString()})" : ""}",
                  isOutline: false,
                  isDisable: false,
                  onPressed: () {},
                )),
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
