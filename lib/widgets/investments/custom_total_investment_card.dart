import 'package:cicgreenloan/Utils/function/convert_fromhex_color.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../modules/investment_module/model/first_date/first_date.dart';
import 'custom_card.dart';

class TotalInvestmentCard extends StatelessWidget {
  final List<FIFApplicationListModel>? chartData;
  final GestureTapCallback? buttonChange;
  final bool? buttonValue;
  final String? title;
  final String? amount;
  final bool showButton;

  const TotalInvestmentCard(
      {Key? key,
      required this.chartData,
      this.buttonChange,
      this.title,
      this.amount,
      this.buttonValue,
      this.showButton = true})
      : super(key: key);

  getresponsive() {}

  @override
  Widget build(BuildContext context) {
    String size = MediaQuery.of(context).size.width > 380 ? "55" : "45";
    debugPrint(MediaQuery.of(context).size.width.toString());
    bool isBigScreen = MediaQuery.of(context).size.width > 380;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          CustomCard(
            colors: [
              const Color(0xffe1e6ed).withOpacity(0.9),
              const Color(0xffadc2dd).withOpacity(0.9),
            ],
            child: Container(
              // color: Colors.red[50],
              padding: const EdgeInsets.only(
                left: 20,
                top: 22,
                bottom: 22,
                right: 10,
              ),
              // right: MediaQuery.of(context).size.width > 380 ? 36 : 25),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///right content
                      SizedBox(
                        width: isBigScreen ? 100 : 90.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: isBigScreen ? 20.0 : 18, bottom: 10),
                              child: Text(
                                "Total Investment in USD",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      letterSpacing: 0.05,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          AppColor.darkColor.withOpacity(0.7),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: isBigScreen ? 34 : 10,
                              ),
                              child: const SizedBox(
                                width: double.infinity,
                                child: Divider(
                                    color: Color(0XFF848F92), height: 0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: isBigScreen ? 20.0 : 18, top: 10.0),
                              child: Text(
                                "$amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColor.darkColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    // color: Colors.red[50],w
                    height: isBigScreen ? 105.0 : 90,
                    width: isBigScreen ? 105.0 : 90,
                    child: SfCircularChart(
                      margin: EdgeInsets.zero,
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: SvgPicture.asset(
                              'assets/images/saving_chart.svg'),
                        )
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<FIFApplicationListModel, String>(
                          animationDuration: 600,
                          radius: size,
                          innerRadius: "76%",
                          dataSource: chartData,
                          pointColorMapper: (FIFApplicationListModel data, _) =>
                              fromHex(data.color ?? ""),
                          xValueMapper: (FIFApplicationListModel data, _) =>
                              data.accountName ?? "",
                          yValueMapper: (FIFApplicationListModel data, _) =>
                              formatNum(data),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          showButton
              ? Positioned(
                  top: isBigScreen ? 20 : 10,
                  right: isBigScreen ? 40 : 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Material(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: InkWell(
                        onTap: () {
                          buttonChange != null ? buttonChange!() : null;
                        },
                        child: Ink(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: buttonValue!
                                ? SvgPicture.asset(
                                    'assets/images/visible_on.svg',
                                  )
                                : SvgPicture.asset(
                                    'assets/images/visible_off.svg',
                                  ),
                          ),
                        ),
                      ),
                    ),
                  )
                  // CustomSliderButton(
                  //   value: buttonValue,
                  //   onchange: buttonChange!,
                  //   width: 50,
                  //   heigh: 25,
                  //   thumbPadding: 5,
                  //   thumbColor: Colors.white,
                  //   widget: SvgPicture.asset('assets/images/visible_off.svg'),
                  //   radius: 28,
                  // ),
                  )
              : Container(),
        ],
      ),
    );
    // Stack(
    //   children: [

    //     showButton
    //         ? Positioned(
    //             top: 15,
    //             right: 40,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(25),
    //               child: Material(
    //                 color: Theme.of(context).primaryColor.withOpacity(0.1),
    //                 child: InkWell(
    //                   onTap: () {
    //                     buttonChange != null ? buttonChange!() : null;
    //                   },
    //                   child: Ink(
    //                     height: 30,
    //                     width: 30,
    //                     decoration: BoxDecoration(
    //                       color:
    //                           Theme.of(context).primaryColor.withOpacity(0.1),
    //                       borderRadius: BorderRadius.circular(25),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(5),
    //                       child: buttonValue!
    //                           ? SvgPicture.asset(
    //                               'assets/images/visible_on.svg',
    //                             )
    //                           : SvgPicture.asset(
    //                               'assets/images/visible_off.svg',
    //                             ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             )
    //             // CustomSliderButton(
    //             //   value: buttonValue,
    //             //   onchange: buttonChange!,
    //             //   width: 50,
    //             //   heigh: 25,
    //             //   thumbPadding: 5,
    //             //   thumbColor: Colors.white,
    //             //   widget: SvgPicture.asset('assets/images/visible_off.svg'),
    //             //   radius: 28,
    //             // ),
    //             )
    //         : Container(),
    //   ],
    // );
  }

  formatNum(data) {
    try {
      return int.parse(
        data.investmentAmount!.contains('.') && data.investmentAmount != null
            ? data.investmentAmount!
                .replaceRange(data.investmentAmount!.indexOf("."),
                    data.investmentAmount!.length, "")
                .replaceAll(",", "")
                .replaceAll("\$", "")
            : data.investmentAmount!.replaceAll(",", "").replaceAll("\$", ""),
      );
    } catch (e) {
      return 0;
    }
  }
}
