import 'package:flutter/material.dart';
import '../../../utils/helper/color.dart';
import '../../../widgets/get_funding/custom_circle_line.dart';
import '../../../widgets/investments/custom_investment_empty_state.dart';
import '../model/investment_emptystate_model.dart';

class IvestmentEmptyStateScreen extends StatelessWidget {
  const IvestmentEmptyStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomInvestmentEmptyState(
            title: 'No Investment yet!',
            description:
                'You have no investment in CiC Fixed Income Fund (FIF).',
            titleLine: 'CiC fixed income fund',
          ),
          const SizedBox(
            height: 10.0,
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
                    margin: const EdgeInsets.only(top: 25.0),
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
