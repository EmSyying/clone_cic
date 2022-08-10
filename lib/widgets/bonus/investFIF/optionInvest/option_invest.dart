import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/investFIF/custom_invest_balance_card.dart';

import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';

class OptionInvest extends StatelessWidget {
  const OptionInvest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final investDuraionCon = Get.put(BonusController());

    return Obx(
      () => Container(
        color: Colors.grey[100],
        margin: const EdgeInsets.only(bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomInvestBalanceCard(
                titleBalance: 'Available Balance',
                currency: 1200000,
                leftTitle: 'Annualized Interest Rate',
                leftSubTitle: '14.4%',
                rightTitle: 'Min Invested Amount',
                rightSubTitle: '3,000 USD',
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text('Invested Duration'),
                    ),
                    SingleChildScrollView(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: investDuraionCon.durationList
                              .asMap()
                              .entries
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      investDuraionCon.selected.value = e.key;
                                    },
                                    child: CustomChips(
                                      margin: const EdgeInsets.only(right: 20),
                                      title: e.value.title,
                                      currentIndex: e.key,
                                      selectIndex:
                                          investDuraionCon.selected.value,
                                    ),
                                  ))
                              .toList()),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text('Invested Amount'),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(FormatToK.digitNumber(1000)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'USD',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Interest Summary',
                            style: Theme.of(context).textTheme.headline2),
                        TextButton(
                          onPressed: () {},
                          child: SvgPicture.asset(
                              'assets/images/svgfile/questicon.svg'),
                        ),
                      ],
                    ),
                    // Column(
                    //   children: interestSummaryList
                    //       .asMap()
                    //       .entries
                    //       .map((e) => GestureDetector(
                    //             onTap: () {
                    //               investDuraionCon.selectIndex.value = e.key;
                    //             },
                    //             child: CustomInterestSummary(
                    //               selectedIndex:
                    //                   investDuraionCon.selectIndex.value,
                    //               currenctIndex: e.key,
                    //               date: e.value.date,
                    //               time: e.value.time,
                    //               titleDate: e.value.titleDate,
                    //             ),
                    //           ))
                    //       .toList(),
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(thickness: 1.2),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Interest Amount',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            '1,440 USD',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: AppColor.statusColor['late']),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        investDuraionCon.isSubmit.value =
                            !investDuraionCon.isSubmit.value;
                      },
                      child: Row(
                        children: [
                          investDuraionCon.isSubmit.value == false
                              ? SvgPicture.asset(
                                  'assets/images/svgfile/cicle_check.svg',
                                  color: Colors.grey,
                                )
                              : SvgPicture.asset(
                                  'assets/images/svgfile/circle_check-selected.svg'),
                          const SizedBox(width: 20),
                          Text(
                            'I have read  and agree to CiC serivce agreement',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
                height: 0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 30),
                child: CustomButton(
                  onPressed: () {},
                  isDisable: investDuraionCon.isSubmit.value ? false : true,
                  isOutline: false,
                  title: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
