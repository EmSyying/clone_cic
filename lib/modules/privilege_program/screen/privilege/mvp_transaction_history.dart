import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_overlay_button.dart';
import '../../../../widgets/privilege/custom_mvp_transaction_history.dart';
import '../../../../widgets/privilege/trtansaction_strore.dart';
import '../../controller/privilege_controller.dart';
import '../privilege_point/point_emptystate.dart';

class MVPTransactionHistory extends StatefulWidget {
  final String? id;
  final String? shopName;
  final String? amount;
  const MVPTransactionHistory({
    super.key,
    this.id,
    this.shopName,
    this.amount,
  });

  @override
  State<MVPTransactionHistory> createState() => _MVPTransactionHistoryState();
}

class _MVPTransactionHistoryState extends State<MVPTransactionHistory> {
  final privilegeController = Get.put(PrivilegeController());

  String _getFilter() {
    switch (selectedIndex) {
      case 0:
        return '';
      case 1:
        return 'today';
      case 2:
        return 'last_7_day';
      case 3:
        return 'last_30_day';
      default:
        return '';
    }
  }

  final _listPopup = [
    'All Period',
    'Today',
    'Last 7 Day',
    'Last 30 Day',
    // 'Custom Period',
  ];

  int selectedIndex = 0;

  int page = 1;

  ///History Pagination
  bool onScrollHistory(ScrollEndNotification scrollInfo) {
    final currentPage = privilegeController.paginationModel.currentPage ?? 0;
    final lastPage = privilegeController.paginationModel.lastPage ?? 0;
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        currentPage < lastPage) {
      page = page + 1;
      debugPrint('Scroll $page');
      privilegeController.onFetchMVPTransactionHistory(
          id: widget.id!, filter: _getFilter(), page: page);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;

    return GetBuilder(
      initState: (_) async {
        await privilegeController.onFetchMVPTransactionHistory(
            id: widget.id!, filter: _getFilter(), page: 1);

        await privilegeController.fetchHistoryShopData(widget.id!);
      },
      init: privilegeController,
      builder: (controller) => Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 150, left: 20),
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
          // const Scaffold(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Padding(
                padding: EdgeInsets.only(right: 60),
                child: Center(
                  child: Text('Transaction History'),
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.shopName ?? '',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffDBDBDB),
                                  ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GetBuilder(
                          id: 'popup',
                          init: privilegeController,
                          builder: (_) {
                            return CustomPopupButtonNew(
                              itemCount: _listPopup.length,
                              itemBuilder: (index) => Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                height: 40,
                                color: Colors.transparent,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      _listPopup[index],
                                      style: textStyle?.copyWith(
                                        fontSize: 14,
                                        color:
                                            index == 4 || selectedIndex == index
                                                ? AppColor.mainColor
                                                : AppColor.darkColor,
                                        fontWeight: selectedIndex == index
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                      ),
                                    ),
                                    if (selectedIndex == index)
                                      const Icon(
                                        Icons.done,
                                        size: 16,
                                        opticalSize: 10,
                                        weight: 1,
                                        color: AppColor.mainColor,
                                      )
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _listPopup[selectedIndex],
                                    style: textStyle?.copyWith(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              onSelected: (index) async {
                                if (index == 4) {
                                  customRouterSnackbar(
                                    description:
                                        'This feature is not available yet.',
                                  );
                                }
                                if (index != 4 && selectedIndex != index) {
                                  selectedIndex = index;
                                  page = 1;
                                  privilegeController.update(['popup']);

                                  await privilegeController
                                      .onFetchMVPTransactionHistory(
                                          id: widget.id!, filter: _getFilter());
                                }
                              },
                            );
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder: ((_, __) {
                      return [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          pinned: true,
                          expandedHeight: 70,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.none,
                            stretchModes: const [],
                            background: Container(
                              // color: Colors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, bottom: 31),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total MVP',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Obx(
                                              () => Text(
                                                privilegeController
                                                    .storeHistoryData
                                                    .value
                                                    .totalMvp
                                                    .toString()
                                                    .replaceAll(' MVP', ''),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/svgfile/Sell icon.svg'),
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
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[300],
                                                      ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Obx(
                                                  () => Text(
                                                    // '1000',
                                                    privilegeController
                                                        .storeHistoryData
                                                        .value
                                                        .mvpIn
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!
                                                        .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
                                            'assets/images/svgfile/linestore.svg'),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/svgfile/Sell out icon.svg'),
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
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey[300],
                                                      ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Obx(
                                                  () => Text(
                                                    // '1000',
                                                    privilegeController
                                                        .storeHistoryData
                                                        .value
                                                        .mvpOut
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!
                                                        .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ];
                    }),
                    body: Obx(
                      () => Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
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
                            Expanded(
                              child: privilegeController
                                      .mvpTransactionHistoryLoading.value
                                  ? ListView.separated(
                                      padding: const EdgeInsets.all(20),
                                      itemCount: 10,
                                      itemBuilder: (_, __) =>
                                          TransactionStore.buildShimer(context),
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 20),
                                    )
                                  : privilegeController
                                          .listTransactionHistory.isEmpty
                                      ? const PiointEmptyState(
                                          title: 'No transaction yet!',
                                          description: '',
                                        )
                                      : Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10, right: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    // '19 Branches',
                                                    'All Transactions',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                  ),
                                                  // GestureDetector(
                                                  //   onTap: () {},
                                                  //   child: SvgPicture.asset(
                                                  //       'assets/images/searchicon.svg'),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Expanded(
                                              child: RefreshIndicator(
                                                onRefresh: () async {
                                                  page = 1;
                                                  privilegeController
                                                      .onFetchMVPTransactionHistory(
                                                          id: widget.id!,
                                                          filter: _getFilter());
                                                },
                                                child: NotificationListener<
                                                    ScrollEndNotification>(
                                                  onNotification:
                                                      onScrollHistory,
                                                  child: ListView.separated(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    itemCount: privilegeController
                                                        .listTransactionHistory
                                                        .length,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    itemBuilder: (_, index) {
                                                      final transaction =
                                                          privilegeController
                                                                  .listTransactionHistory[
                                                              index];
                                                      return CustomMVPTransactionHistory(
                                                        referenceId:
                                                            transaction.refId,
                                                        rewardText: transaction
                                                            .description,
                                                        date: transaction
                                                            .paymentDate,
                                                        amount:
                                                            transaction.amount,
                                                        type: transaction
                                                            .transactionType,
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (_, index) =>
                                                            const Divider(
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (privilegeController
                                                .mvpTransactionHistoryLoadingMore
                                                .value)
                                              Container(
                                                color: Colors.transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                              )
                                          ],
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
