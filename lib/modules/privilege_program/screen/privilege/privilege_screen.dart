import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import '../../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../../Utils/custom_indicatior.dart';
import '../../../../widgets/privilege/custom_row_filter.dart';
import '../../../../widgets/privilege/custom_shimmer_categories.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../../../widgets/privilege/privilege/custom_all_store_list.dart';
import '../../../../widgets/privilege/privilege/custom_card_favorites_list.dart';
import '../../controller/privilege_controller.dart';

class PrivilegeScreen extends StatefulWidget {
  final String? tabName;
  const PrivilegeScreen({
    Key? key,
    this.tabName,
  }) : super(key: key);

  @override
  State<PrivilegeScreen> createState() => _PrivilegeScreenState();
}

class _PrivilegeScreenState extends State<PrivilegeScreen> {
  final ScrollController scrollController = ScrollController();
  final priCon = Get.put(PrivilegeController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final _settingCon = Get.put(SettingController());
  int page = 1;
  Future<void> onRefresh() async {
    page = 1;
    priCon.onFetchAllStore(page);
  }

  getData() {
    page += 1;
    priCon.onFetchAllStore(page);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final router = GoRouter.of(context);
      if (router.location.contains('all-stores')) {
        segmentedControlValue = 1;
      } else {
        segmentedControlValue = 0;
      }
    });

    priCon.onFetchAllStore(page);
    priCon.onFetchCategories();
    priCon.onRefreshPrivilege();
    _settingCon.fetchSlidePrivilege();
    super.initState();
  }

  final storePages = [
    const CustomAllStoreList(),
    const CustomCardFavoriesList(),
  ];

  int segmentedControlValue = 0;
  int currentIndex = 0;
  final preController = Get.put(PrivilegeController());
  File? nationalBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLogo: false,
        isLeading: true,
        context: context,
        title: "Privilege Program",
        action: [
          Stack(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.only(right: 18.0),
                child: SvgPicture.asset("assets/images/svgfile/Union.svg"),
              ),
              Positioned(
                right: 4,
                bottom: 34,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  height: 14,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 2.0,
                        right: 2.0,
                      ),
                      child: Text(
                        '100',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset("assets/images/history.svg"),
          ),
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: onRefresh,
          key: refreshKey,
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent) {
                getData();
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  !_settingCon.isLoading.value &&
                          _settingCon.slideListPrivilege!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: AspectRatio(
                            aspectRatio: 5 / 2.3,
                            child: Swiper(
                              loop: true,
                              index: currentIndex,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (_settingCon
                                        .slideListPrivilege![index].module ==
                                    'Privilege') {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: CachedNetworkImage(
                                            imageUrl: _settingCon
                                                .slideListPrivilege![index]
                                                .image!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
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
                              itemCount: _settingCon.slideListPrivilege!.length,
                              viewportFraction: 1,
                              scale: 0.9,
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 180,
                          width: double.infinity,
                        ),

                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _settingCon.slideListPrivilege!
                          .asMap()
                          .entries
                          .where(
                              (element) => element.value.module == 'Privilege')
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
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 20, left: 20, right: 20),
                    child: customCategTitle(
                      categoriesTil: 'Categories',
                      seeall: 'See All',
                      onTapSeeAll: () {
                        context.push('/privilege/all-store/privilege-see-all');
                      },
                    ),
                  ),
                  ////Card List Categories===============================
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    scrollDirection: Axis.horizontal,
                    child: preController.isLoadingCategories.value
                        ? const CustomShimmerCategories()
                        : Row(
                            children: preController.categoriesModelList
                                .asMap()
                                .entries
                                .map((cardListCat) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0, bottom: 4.0, right: 14.0),
                                      child: ComponentCardCategory(
                                        mineTye: cardListCat.value.mimeTypeImag,
                                        cardTitle: cardListCat.value.name,
                                        iconCard: cardListCat.value.image,
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
                                          // context.push(
                                          //   "/privilege/all-store/privilege-item-category?tabTitle=$titleName&id=${cardListCat.value.id}",
                                          // );
                                        },
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
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: CustomNumberStoresFilter(
                            onTapSearch: () {
                              context.go("/privilege/all-stores/search-item");
                            },
                            onTapFilter: () {
                              context.go("/privilege/all-stores/filter-item");
                            },
                            titleStores: segmentedControlValue == 0
                                ? '${preController.shopModelList.length} Stores'
                                : '${preController.favshopModelList.length} Stores',
                          ),
                        ),

                        storePages[segmentedControlValue],

                        ///end Tabs Bar================
                      ],
                    ),
                  ),

                  ///Loading Pagination
                  priCon.isfetcheAllStoredata.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Loading more ',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const CupertinoActivityIndicator(),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
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
        const Spacer(),
        InkWell(
          onTap: onTapSeeAll,
          child: Text(
            seeall ?? '',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.mainColor,
                ),
          ),
        ),
      ],
    );
  }
}
