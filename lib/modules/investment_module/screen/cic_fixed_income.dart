import 'dart:io';

import 'package:cicgreenloan/Utils/helper/injection_helper/injection_helper.dart';
import 'package:cicgreenloan/modules/investment_module/screen/history_appbar.dart';
import 'package:cicgreenloan/modules/investment_module/screen/investment_empty_state_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/form_builder/custom_button.dart';

import '../../../Utils/form_builder/custom_material_modal_sheet.dart';
import '../../../Utils/helper/cic/cic_guider.dart';
import '../../../utils/helper/custom_appbar.dart';
import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/get_funding/custom_shimmer_contact_history.dart';
import '../../../widgets/investments/custom_fif_saving_card_list.dart';
import '../../../widgets/investments/custom_fif_total_investment_shimmer.dart';
import '../../../widgets/investments/custom_shimmer_fif_saving_card.dart';
import '../../../widgets/investments/custom_total_investment_card.dart';
import '../../guilder/guider_controller.dart';
import '../controller/investment_controller.dart';

class CiCFixedIncome extends StatefulWidget {
  final bool ismmaInvestFIF;
  const CiCFixedIncome({Key? key, this.ismmaInvestFIF = false})
      : super(key: key);

  @override
  State<CiCFixedIncome> createState() => _CiCFixedIncomeState();
}

class _CiCFixedIncomeState extends State<CiCFixedIncome> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final contro = Get.put(CiCGuidController());
  final _guidkey = Get.put(CiCGuidController());
  final priceController = Get.put(PriceController());

  void _cicFixedIncomeGuide() {
    CiCApp.showOverlays(
      context: context,
      key: (_) => _guidkey.investmentFiF[_].key!,
      objectSettingBuilder: (_) => ObjectSetting(
          edgeInsets: _ == 0 ? const EdgeInsets.only(top: 15) : null,
          radius: _ == 0 ? BorderRadius.circular(12) : null,
          paddingSize: _ == 0 ? const Size(-39, -29) : null),
      titleBuilder: (_) => _guidkey.investmentFiF[_].title ?? '',
      descriptionBuilder: (_) => _guidkey.investmentFiF[_].description ?? '',
      itemCount: _guidkey.investmentFiF.length,
      allowSkip: true,
      overlaySetting: OverlaySetting(),
    );
  }

  @override
  void initState() {
    InjectionHelper.investmentController.onRefreshFIF();
    InjectionHelper.equityInvestmentController.fetchCallCenter(type: "FIF");
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
        : DefaultSizeWeb(
            child: CupertinoScaffold(
              body: Builder(
                builder: (context) => CupertinoPageScaffold(
                  child: Scaffold(
                    appBar: CustomAppBar(
                      elevation: 0,
                      isLeading: true,
                      isLogo: false,
                      context: context,
                      title: "CiC Fixed Income Fund",
                      action: [
                        //  isContract == true

                        GestureDetector(
                          onTap: () async {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              _cicFixedIncomeGuide();
                            });
                            // await LocalData.storeAppTou('appTour', true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(
                              'assets/images/demo.svg',
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            debugPrint("Workk===>");
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'contract history');
                            await onShowCustomCupertinoModalSheet(
                              context: context,
                              icon: const Icon(Icons.close_rounded),
                              title: "Contract History",
                              onTap: () {},
                              child:
                                  priceController.isLoadingContractHistory.value
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: ShimmerContactHistory(),
                                        )
                                      : const FIFHistoryAppbar(),
                            );
                          },
                          child: SvgPicture.asset("assets/images/history.svg"),
                        ),

                        const SizedBox(width: 23)
                      ],
                    ),
                    body: Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/Investment_backg.svg',
                              fit: BoxFit.fill,
                              color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: RefreshIndicator(
                            key: refreshKey,
                            onRefresh: InjectionHelper
                                .investmentController.onRefreshFIF,
                            child: Obx(() => InjectionHelper
                                                .investmentController
                                                .fifApplicationLoading
                                                .value ==
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
                                        InjectionHelper
                                                .investmentController
                                                .getHiddentContractLoading
                                                .value ==
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
                  ),
                ),
              ),
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
      child: InjectionHelper.investmentController.fifAppPendingList.isEmpty &&
              InjectionHelper.investmentController.fifApplicationList.isEmpty &&
              InjectionHelper.investmentController.fifAppConfirmList.isEmpty &&
              InjectionHelper.investmentController.hiddenContractList.isEmpty
          ? const IvestmentEmptyStateScreen(
              isFixedIncom: true,
            )
          : NestedScrollView(
              controller:
                  InjectionHelper.investmentController.cicFixedIncomeScroll,
              physics: const AlwaysScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    expandedHeight: widget.ismmaInvestFIF ? 142.0 : 96.0,
                    // && InjectionHelper
                    //                     .investmentController
                    //                     .investmentModel
                    //                     .value
                    //                     .totalInvestment ==
                    //                 "0.00" ||
                    //         InjectionHelper.investmentController.investmentModel
                    //                 .value.totalInvestment ==
                    //             null ||
                    //         InjectionHelper.investmentController.investmentModel
                    //                 .value.totalInvestment ==
                    //             '0'
                    //     ? 322
                    //     : widget.ismmaInvestFIF &&
                    //                 InjectionHelper
                    //                         .investmentController
                    //                         .investmentModel
                    //                         .value
                    //                         .totalInvestment !=
                    //                     "0.00" ||
                    //             InjectionHelper
                    //                     .investmentController
                    //                     .investmentModel
                    //                     .value
                    //                     .totalInvestment !=
                    //                 null ||
                    //             InjectionHelper
                    //                     .investmentController
                    //                     .investmentModel
                    //                     .value
                    //                     .totalInvestment !=
                    //                 '0'
                    //         ? 142
                    //         : 96,

                    stretch: true,
                    onStretchTrigger: () async {
                      debugPrint('stretch');
                    },
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const <StretchMode>[
                        StretchMode.zoomBackground
                      ],
                      // collapseMode: CollapseMode.parallax,
                      background: TotalInvestmentCard(
                        key: contro.investmentFiF[0].key = GlobalKey(),
                        chartData:
                            InjectionHelper.investmentController.fifChartList,
                        amount: InjectionHelper.investmentController
                            .investmentModel.value.totalInvestment,
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: Container(
                                height: 5.13,
                                width: 34,
                                decoration: BoxDecoration(
                                    color: const Color(0xffBFBFBF),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Expanded(
                              child: CustomSavingCardList(
                                buttonShow: InjectionHelper.investmentController
                                    .totalInvestmentButton.value,
                                fifhiddenList: InjectionHelper
                                    .investmentController.hiddenContractList,
                                fifAccountList: InjectionHelper
                                    .investmentController.fifApplicationList,
                                fifConfirmList: InjectionHelper
                                    .investmentController.fifAppConfirmList,
                                fifPendingList: InjectionHelper
                                    .investmentController.fifAppPendingList,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    top: false,
                    minimum: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: widget.ismmaInvestFIF
                        ? buttonInvestFiF()
                        : showAllButton(),
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

  // Widget showEmptyState() {
  //   return Column(
  //     children: [
  //       const Expanded(
  //         child: IvestmentEmptyStateScreen(),
  //       ),
  //       const SizedBox(height: 20.0),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
  //         child: showAllButton(),
  //       ),
  //     ],
  //   );
  // }

  showAllButton() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isDisable: false,
            isOutline: true,
            title: 'About FIF',
            onPressed: () {
              //   FirebaseAnalyticsHelper.sendAnalyticsEvent('about fif');
              context.push(
                  '/investment/fixed-income-fund/about-fif?title=About FIF&url=${InjectionHelper.investmentController.investmentModel.value.aboutFif}');
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            key: contro.investmentFiF[1].key = GlobalKey(),
            isDisable: false,
            isOutline: false,
            title: InjectionHelper
                        .investmentController.fifAppConfirmList.isNotEmpty ||
                    InjectionHelper
                        .investmentController.fifAppPendingList.isNotEmpty ||
                    InjectionHelper
                        .investmentController.fifApplicationList.isNotEmpty
                ? 'Invest More'
                : 'Invest Now',
            onPressed: () async {
              FirebaseAnalyticsHelper.sendAnalyticsEvent('invest more fif');
              InjectionHelper.investmentController.onClearFIF();
              InjectionHelper.investmentController.isNewBank.value = true;
              InjectionHelper.investmentController.textReceivingAccount.value =
                  "";
              InjectionHelper.investmentController.clearDeducSelection();
              context.push('/investment/fixed-income-fund/invest-more');
              // context.router.push(FIFDeucSelectionRouter());
            },
          ),
        ),
      ],
    );
  }

  buttonInvestFiF() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isDisable: false,
            isOutline: true,
            title: 'About FIF',
            onPressed: () {
              FirebaseAnalyticsHelper.sendAnalyticsEvent('about fif');
              context.push(
                  '/investment/fixed-income-fund/about-fif?title=About FIF&url=${InjectionHelper.investmentController.investmentModel.value.aboutFif}');
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            key: contro.investmentFiF[1].key = GlobalKey(),
            isDisable: false,
            isOutline: false,
            title: InjectionHelper
                        .investmentController.fifAppConfirmList.isNotEmpty ||
                    InjectionHelper
                        .investmentController.fifAppPendingList.isNotEmpty ||
                    InjectionHelper
                        .investmentController.fifApplicationList.isNotEmpty
                ? 'Invest More'
                : 'Invest Now',
            onPressed: () async {
              FirebaseAnalyticsHelper.sendAnalyticsEvent('invest more fif');
              InjectionHelper.investmentController.onClearFIF();
              InjectionHelper.investmentController.isNewBank.value = true;
              InjectionHelper.investmentController.textReceivingAccount.value =
                  "";
              InjectionHelper.investmentController.clearDeducSelection();
              context.push('/investment/fixed-income-fund/invest-more');
              // context.router.push(FIFDeucSelectionRouter());
            },
          ),
        ),
      ],
    );
  }
}
