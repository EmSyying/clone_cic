import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/subscribe/custom_deduct_bonus.dart';
import 'package:cicgreenloan/widgets/bonus/subscribe/custom_make_payment_card.dart';
import 'package:cicgreenloan/widgets/bonus/subscribe/custom_subscription_detail.dart';
import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';
import '../../configs/route_configuration/route.dart';
import '../../modules/bonus/models/history_model.dart';
import '../../utils/helper/firebase_analytics.dart';

class CustomTransactionCard extends StatelessWidget {
  final List<HistoryData>? hisStoryList;
  final Color? color;
  final bool? isStatus;
  final String? title;
  final bool? isTitle;
  final String? subscriptionStatus;
  final String? paymentStatus;
  final String? investID;
  final String? investName;
  final num? subscriptionUT;
  final num? subscriptiontCost;
  final num? remainingPayment;
  final bool? isPendingtransaction;

  final String? investFIF;
  CustomTransactionCard({
    Key? key,
    this.isStatus,
    this.isTitle = false,
    this.title,
    this.hisStoryList,
    this.investFIF = 'invest-fif',
    this.color,
    this.subscriptionStatus,
    this.paymentStatus,
    this.investID,
    this.investName,
    this.subscriptionUT,
    this.subscriptiontCost,
    this.remainingPayment,
    this.isPendingtransaction = false,
  }) : super(key: key);
  final subscribeCon = Get.put(BonusController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isTitle == true
                ? Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        title != null ? "$title" : "",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  )
                : Container(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: hisStoryList!.asMap().entries.map((data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10),
                        child: Text(
                          data.value.date!,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 11),
                        ),
                      ),
                      Column(
                        children:
                            data.value.histories!.asMap().entries.map((e) {
                          List<Widget> pageList = [
                            SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              //subscription detail(partially paid)
                              child: CustomSubscriptionDetail(
                                onTab: () {
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'View transaction detail');
                                  subscribeCon.pageController.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeInOut);
                                  subscribeCon.currentIndexPage.value = 1;
                                },
                                subscriptionStatus:
                                    e.value.view!.subscriptionStatus ?? '',
                                investID: e.value.view!.investorId ?? '',
                                investName: e.value.view!.investorName ?? '',
                                pricePerUT: e.value.view!.pricePerUt,
                                totalSubscription:
                                    e.value.view!.totalSubscriptionCost,
                                utSubscribe: e.value.view!.utToSubscribe,
                                paymentStatus:
                                    e.value.view!.paymentStatus!.toUpperCase(),
                                unPaidAmount: e.value.view!.unpaidAmount,
                                datePayment:
                                    e.value.view!.lastDateOfPayment ?? '',
                                subscriptionUT: e.value.view!.utToSubscribe,
                                subscriptiontCost:
                                    e.value.view!.totalSubscriptionCost,
                                remainingPayment: e.value.view!.unpaidAmount,
                                amountToPay: e.value.view!.payable,
                              ),
                            ),
                            SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, bottom: 10),
                                    child: Text(
                                      'Please choose payment option',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  CustomMakePaymentCard(
                                    isDisable: subscribeCon
                                                .balanceModel.value.balance !=
                                            0.0
                                        ? false
                                        : true,
                                    title: 'Deduct from CiC bonus',
                                    imageUrl:
                                        'assets/images/svgfile/deduct.svg',
                                    onTab: subscribeCon
                                                .balanceModel.value.balance !=
                                            0.0
                                        ? () {
                                            FirebaseAnalyticsHelper
                                                .sendAnalyticsEvent(
                                                    'submit deduct from cic bonus');
                                            subscribeCon.isConfirm.value =
                                                false;
                                            subscribeCon.pageController
                                                .animateToPage(2,
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    curve: Curves.easeInOut);
                                            subscribeCon
                                                .currentIndexPage.value = 2;
                                          }
                                        : null,
                                  ),
                                  CustomMakePaymentCard(
                                    title: 'Transfer to CiC’s bank account',
                                    imageUrl:
                                        'assets/images/svgfile/payment.svg',
                                    onTab: () {
                                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                          'submit Transfer to CiC bank account');
                                      subscribeCon.pageController.animateToPage(
                                          3,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeInOut);
                                      subscribeCon.currentIndexPage.value = 3;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: CustomDeductBonus(
                                subscriptionStatus:
                                    e.value.view!.subscriptionStatus,
                                paymentStatus: e.value.view!.paymentStatus,
                                subscriptionUT: e.value.view!.utToSubscribe,
                                subscriptionCost:
                                    e.value.view!.totalSubscriptionCost,
                                // accPayment: accumulatedPayment,
                                remainingPayment: e.value.view!.unpaidAmount,
                              ),
                            ),
                            SingleChildScrollView(
                              child: CustomDeductBonus(
                                istransfertoCiCBank: true,
                                subscriptionStatus:
                                    e.value.view!.subscriptionStatus,
                                paymentStatus: e.value.view!.paymentStatus,
                                subscriptionUT: e.value.view!.utToSubscribe,
                                subscriptionCost:
                                    e.value.view!.totalSubscriptionCost,
                                // accPayment: accumulatedPayment,
                                remainingPayment: e.value.view!.unpaidAmount,
                              ),
                            ),
                          ];
                          return GestureDetector(
                            onTap: () {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  'View transaction detail');
                              if (e.value.type != 'payment' &&
                                  e.value.type != 'cash-out' &&
                                  e.value.type != 'bonus' &&
                                  e.value.type != "cash-in") {
                                if (e.value.referalId != null) {
                                  subscribeCon.referalID.value =
                                      e.value.referalId!.toInt();
                                }
                                if (e.value.view!.payable != 0) {
                                  subscribeCon.payable.value = double.parse(
                                      e.value.view!.payable.toString());
                                }
                                //subscription partially paid
                                onShowBottomSheet(
                                  // isDismissible: false,

                                  context: context,

                                  icondata: Icons.close,
                                  type: e.value.type,
                                  label: 'Subscription',
                                  time: e.value.time,
                                  amountFormat: 'ID: ${e.value.transactionId}',
                                  isAmountFormat: true,
                                  text: Obx(
                                    () => Text(subscribeCon
                                                .currentIndexPage.value ==
                                            1
                                        ? 'Make payment'
                                        : e.value.referalId != null
                                            ? 'Subscription ID: ${e.value.referalId}'
                                            : 'Subscription'),
                                  ),
                                  // icondata: Icons.close,
                                  icon: Obx(
                                    () => subscribeCon.currentIndexPage.value ==
                                            1
                                        ? IconButton(
                                            onPressed: () {
                                              subscribeCon.pageController
                                                  .previousPage(
                                                      duration: const Duration(
                                                          microseconds: 300),
                                                      curve: Curves.easeInOut);
                                              subscribeCon
                                                  .currentIndexPage.value = 0;
                                            },
                                            icon: const Icon(
                                                Icons.arrow_back_ios),
                                          )
                                        : subscribeCon.currentIndexPage.value ==
                                                2
                                            ? IconButton(
                                                onPressed: () {
                                                  subscribeCon.pageController
                                                      .previousPage(
                                                          duration:
                                                              const Duration(
                                                                  microseconds:
                                                                      300),
                                                          curve:
                                                              Curves.easeInOut);
                                                  subscribeCon.currentIndexPage
                                                      .value = 1;
                                                },
                                                icon: const Icon(
                                                    Icons.arrow_back_ios),
                                              )
                                            : subscribeCon.currentIndexPage
                                                        .value ==
                                                    3
                                                ? IconButton(
                                                    onPressed: () {
                                                      subscribeCon
                                                          .pageController
                                                          .animateToPage(1,
                                                              duration:
                                                                  const Duration(
                                                                      microseconds:
                                                                          300),
                                                              curve: Curves
                                                                  .easeInOut);
                                                      subscribeCon
                                                          .currentIndexPage
                                                          .value = 1;
                                                    },
                                                    icon: const Icon(
                                                        Icons.arrow_back_ios),
                                                  )
                                                : IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);

                                                      Navigator.pop(router
                                                          .navigator!.context);
                                                    },
                                                    icon:
                                                        const Icon(Icons.close),
                                                  ),
                                  ),
                                  child: Obx(
                                    () => SizedBox(
                                      height:
                                          subscribeCon.currentIndexPage.value ==
                                                  1
                                              ? 270
                                              : subscribeCon.currentIndexPage
                                                          .value ==
                                                      2
                                                  ? 500
                                                  : subscribeCon
                                                              .currentIndexPage
                                                              .value ==
                                                          3
                                                      ? 600
                                                      : 400,
                                      child: PageView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          controller:
                                              subscribeCon.pageController,
                                          itemCount: pageList.length,
                                          itemBuilder: (context, index) {
                                            return pageList[index];
                                          }),
                                    ),
                                  ),
                                );
                              } else {
                                //bonus detail
                                if (e.value.type == "bonus") {
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'View transaction bonus detail');
                                  onShowBottomSheet(
                                    context: context,
                                    title: e.value.view!.transactionId != null
                                        ? 'Transaction ID: ${e.value.view!.transactionId}'
                                        : 'Transaction',
                                    icondata: Icons.close,
                                    type: e.value.type,
                                    label: e.value.label,
                                    time: e.value.time,
                                    amount: e.value.amount,
                                    child: CustomSubscriptionDetail(
                                      isbonus: true,
                                      paymentStatus: e
                                          .value.view!.paymentStatus!
                                          .toUpperCase(),
                                      paymentType: e.value.view!.paymentType,
                                      amount: e.value.view!.amount,
                                      pricePerUT: e.value.view!.pricePerUt,
                                      transactionDate:
                                          e.value.view!.transactionDate,
                                      utAmount: e.value.view!.utAmount,
                                    ),
                                  );
                                  //cash out detail
                                } else if (e.value.type == "cash-out") {
                                  debugPrint(" is cash out");
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'View transaction cast out detail');
                                  onShowBottomSheet(
                                    context: context,
                                    title: e.value.view!.transactionId != null
                                        ? 'Transaction ID: ${e.value.view!.transactionId}'
                                        : 'Transaction',
                                    icondata: Icons.close,
                                    type: e.value.type,
                                    label: e.value.label,
                                    time: e.value.time,
                                    amount: e.value.amount,
                                    child: CustomSubscriptionDetail(
                                      isCashout: true,
                                      type: e.value.type,
                                      bankName: e.value.view!.bankName,
                                      paymentStatus: e
                                          .value.view!.paymentStatus!
                                          .toUpperCase(),
                                      paymentType: e.value.view!.paymentType,
                                      amount: e.value.view!.amount,
                                      from: e.value.view!.from,
                                      transactionDate:
                                          e.value.view!.transactionDate,
                                      toAccount: e.value.view!.toAccount,
                                    ),
                                  );
                                  //cast in detail
                                } else if (e.value.type == "cash-in") {
                                  debugPrint("is cash in");
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'View transaction cast in detail');
                                  onShowBottomSheet(
                                    context: context,
                                    title: e.value.view!.transactionId != null
                                        ? 'Transaction ID: ${e.value.view!.transactionId}'
                                        : 'Transaction',
                                    icondata: Icons.close,
                                    type: e.value.type,
                                    label: e.value.label,
                                    time: e.value.time,
                                    amount: e.value.amount,
                                    child: CustomSubscriptionDetail(
                                      isCashin: true,
                                      type: e.value.type,
                                      paymentStatus:
                                          e.value.view!.paymentStatus,
                                      paymentType: e.value.view!.paymentType,
                                      amount: e.value.view!.amount,
                                      bankName: e.value.view!.bankName,
                                      transactionDate:
                                          e.value.view!.transactionDate,
                                    ),
                                  );
                                } else {
                                  // status payment detail
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'View transaction detail');
                                  onShowBottomSheet(
                                    context: context,
                                    title: e.value.view!.transactionId != null
                                        ? 'Transaction ID: ${e.value.view!.transactionId}'
                                        : 'Transaction',
                                    icondata: Icons.close,
                                    type: e.value.type,
                                    label: e.value.label,
                                    time: e.value.time,
                                    amount: e.value.amount,
                                    child: CustomSubscriptionDetail(
                                      isPayment: true,
                                      paymentStatus: e
                                          .value.view!.paymentStatus!
                                          .toUpperCase(),
                                      paymentType: e.value.view!.paymentType,
                                      amount: e.value.view!.amount,
                                      subscriptionID:
                                          e.value.view!.subscriptionId,
                                      transactionDate:
                                          e.value.view!.transactionDate,
                                      from: e.value.view!.from,
                                    ),
                                  );
                                }
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(30),
                                      blurRadius: 6,
                                      offset: const Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: e.value.type == 'bonus' ||
                                                e.value.type == 'cash-in'
                                            ? AppColor.statusColor['green']!
                                                .withOpacity(0.2)
                                            : AppColor.statusColor['late']!
                                                .withOpacity(0.2)),
                                    child: Center(
                                        child: e.value.type == 'bonus' ||
                                                e.value.type == 'cash-in'
                                            ? SvgPicture.asset(
                                                'assets/images/svgfile/dividend.svg',
                                              )
                                            : e.value.type == 'cash-out'
                                                ? SvgPicture.asset(
                                                    'assets/images/svgfile/cashout1.svg',
                                                  )
                                                : e.value.type == 'inves-fif'
                                                    ? SvgPicture.asset(
                                                        'assets/images/svgfile/investfif.svg',
                                                        color: AppColor
                                                                .statusColor[
                                                            'late'],
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/images/svgfile/subscribe_card.svg')),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${e.value.label}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                          ),
                                          Text(
                                            '${e.value.time}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        isStatus == true
                                            ? Text(
                                                e.value.type == "cash-in"
                                                    ? ""
                                                    : e.value.status != ''
                                                        ? e.value.status!
                                                            .capitalize!
                                                        : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        color: e.value.type ==
                                                                        'subscription' &&
                                                                    e.value.status ==
                                                                        'partially paid' ||
                                                                e.value.status ==
                                                                    'pending'
                                                            ? AppColor.statusColor[
                                                                'pending']
                                                            : e.value.type ==
                                                                        'subscription' &&
                                                                    e.value.status ==
                                                                        'waiting list'
                                                                ? AppColor
                                                                    .mainColor
                                                                : e.value.type == 'subscription' && e.value.status == 'paid' ||
                                                                        e.value.type ==
                                                                            'cash-in' ||
                                                                        e.value.type == 'cash-out' &&
                                                                            e.value.status == 'paid' ||
                                                                        e.value.status == 'confirmed'
                                                                    ? AppColor.statusColor['green']
                                                                    : AppColor.statusColor['late']),
                                              )
                                            : Container(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                              ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            isPendingtransaction == false
                                                ? e.value.type == 'bonus' ||
                                                        e.value.status ==
                                                            'unpaid' ||
                                                        e.value.type ==
                                                            "cash-in"
                                                    ? 'USD ${FormatToK.digitNumber(e.value.amount ?? 0)}'
                                                    : '- USD ${FormatToK.digitNumber(e.value.amount ?? 0)}'
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    color: e.value.type ==
                                                                'bonus' ||
                                                            e.value.type ==
                                                                'cash-in'
                                                        ? AppColor.statusColor[
                                                            'green']
                                                        : color ??
                                                            AppColor.statusColor[
                                                                'late'],
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  );
                }).toList()),
          ],
        ),
      ),
    );
  }
}
