import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/privilege_history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../Utils/custom_indicatior.dart';
import '../../../../Utils/form_builder/custom_material_modal_sheet.dart';
import '../../../../Utils/function/format_to_k.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../utils/permission/controller/permision_controller.dart';
import '../../../../widgets/privilege/custom_row_filter.dart';
import '../../../../widgets/privilege/custom_shimmer_categories.dart';
import '../../../../widgets/privilege/privilege/compoment_card_category.dart';
import '../../../../widgets/privilege/privilege/custom_store_listing.dart';
import '../../../wallet/controller/wallet_controller.dart';
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
  final priCon = Get.put(PrivilegeController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  final _walletController = Get.put(WalletController());

  Future<void> onRefresh() async {
    debugPrint("On refresh");
    priCon.shopPage = 1;
    // setState(() => priCon.filterString.value = "");
    await priCon.onFetchStoreData(
        priCon.segmentedControlValue.value, priCon.shopPage,
        filterString: priCon.filterString.value);
    //
  }

  final _permissionController = Get.put(PermissionController());

  @override
  void initState() {
    _permissionController.checkLocationPermission();
    _walletController.onFetchMyPoin();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      debugPrint('Privilege Inistate');
      final router = GoRouter.of(context);
      if (router.location.contains('all-stores')) {
        priCon.segmentedControlValue.value = 0;
      } else {
        priCon.segmentedControlValue.value = 1;
      }
    });
    // onRefresh();

    priCon.onFetchCategories();
    priCon.onRefreshPrivilege();
    // _settingCon.fetchSlidePrivilege();
    priCon.fetchPrivilegeSlide();

    super.initState();
  }

  // List<Widget> storePages = [
  //   const CustomAllStoreList(),
  //   const CustomCardFavoriesList(),
  // ];

  int currentIndex = 0;
  final preController = Get.put(PrivilegeController());
  File? nationalBack;
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Scaffold(
            appBar: CustomAppBar(
              elevation: 0,
              isLogo: false,
              isLeading: true,
              context: context,
              title: "Privilege",
              action: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          context.go('/privilege/all-store/point-screen');
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: SvgPicture.asset(
                              "assets/images/svgfile/pointnew.svg",
                              width: 20.0,
                              height: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8.0,
                      //right: 0.0,
                      // _walletController.myPoint.value >= 999 ? 5.0 : 12.0,
                      top: 8.0,
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          height: 14,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 3,
                                right: 3,
                              ),
                              child: Text(
                                FormatToK.convertNumber(_walletController
                                        .mvpBalance.value.mvpAmount ??
                                    0.00),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const PrivilageStoreScreen(),
                //           ));
                //     },
                //     child: const Text(
                //       'test',
                //       style: TextStyle(color: Colors.green),
                //     )),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () async {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent('history');
                      await onShowCustomCupertinoModalSheet(
                        context: context,
                        icon: const Icon(Icons.close_rounded),
                        title: "History",
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: PrivilegeHistory(),
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/images/history.svg"),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: onRefresh,
                  key: refreshKey,
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: priCon.onNotification,
                    child: SingleChildScrollView(
                      child: Obx(
                        () => Column(
                          children: [
                            !priCon.isLoadingSlidePri.value &&
                                    priCon.privilegeSlideList.isNotEmpty
                                ? AspectRatio(
                                    aspectRatio: 5 / 2.3,
                                    child: Swiper(
                                      loop: true,
                                      index: currentIndex,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        if (priCon.privilegeSlideList[index]
                                                .status ==
                                            'Display') {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 20, right: 20),
                                            child: GestureDetector(
                                              onTap: () {
                                                context.go(
                                                    "/privilege/all-store/privilege-detail/${priCon.privilegeSlideList[index].shopId}");
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Stack(
                                                  children: [
                                                    Positioned.fill(
                                                      child: CachedNetworkImage(
                                                        imageUrl: priCon
                                                            .privilegeSlideList[
                                                                index]
                                                            .image!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                      itemCount:
                                          priCon.privilegeSlideList.length,
                                      viewportFraction: 1,
                                      scale: 0.9,
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
                                children: priCon.privilegeSlideList
                                    .asMap()
                                    .entries
                                    .where((element) =>
                                        element.value.status == 'Display')
                                    .map((e) => CustomIndicator(
                                          isSelect: e.key == currentIndex,
                                        ))
                                    .toList(),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 18, left: 20, right: 20),
                              child: customCategTitle(
                                categoriesTil: 'Categories',
                                seeall: 'See All',
                                onTapSeeAll: () {
                                  context.push(
                                      '/privilege/all-stores/privilege-see-all');
                                  // context.push(
                                  //     '/privilege/all-store/privilege-see-all');
                                },
                              ),
                            ),
                            ////Card List Categories
                            SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              scrollDirection: Axis.horizontal,
                              child: preController.isLoadingCategories.value
                                  ? const CustomShimmerCategories()
                                  : Row(
                                      children: preController
                                          .categoriesModelList
                                          .asMap()
                                          .entries
                                          .map((cardListCat) => Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 4.0,
                                                  bottom: 4.0,
                                                  right: 14.0,
                                                ),
                                                child: ComponentCardCategory(
                                                  mineTye: cardListCat
                                                      .value.mimeTypeImag,
                                                  cardTitle:
                                                      cardListCat.value.name,
                                                  iconCard:
                                                      cardListCat.value.image,
                                                  onTapCatego: () {
                                                    final titleName =
                                                        cardListCat.value.name
                                                            ?.replaceAll(
                                                                '&', '%26');
                                                    // priCon
                                                    //     .onFetchCategoryItem(
                                                    //         cardListCat.value.id)
                                                    //     .then((value) {
                                                    //   context.push(
                                                    //     '/privilege/all-store/privilege-item-category?tabTitle=$titleName',
                                                    //   );
                                                    // });
                                                    context.go(
                                                      '/privilege/all-store/privilege-item-category?tabTitle=$titleName&id=${cardListCat.value.id}',
                                                    );
                                                  },
                                                ),
                                              ))
                                          .toList(),
                                    ),
                            ),
                            ////Tabs All Stores and Favorites======================
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 18.0, right: 20),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    child: CupertinoSlidingSegmentedControl(
                                      groupValue:
                                          priCon.segmentedControlValue.value,
                                      backgroundColor: const Color(0xff252552)
                                          .withOpacity(0.1),
                                      children: <int, Widget>{
                                        0: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'All Stores',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
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
                                                .bodyLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      },
                                      onValueChanged: (int? value) {
                                        setState(() {
                                          priCon.shopPage = 1;
                                          priCon.segmentedControlValue.value =
                                              value!;
                                        });
                                        debugPrint("segmentedControlValue");
                                        priCon.onFetchStoreData(value ?? 0, 1,
                                            filterString:
                                                priCon.filterString.value);
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
                                    child: CustomNumberStoresFilter(
                                      onSelected: (str) {
                                        debugPrint("str===$str");
                                        priCon.shopPage = 1;
                                        switch (str.toLowerCase()) {
                                          case "discount":
                                            priCon.filterString.value =
                                                "discount";
                                            break;
                                          case "mvp approved":
                                            priCon.filterString.value =
                                                "mvp_approved";
                                            break;
                                          default:
                                            priCon.filterString.value = "";
                                            break;
                                        }
                                        debugPrint(
                                            "priCon.filterString.value${priCon.filterString.value}");
                                        priCon.onFetchStoreData(
                                            priCon.segmentedControlValue.value,
                                            1,
                                            filterString:
                                                priCon.filterString.value);
                                      },
                                      onTapSearch: () {
                                        context.go(
                                            "/privilege/all-stores/search-item");
                                      },
                                      onTapFilter: () {
                                        context.go(
                                            "/privilege/all-stores/filter-item");
                                      },
                                      // titleStores: priCon.segmentedControlValue
                                      //             .value ==
                                      //         0
                                      //     ? '${preController.storeAmount} Stores'
                                      //     : '${preController.favshopModelList.length} Stores',
                                    ),
                                  ),

                                  // storePages[
                                  //     priCon.segmentedControlValue.value],
                                  CustomStoreListing(
                                    index: priCon.segmentedControlValue.value,
                                    page: 1,
                                    filterString: priCon.filterString.value,
                                  )

                                  ///end Tabs Bar================
                                ],
                              ),
                            ),

                            ///Loading Pagination
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => priCon.isLoadingMoreShop.value
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Loading more ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const CupertinoActivityIndicator(),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
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
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
