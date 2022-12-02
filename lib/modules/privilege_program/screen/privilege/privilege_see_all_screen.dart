import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../../../widgets/privilege/privilege/custom_formfield_search.dart';

class PrivilegeSeeAllScreen extends StatelessWidget {
  const PrivilegeSeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priCon = Get.put(PrivilegeController());
    //priCon.onFetchCategories();
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
            child: priCon.isLoadingCategories.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
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
                          onChanged: (v) {},
                          // controller: documentCon.textSearchController,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Column(
                        children: priCon.categoriesModelList
                            .asMap()
                            .entries
                            .map((cardListCat) => Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 14.0,
                                  ),
                                  child: ComponentCardCategory(
                                    height: 96,
                                    isHeight: true,
                                    widthTrue: true,
                                    numStoresTrue: true,
                                    cardTitle: cardListCat.value.name,
                                    iconCard: cardListCat.value.image,
                                    onTapCatego: () {
                                      context.push(
                                        '/privilege/all-store/privilege-item-category?tabTitle=${cardListCat.value.name}',
                                      );
                                      
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
