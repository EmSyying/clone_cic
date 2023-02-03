import 'dart:ui';

import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';

import 'package:cicgreenloan/modules/investment_module/model/return_investment.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';

import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../Utils/helper/box_decoration.dart';

class ReturnOnInvestment extends StatefulWidget {
  final List<InvestData>? yearsList;
  const ReturnOnInvestment({Key? key, this.yearsList}) : super(key: key);

  @override
  State<ReturnOnInvestment> createState() => _ReturnOnInvestmentState();
}

class _ReturnOnInvestmentState extends State<ReturnOnInvestment> {
  int? selectedIndex = 0;

  final _con = Get.put(SettingController());

  @override
  void initState() {
    _con.onFetchUIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: boxExpansion,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              // decoration: boxExpansion,
              decoration: boxExpansion,
              child: Theme(
                data: Theme.of(context).copyWith(
                  // cardColor: Theme.of(context).cardColor
                  cardColor: Colors.grey.shade50.withOpacity(1),
                ),
                child: Container(
                  color: Colors.grey.shade50.withOpacity(1),
                  // height: 255.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 18.89),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/svgfile/shareInfo.svg",
                                color: Theme.of(context).primaryColor),
                            const SizedBox(width: 20.0),
                            Text(
                              "Return On Investment",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Spacer(),
                            Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GetBuilder<SettingController>(
                                  init: SettingController(),
                                  builder: (controller) {
                                    return InkWell(
                                      onTap: () {
                                        onShowBottomSheet(
                                            icondata: Icons.close,
                                            isLoading: controller.isloading,
                                            title: controller.uiSettingData
                                                .returnOnInvestment!.label,
                                            context: context,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  child: HtmlWidget(
                                                    "${controller.uiSettingData.returnOnInvestment!.description}",
                                                    textStyle: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ));
                                      },
                                      child: SvgPicture.asset(
                                          'assets/images/svgfile/questicon.svg'),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children:
                                widget.yearsList!.asMap().entries.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = e.key;
                                });
                              },
                              child: CustomChips(
                                isInvest: true,
                                title: e.value.year.toString(),
                                currentIndex: e.key,
                                selectIndex: selectedIndex,
                              ),
                            ),
                          );
                        }).toList()),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 25.0, top: 15.0),
                        child: Text(
                          "Total Gain",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'DMSans',
                              color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 25.0),
                        child: Text(
                          widget.yearsList![selectedIndex!].info!.total!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'DMSans',
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, right: 25.0, top: 10.0),
                                  child: Text(
                                    "Capital Gain",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'DMSans',
                                        color: Colors.black54),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 25.0),
                                  child: Text(
                                    widget.yearsList![selectedIndex!].info!
                                        .capitalGain!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'DMSans',
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              "assets/images/svgfile/investdivider.svg"),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, right: 25.0, top: 10.50),
                                  child: Text(
                                    "Dividend",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'DMSans',
                                        color: Colors.black54),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 25.0),
                                  child: Text(
                                    widget.yearsList![selectedIndex!].info!
                                        .dividend!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'DMSans',
                                        color: widget.yearsList![selectedIndex!]
                                                    .info!.dividend ==
                                                "Coming soon"
                                            ? Colors.orange
                                            : Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18.89)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
