import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';

import 'package:cicgreenloan/widgets/get_funding/custom_application_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/container_partern.dart';
import '../../../widgets/get_funding/custom_shimmer_card_get_funding.dart';

class DebtInvestment extends StatefulWidget {
  const DebtInvestment({Key? key}) : super(key: key);

  @override
  State<DebtInvestment> createState() => _DebtInvestmentState();
}

///=======================================
class _DebtInvestmentState extends State<DebtInvestment> {
  bool isEmpty = true;
  final debtCon = Get.put(DebtInvestmentController());
  final ScrollController scrollController = ScrollController();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  int page = 1;
  Future<void> onRefresh() async {
    page = 1;
    debtCon.fetchApplicationCard(page: page);
  }

  onGetData() {
    page += 1;
    debtCon.fetchApplicationCard(page: page);
  }

  @override
  void initState() {
    debtCon.fetchApplicationCard(page: page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
        body: Builder(
            builder: (context) => CupertinoPageScaffold(
                    child: Obx(
                  () => debtCon.isDeleteDebt.value
                      ? Scaffold(
                          body: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black.withOpacity(0.7),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  SizedBox(height: padding),
                                  Text(
                                    "Deleting...",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Obx(
                          () => debtCon.isLoadingCard.value
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: CustomShimmerCardGetFunding(),
                                )
                              : !debtCon.isLoadingData.value &&
                                      debtCon.applicationCardList.isEmpty &&
                                      debtCon.applicationCardDraftList.isEmpty
                                  ? Column(
                                      children: [
                                        Expanded(
                                          child: RefreshIndicator(
                                            onRefresh: onRefresh,
                                            child: ListView(
                                              padding: const EdgeInsets.all(20),
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/svgfile/noDeptInvestmentState.svg'),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'No Debt Investment Yet',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        'Debt investment provides investment to potential Cambodian SMEs and Startups in all sectors. Our primary focus is to provide access to working capital to potential SMEs in various growing sectors in Cambodia.',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Value Proposition',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      buildValuePositionPoint(
                                                          'Access to collateral-free working capital'),
                                                      buildValuePositionPoint(
                                                          'Receive regular advisory services'),
                                                      buildValuePositionPoint(
                                                          'Receive recommendation and consultation'),
                                                      buildValuePositionPoint(
                                                          'Access to fast and convenient process'),
                                                      buildValuePositionPoint(
                                                          'Link to various experts to solve specific problems')
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 10),
                                          child: CustomButton(
                                            iconUrl:
                                                'assets/images/svgfile/getDebInvestmentIcon.svg',
                                            isDisable: false,
                                            isOutline: false,
                                            onPressed: () {
                                              debtCon.onResetData();
                                              context.push(
                                                  "/get_funding/debt-step1");
                                            },
                                            title: 'Get Debt Invesment',
                                          ),
                                        )
                                      ],
                                    )
                                  : RefreshIndicator(
                                      onRefresh: onRefresh,
                                      key: _refreshKey,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: NotificationListener<
                                                ScrollUpdateNotification>(
                                              onNotification:
                                                  (scrollNotification) {
                                                if (scrollNotification
                                                        .metrics.pixels ==
                                                    scrollNotification.metrics
                                                        .maxScrollExtent) {
                                                  onGetData();
                                                }
                                                return false;
                                              },
                                              child: ListView(
                                                padding: const EdgeInsets.only(
                                                    top: 20, bottom: 34),
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                controller: scrollController,
                                                children: [
                                                  debtCon.applicationCardList
                                                          .isNotEmpty
                                                      ? ApplicationList(
                                                          listTitle:
                                                              "Recent Applications",
                                                          listTitleColor:
                                                              const Color(
                                                                  0xff464646),
                                                          applicationList: debtCon
                                                              .applicationCardList,
                                                        )
                                                      : const SizedBox(),
                                                  const SizedBox(height: 20),
                                                  debtCon.applicationCardDraftList
                                                          .isNotEmpty
                                                      ? ApplicationList(
                                                          listTitle:
                                                              "Draft Applications",
                                                          listTitleColor:
                                                              const Color(
                                                                  0xff848F92),
                                                          applicationList: debtCon
                                                              .applicationCardDraftList,
                                                        )
                                                      : const SizedBox(),

                                                  ///Loading Pagination
                                                  debtCon.isFetchMoreDebt.value
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10,
                                                                  bottom: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Loading more ',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText2,
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 10,
                                                top: 10),
                                            child: CustomButton(
                                              onPressed: () {
                                                debtCon.onResetData();

                                                debtCon.applicationDetail.value
                                                    .status = "";
                                                context.push(
                                                    "/get_funding/debt-step1");
                                              },
                                              isDisable: false,
                                              isOutline: false,
                                              title: 'Create New Application',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                        ),
                ))));
  }

  buildCustomButton({String? iconUrl, String? title, Function? onPressed}) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(20),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SvgPicture.asset(iconUrl!),
            const SizedBox(
              width: 10,
            ),
            Text(
              title!,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  buildValuePositionPoint(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_sharp,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.subtitle2),
          ),
        ],
      ),
    );
  }
}
