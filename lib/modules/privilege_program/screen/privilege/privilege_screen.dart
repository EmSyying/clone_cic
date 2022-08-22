import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_filters.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../../Utils/custom_indicatior.dart';
import '../../../../widgets/privilege/custom_row_filter.dart';
import '../../../../widgets/privilege/custom_shimmer_categories.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../../../widgets/privilege/privilege/custom_all_store_list.dart';
import '../../../../widgets/privilege/privilege/custom_card_favorites_list.dart';
import '../../controller/privilege_controller.dart';

class PrivilegeScreen extends StatefulWidget {
  //final int? index;
  const PrivilegeScreen({
    Key? key,
    // this.index,
  }) : super(key: key);

  @override
  State<PrivilegeScreen> createState() => _PrivilegeScreenState();
}

class _PrivilegeScreenState extends State<PrivilegeScreen> {
  final priCon = Get.put(PrivilegeController());
  @override
  void initState() {
    priCon.onFetchListShop();
    priCon.onFetchCategories();
    super.initState();
  }

  int segmentedControlValue = 0;
  PageController controller = PageController();
  int currentIndex = 0;
  final preController = Get.put(PrivilegeController());

  final _settingCon = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Privilege Program',
        leading: IconButton(
            onPressed: () {
              // context.router.pop();
              Navigator.pop(context);
            },
            icon: kIsWeb
                ? const Icon(Icons.arrow_back)
                : Platform.isIOS
                    ? const Icon(Icons.arrow_back_ios)
                    : const Icon(Icons.arrow_back),
            color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: AspectRatio(
                  aspectRatio: 5 / 2.3,
                  child: Swiper(
                      loop: true,
                      index: currentIndex,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (_settingCon.slideList![index].status == 'Active') {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: _settingCon.slideList![index].image!,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                        return Container();
                      },
                      onIndexChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      curve: Curves.easeIn,
                      autoplay: true,
                      itemCount: _settingCon.slideList!.length,
                      viewportFraction: 1,
                      scale: 0.9),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _settingCon.slideList!
                      .asMap()
                      .entries
                      .where((element) => element.value.status == 'Active')
                      .map((e) => CustomIndicator(
                            isSelect: e.key == currentIndex,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //context.router.push(const SearchScreen());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/privilege/search.svg',
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Text(
                                  'Search',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.6,
                                        color: Colors.grey,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, left: 20, right: 20),
                child: customCategTitle(
                  categoriesTil: 'Categories',
                  seeall: 'See All',
                  onTapSeeAll: () {},
                ),
              ),
              ////Card List Categories===============================
              SingleChildScrollView(
                // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                scrollDirection: Axis.horizontal,
                child: preController.isLoadingCategories.value
                    ? const CustomShimmerCategories()
                    : Row(
                        children: preController.categoriesModelList
                            .asMap()
                            .entries
                            .map((cardListCat) => Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 4.0,
                                  ),
                                  child: ComponentCardCategory(
                                    modelCardCategory: cardListCat.value,
                                    onTapCatego: () {},
                                  ),
                                ))
                            .toList(),
                      ),
              ),
              ////Tabs All Stores and Favorites======================
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl(
                        groupValue: segmentedControlValue,
                        backgroundColor:
                            const Color(0xff252552).withOpacity(0.1),
                        children: <int, Widget>{
                          0: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'All Stores',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          1: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Favorites',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                      child: CustomNumberStoresFilter(
                        onTapFilter: () {
                         // context.router.pushNamed("privilege-filters");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivilegeFilters(),
                            ),
                          );
                        },
                        titleStores: segmentedControlValue == 0
                            ? '${preController.shopModelList.length} Stores'
                            : '${preController.favoritesList.length} Stores',
                      ),
                    ),

                    ///end Tabs Bar================
                    SizedBox(
                      height: 520,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (value) {
                          segmentedControlValue = value;
                          setState(() {});
                        },
                        children: [
                          //===All Stores=============
                          CustomAllStoreList(
                            shopList: preController.shopModelList,
                          ),
                          //Favoritess====12==============
                          const CustomCardFavoriesList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCategTitle({
    GestureTapCallback? onTapSeeAll,
    String? categoriesTil,
    String? seeall,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          child: Text(
            categoriesTil ?? '',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        GestureDetector(
          onTap: onTapSeeAll,
          child: Text(
            seeall ?? '',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
