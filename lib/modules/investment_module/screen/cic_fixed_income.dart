import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';
import 'package:cicgreenloan/widgets/investments/custom_emptystate_on_cic_fixed_income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_button.dart';

import '../../../configs/auto_route/auto_route.gr.dart';
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
  List<Evolution> reversList = [];
  bool isExpandInvestmentReturn = false;
  final equityCon = Get.put(EquityInvestmentController());
  final priceController = Get.put(PriceController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> onRefresh() async {
    priceController.totalInvestmentButton(false); //make button always close
    priceController.getAllChartList();
    priceController.fetchInvestmentAccount();
    priceController.fetchFIFConfirm();
    priceController.getHiddentContract();
    priceController.getFIFApplication();
    priceController.fetchFIFPending();
    equityCon.fetchCallCenter(type: "FIF");
  }

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: onRefresh,
      child: Obx(() => priceController.fifApplicationLoading.value == false &&
                  priceController.isLoadingPending.value == false &&
                  priceController.isLoadingConfirm.value == false &&
                  priceController.isLoadingInvestment.value == false &&
                  priceController.getHiddentContractLoading.value == false
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
      onRefresh: onRefresh,
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
                        background: priceController.investmentModel.value
                                        .totalInvestment ==
                                    "0.00" ||
                                priceController.investmentModel.value
                                        .totalInvestment ==
                                    null ||
                                priceController.investmentModel.value
                                        .totalInvestment ==
                                    '0'
                            ? TotalInvestmentCard(
                                amount: priceController.investmentModel.value
                                            .totalInvestment !=
                                        null
                                    ? priceController
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
                                chartData: priceController.fifChartList,
                                amount: priceController
                                    .investmentModel.value.totalInvestment,
                              ),
                      ),
                    ),
                  ];
                },
                body: (priceController.fifAppPendingList.isEmpty &&
                        priceController.fifApplicationList.isEmpty &&
                        priceController.fifAppConfirmList.isEmpty &&
                        priceController.hiddenContractList.isEmpty)
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
                                      buttonShow: priceController
                                          .totalInvestmentButton.value,
                                      fifhiddenList:
                                          priceController.hiddenContractList,
                                      fifAccountList:
                                          priceController.fifApplicationList,
                                      fifConfirmList:
                                          priceController.fifAppConfirmList,
                                      fifPendingList:
                                          priceController.fifAppPendingList,
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
                  context.router.push(
                    AboutFiFRouter(
                        title: "About FIF",
                        url: priceController.investmentModel.value.aboutFif ??
                            "https://cic-association.com/"),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                isDisable: false,
                isOutline: false,
                title: priceController.fifAppConfirmList.isNotEmpty ||
                        priceController.fifAppPendingList.isNotEmpty ||
                        priceController.fifApplicationList.isNotEmpty
                    ? 'Invest More'
                    : 'Invest Now',
                onPressed: () async {
                  FirebaseAnalyticsHelper.sendAnalyticsEvent('invest more fif');
                  priceController.onClearFIF();
                  priceController.isNewBank.value = true;
                  priceController.textReceivingAccount.value = "";
                  priceController.clearDeducSelection();
                  context.router.push(FIFDeucSelectionRouter());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
