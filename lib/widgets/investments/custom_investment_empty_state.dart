import 'package:cicgreenloan/widgets/investments/custom_card.dart';
import 'package:flutter/material.dart';

class CustomInvestmentEmptyState extends StatelessWidget {
  final String? title;
  final String? description;
  final String? titleLine;
  const CustomInvestmentEmptyState(
      {Key? key, this.title, this.description, this.titleLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          child: SizedBox(
            width: 335,
            height: 259,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/investment_empthystate.png',
                width: 100,
                height: 99.15,
              ),
              const SizedBox(
                height: 26.0,
              ),
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 4.0,
              ),
              SizedBox(
                width: 273,
                child: Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: const Color(0xff848F92),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            titleLine ?? '',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        // const SizedBox(
        //   height: 10.0,
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: CircleLine(
        //     heightContainer: Get.height / 10,
        //     direction: Axis.vertical,
        //     size: 6,
        //     path: const {
        //       'color': Color(0xffD1E5FF),
        //       'width': 1.0,
        //     },
        //     steps: emptyStateInvestmentList.map((e) {
        //       return {
        //         'label': '1',
        //         'background': AppColor.mainColor,
        //         'content': Container(
        //           padding: const EdgeInsets.only(top: 20.0),
        //           child: () {
        //             return customLine(context, e.title);
        //           }(),
        //         ),
        //       };
        //     }).toList(),
        //   ),
        // ),
      ],
    );
  }
}

// List<InvestmentEmptyStateModel> emptyStateInvestmentList = [
//   InvestmentEmptyStateModel(title: 'Average Annual Return 14.4% to 18%'),
//   InvestmentEmptyStateModel(title: 'Minimum Period 2 months'),
//   InvestmentEmptyStateModel(title: 'Monthly Interest'),
//   InvestmentEmptyStateModel(title: 'Minimum Amount 10,000.00 USD'),
// ];
// Widget customLine(BuildContext context, String? title) {
//   return Text(
//     title ?? '',
//     style: const TextStyle(
//       color: Color(0xff464646),
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       height: 1,
//     ),
//   );
// }
