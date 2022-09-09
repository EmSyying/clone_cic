import 'dart:io';

import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/widgets/investments/custom_emptystate_on_cic_fixed_income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/form_builder/custom_button.dart';

import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/investments/custom_fif_saving_card_list.dart';
import '../../../widgets/investments/custom_fif_total_investment_shimmer.dart';
import '../../../widgets/investments/custom_shimmer_fif_saving_card.dart';
import '../../../widgets/investments/custom_total_investment_card.dart';
import '../../get_funding/controller/equity_investment_controller.dart';
import '../model/first_date/first_date.dart';

class CiCFixedIncome extends StatefulWidget {
  const CiCFixedIncome({Key? key}) : super(key: key);

  @override
  State<CiCFixedIncome> createState() => _CiCFixedIncomeState();
}

class _CiCFixedIncomeState extends State<CiCFixedIncome> {
  final equityCon = Get.put(EquityInvestmentController());
  final fifController = Get.put(PriceController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  // Future<void> onRefresh() async {
  //   priceController.totalInvestmentButton(false); //make button always close
  //   priceController.getAllChartList();
  //   priceController.fetchInvestmentAccount();
  //   priceController.fetchFIFConfirm();
  //   priceController.getHiddentContract();
  //   priceController.getFIFApplication();
  //   priceController.fetchFIFPending();
  //   equityCon.fetchCallCenter(type: "FIF");
  // }

  @override
  void initState() {
    fifController.onRefreshFIF();
    equityCon.fetchCallCenter(type: "FIF");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: fifController.onRefreshFIF,
      child: Obx(() => fifController.fifApplicationLoading.value == false &&
                  fifController.isLoadingPending.value == false &&
                  fifController.isLoadingConfirm.value == false &&
                  fifController.isLoadingInvestment.value == false &&
                  fifController.getHiddentContractLoading.value == false
              ?

              ///when all fetch function done it work here
              showData()
              : showShimmer()

          ///data

          ),
    );
  }

  Widget showData() {
    return RefreshIndicator(
      notificationPredicate: (notification) {
        // with NestedScrollView local(depth == 2) OverscrollNotification are not sent
        if (notification is OverscrollNotification || Platform.isIOS) {
          return notification.depth == 2;
        }
        return notification.depth == 2;
      },
      onRefresh: fifController.onRefreshFIF,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              child: NestedScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      expandedHeight: 108.0,
                      stretch: true,
                      onStretchTrigger: () async {
                        debugPrint('stretch');
                      },
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: const <StretchMode>[
                          StretchMode.zoomBackground
                        ],
                        // collapseMode: CollapseMode.parallax,
                        background: fifController.investmentModel.value
                                        .totalInvestment ==
                                    "0.00" ||
                                fifController.investmentModel.value
                                        .totalInvestment ==
                                    null ||
                                fifController.investmentModel.value
                                        .totalInvestment ==
                                    '0'
                            ? TotalInvestmentCard(
                                amount: fifController.investmentModel.value
                                            .totalInvestment !=
                                        null
                                    ? fifController
                                        .investmentModel.value.totalInvestment!
                                    : "0.00",
                                chartData: [
                                  FIFApplicationListModel(
                                    investmentAmount: "\$1,11100",
                                    color: '#BDBDBD',
                                    accountName: 'No Data State',
                                  ),
                                ],
                              )

                            ///BDBDBD
                            : TotalInvestmentCard(
                                chartData: fifController.fifChartList,
                                amount: fifController
                                    .investmentModel.value.totalInvestment,
                              ),
                      ),
                    ),
                  ];
                },
                body: (fifController.fifAppPendingList.isEmpty &&
                        fifController.fifApplicationList.isEmpty &&
                        fifController.fifAppConfirmList.isEmpty &&
                        fifController.hiddenContractList.isEmpty)
                    ? showEmptyState()
                    : Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 5.13,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffBFBFBF),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomSavingCardList(
                                      buttonShow: fifController
                                          .totalInvestmentButton.value,
                                      fifhiddenList:
                                          fifController.hiddenContractList,
                                      fifAccountList:
                                          fifController.fifApplicationList,
                                      fifConfirmList:
                                          fifController.fifAppConfirmList,
                                      fifPendingList:
                                          fifController.fifAppPendingList,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          showAllButton(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showShimmer() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CustomFIFTotalInvestmentShimmer(),
          SizedBox(
            height: 30,
          ),
          CustomShimmerFIFSavingCard()
        ],
      ),
    );
  }

  Widget showEmptyState() {
    return Column(
      children: [
        const Expanded(
          child: CustomEmptyStateCiCFixIcome(),
        ),
        const SizedBox(height: 20.0),
        showAllButton()
      ],
    );
  }

  showAllButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 20, top: 20),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                isDisable: false,
                isOutline: true,
                title: 'About FIF',
                onPressed: () {
                  FirebaseAnalyticsHelper.sendAnalyticsEvent('about fif');
                  context.push(
                      '/investment/cic-fixed-fund/about-fif?title=About FIF&url=${fifController.investmentModel.value.aboutFif}');
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                isDisable: false,
                isOutline: false,
                title: fifController.fifAppConfirmList.isNotEmpty ||
                        fifController.fifAppPendingList.isNotEmpty ||
                        fifController.fifApplicationList.isNotEmpty
                    ? 'Invest More'
                    : 'Invest Now',
                onPressed: () async {
                  FirebaseAnalyticsHelper.sendAnalyticsEvent('invest more fif');
                  fifController.onClearFIF();
                  fifController.isNewBank.value = true;
                  fifController.textReceivingAccount.value = "";
                  fifController.clearDeducSelection();
                  context.push('/investment/cic-fixed-fund/invest-more');
                  // context.router.push(FIFDeucSelectionRouter());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
