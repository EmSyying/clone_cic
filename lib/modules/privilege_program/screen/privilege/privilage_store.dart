import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/privilege/trtansaction_strore.dart';
import '../../controller/privilege_controller.dart';

class PrivilageStoreScreen extends StatelessWidget {
  const PrivilageStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isInit = true;
    final privilegeController = Get.put(PrivilegeController());
    if (isInit) {
      privilegeController.storeBranchListPage.value = 1;
      privilegeController.onFetchShopBranchItemList(
          privilegeController.storeBranchListPage.value);
      privilegeController.onFetchNumberOfBranch();
      privilegeController.onFetchHomeStoreData();
      isInit = false;
    }

    return Obx(() {
      return Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: Get.height * 13 / 100, left: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff384593),
                        Color(0xff3588e8),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/svgfile/line.svg',
                    width: 200,
                    height: 200,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Padding(
                padding: EdgeInsets.only(right: 60),
                child: Center(
                  child: Text('Stores'),
                ),
              ),
            ),
            body: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.2,
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        background: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            // bottom: Get.height * 0.03,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total MVP',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffDBDBDB),
                                    ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                privilegeController
                                    .storeHomeDataModel.value.totalMvp,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svgfile/Sell icon.svg',
                                          height: 16,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'MVP In',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[300],
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              // '1000',
                                              privilegeController
                                                  .storeHomeDataModel
                                                  .value
                                                  .mvpIn
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SvgPicture.asset(
                                      'assets/images/svgfile/linestore.svg',
                                      height: 35,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svgfile/Sell out icon.svg',
                                          height: 16,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'MVP Out',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[300],
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              // '1000',
                                              privilegeController
                                                  .storeHomeDataModel
                                                  .value
                                                  .mvpOut
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ];
              }),
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            privilegeController.numberOfBranch.value,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: NotificationListener<ScrollEndNotification>(
                      onNotification: (scrollInfo) {
                        if (!privilegeController.isLoadingStoreListing.value &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          debugPrint(
                              "Hello===${privilegeController.storeBranchListPage.value},${privilegeController.storeBranchMetaModel.value.lastPage}");
                          if (privilegeController.storeBranchListPage.value <
                              privilegeController
                                  .storeBranchMetaModel.value.lastPage) {
                            debugPrint("Hello===True");
                            privilegeController.storeBranchListPage.value =
                                privilegeController.storeBranchListPage.value +
                                    1;

                            privilegeController.onFetchShopBranchItemList(
                                privilegeController.storeBranchListPage.value);
                          } else {
                            privilegeController.isHasStoreMoreLoading(false);
                          }
                        }
                        return true;
                      },
                      child: Stack(
                        children: [
                          RefreshIndicator(
                            onRefresh: () async {
                              privilegeController.storeBranchListPage.value = 1;
                              privilegeController.onFetchShopBranchItemList(
                                  privilegeController
                                      .storeBranchListPage.value);
                              privilegeController.onFetchNumberOfBranch();
                              privilegeController.onFetchHomeStoreData();
                            },
                            child: SingleChildScrollView(
                                child: Column(
                              children: [
                                if (privilegeController
                                    .isLoadingstoreBranch.value)
                                  for (var i = 0; i < 6; i++)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: i == 0 ? 10 : 0,
                                          bottom: 18,
                                          left: 20,
                                          right: 20),
                                      child:
                                          TransactionStore.buildShimer(context),
                                    )
                                else
                                  ...privilegeController.storeBranchList.value
                                      .asMap()
                                      .entries
                                      .map((e) => Padding(
                                            padding: EdgeInsets.only(
                                                top: e.key == 0 ? 10 : 0,
                                                bottom: 18,
                                                left: 20,
                                                right: 20),
                                            child: GestureDetector(
                                              onTap: () {
                                                try {
                                                  final current =
                                                      GoRouterState.of(context)
                                                          .location;

                                                  context.push(
                                                      "$current/mvp-history?id=${e.value.id}&shopName=${e.value.shopName}&amount=${e.value.amount}");
                                                } catch (_) {}
                                              },
                                              child: TransactionStore(
                                                title: e.value.shopName,
                                                content: e.value.amount,
                                                image: e.value.shop_logo,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                              ],
                            )),
                          ),
                          if (privilegeController.isHasStoreMoreLoading.value)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Loading more ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const CupertinoActivityIndicator(),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
