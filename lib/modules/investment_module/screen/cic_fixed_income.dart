import 'dart:io';

import 'package:cicgreenloan/Utils/helper/injection_helper/injection_helper.dart';
import 'package:cicgreenloan/widgets/investments/custom_emptystate_on_cic_fixed_income.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/form_builder/custom_button.dart';

import '../../../utils/helper/custom_appbar.dart';
import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/investments/custom_fif_saving_card_list.dart';
import '../../../widgets/investments/custom_fif_total_investment_shimmer.dart';
import '../../../widgets/investments/custom_shimmer_fif_saving_card.dart';
import '../../../widgets/investments/custom_total_investment_card.dart';
import '../model/first_date/first_date.dart';

class CiCFixedIncome extends StatefulWidget {
  final bool ismmaInvestFIF;
  const CiCFixedIncome({Key? key, this.ismmaInvestFIF = false})
      : super(key: key);

  @override
  State<CiCFixedIncome> createState() => _CiCFixedIncomeState();
}

class _CiCFixedIncomeState extends State<CiCFixedIncome> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    InjectionHelper.investmentController.onRefreshFIF();
    InjectionHelper.equityInvestmentController.fetchCallCenter(type: "FIF");
    InjectionHelper.investmentController
        .onCreateFiF(id: 1, buildcontext: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.ismmaInvestFIF == false
        ? RefreshIndicator(
            key: refreshKey,
            onRefresh: InjectionHelper.investmentController.onRefreshFIF,
            child:
                Obx(
                    () =>
                        InjectionHelper.investmentController
                                        .fifApplicationLoading.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .isLoadingPending.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .isLoadingConfirm.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .isLoadingInvestment.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .getHiddentContractLoading.value ==
                                    false
                            ?

                            ///when all fetch function done it work here
                            showData()
                            : showShimmer()

                    ///data
                    ),
          )
        : Scaffold(
            appBar: CustomAppBar(
              elevation: 0,
              isLeading: true,
              isLogo: false,
              context: context,
              title: "CiC Fixed Income Fund",
            ),
            body: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/images/svgfile/Investment_backg.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: RefreshIndicator(
                    key: refreshKey,
                    onRefresh:
                        InjectionHelper.investmentController.onRefreshFIF,
                    child: Obx(() => InjectionHelper.investmentController
                                        .fifApplicationLoading.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .isLoadingPending.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .isLoadingConfirm.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .isLoadingInvestment.value ==
                                    false &&
                                InjectionHelper.investmentController
                                        .getHiddentContractLoading.value ==
                                    false
                            ?

                            ///when all fetch function done it work here
                            showData()
                            : showShimmer()

                        ///data
                        ),
                  ),
                ),
              ],
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
      onRefresh: InjectionHelper.investmentController.onRefreshFIF,
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
                      expandedHeight:
                          widget.ismmaInvestFIF == false ? 108.0 : 138,
                      stretch: true,
                      onStretchTrigger: () async {
                        debugPrint('stretch');
                      },
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: const <StretchMode>[
                          StretchMode.zoomBackground
                        ],
                        // collapseMode: CollapseMode.parallax,
                        background: InjectionHelper
                                        .investmentController
                                        .investmentModel
                                        .value
                                        .totalInvestment ==
                                    "0.00" ||
                                InjectionHelper
                                        .investmentController
                                        .investmentModel
                                        .value
                                        .totalInvestment ==
                                    null ||
                                InjectionHelper
                                        .investmentController
                                        .investmentModel
                                        .value
                                        .totalInvestment ==
                                    '0'
                            ? TotalInvestmentCard(
                                amount: InjectionHelper
                                            .investmentController
                                            .investmentModel
                                            .value
                                            .totalInvestment !=
                                        null
                                    ? InjectionHelper.investmentController
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
                                chartData: InjectionHelper
                                    .investmentController.fifChartList,
                                amount: InjectionHelper.investmentController
                                    .investmentModel.value.totalInvestment,
                              ),
                      ),
                    ),
                  ];
                },
                body: (InjectionHelper
                            .investmentController.fifAppPendingList.isEmpty &&
                        InjectionHelper
                            .investmentController.fifApplicationList.isEmpty &&
                        InjectionHelper
                            .investmentController.fifAppConfirmList.isEmpty &&
                        InjectionHelper
                            .investmentController.hiddenContractList.isEmpty)
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
                                      buttonShow: InjectionHelper
                                          .investmentController
                                          .totalInvestmentButton
                                          .value,
                                      fifhiddenList: InjectionHelper
                                          .investmentController
                                          .hiddenContractList,
                                      fifAccountList: InjectionHelper
                                          .investmentController
                                          .fifApplicationList,
                                      fifConfirmList: InjectionHelper
                                          .investmentController
                                          .fifAppConfirmList,
                                      fifPendingList: InjectionHelper
                                          .investmentController
                                          .fifAppPendingList,
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
                      '/investment/about-fif?title=About FIF&url=${InjectionHelper.investmentController.investmentModel.value.aboutFif}');
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                isDisable: false,
                isOutline: false,
                title:
                    InjectionHelper.investmentController.fifAppConfirmList
                                .isNotEmpty ||
                            InjectionHelper.investmentController
                                .fifAppPendingList.isNotEmpty ||
                            InjectionHelper.investmentController
                                .fifApplicationList.isNotEmpty
                        ? 'Invest More'
                        : 'Invest Now',
                onPressed: () async {
                  FirebaseAnalyticsHelper.sendAnalyticsEvent('invest more fif');
                  InjectionHelper.investmentController.onClearFIF();
                  InjectionHelper.investmentController.isNewBank.value = true;
                  InjectionHelper
                      .investmentController.textReceivingAccount.value = "";
                  InjectionHelper.investmentController.clearDeducSelection();
                  context.push('/investment/invest-more');
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
