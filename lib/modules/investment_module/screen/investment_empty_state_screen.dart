import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/firebase_analytics.dart';
import '../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../utils/helper/color.dart';
import '../../../widgets/get_funding/custom_circle_line.dart';
import '../../../widgets/investments/custom_investment_empty_state.dart';
import '../../guilder/guider_controller.dart';
import '../model/investment_emptystate_model.dart';

class IvestmentEmptyStateScreen extends StatelessWidget {
  final bool isFixedIncom;
  const IvestmentEmptyStateScreen({super.key, this.isFixedIncom = false});

  @override
  Widget build(BuildContext context) {
    final contro = Get.put(CiCGuidController());
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomInvestmentEmptyState(
                  title: 'No Investment yet!',
                  description:
                      'You have no investment in CiC Fixed Income Fund (FIF).',
                  titleLine: 'CiC fixed income fund',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CircleLine(
                    // heightContainer: Get.height / 10,
                    direction: Axis.vertical,
                    size: 6,
                    path: const {
                      'color': Color(0xffD1E5FF),
                      'width': 1.0,
                    },
                    steps: emptyStateInvestmentList.map((e) {
                      return {
                        'label': '1',
                        'background': AppColor.mainColor,
                        'content': Container(
                          // height: 0,
                          margin: const EdgeInsets.only(top: 27.0),
                          child: () {
                            return customTitleLine(context, e.title);
                          }(),
                        ),
                      };
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        isFixedIncom == true
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          isDisable: false,
                          isOutline: true,
                          title: 'About FiF',
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
                          title: InjectionHelper.investmentController
                                      .fifAppConfirmList.isNotEmpty ||
                                  InjectionHelper.investmentController
                                      .fifAppPendingList.isNotEmpty ||
                                  InjectionHelper.investmentController
                                      .fifApplicationList.isNotEmpty
                              ? 'Invest More'
                              : 'Invest Now',
                          onPressed: () async {
                            FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                'invest more fif');
                            InjectionHelper.investmentController.onClearFIF();
                            InjectionHelper
                                .investmentController.isNewBank.value = true;
                            InjectionHelper.investmentController
                                .textReceivingAccount.value = "";
                            InjectionHelper.investmentController
                                .clearDeducSelection();
                            context.push(
                                '/investment/fixed-income-fund/invest-more');
                            // context.router.push(FIFDeucSelectionRouter());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        const SizedBox(height: 20.0)
      ],
    );
  }
}

List<InvestmentEmptyStateModel> emptyStateInvestmentList = [
  InvestmentEmptyStateModel(title: 'Average Annual Return 14.4% to 18%'),
  InvestmentEmptyStateModel(title: 'Minimum Period 2 months'),
  InvestmentEmptyStateModel(title: 'Monthly Interest'),
  InvestmentEmptyStateModel(title: 'Minimum Amount 10,000.00 USD'),
];
Widget customTitleLine(BuildContext context, String? title) {
  return Text(
    title ?? '',
    style: const TextStyle(
      color: Color(0xff464646),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1,
    ),
  );
}
