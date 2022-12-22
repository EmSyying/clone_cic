import 'dart:io';

import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/bonus/screens/all_transaction.dart';
import 'package:cicgreenloan/modules/bonus/screens/expense_transaction.dart';
import 'package:cicgreenloan/modules/bonus/screens/income_transaction.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/bonus/screens/cash_out/cash_out_screen.dart';
import 'package:cicgreenloan/modules/bonus/screens/subscriptions/subscribe_screen.dart';
import 'package:cicgreenloan/widgets/bonus/option_bonus.dart';

import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/underdevelopment_bottom_sheet.dart';
import '../../../utils/helper/firebase_analytics.dart';

class BonusScreen extends StatefulWidget {
  final String? tapName;
  const BonusScreen({Key? key, this.tapName}) : super(key: key);

  @override
  State<BonusScreen> createState() => _BonusScreenState();
}

class _BonusScreenState extends State<BonusScreen>
    with SingleTickerProviderStateMixin {
  final bonusCon = Get.put(BonusController());
  final priceController = Get.put(PriceController());
  int currentIndexColor = 0;
  bool? isSelectColor = false;
  String datetime = DateTime.now().toString();
  @override
  void initState() {
    bonusCon.tabController = TabController(vsync: this, length: 3);
    bonusCon.fectchBalance();
    priceController.onFetchPrice();
    bonusCon.fetchUTScription();
    bonusCon.fetchbonusSetting();
    // bonusCon.fetchTransationHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: CupertinoScaffold(
        body: Builder(builder: (context) {
          if (widget.tapName != null) {
            if (widget.tapName == 'invest-fif') {
              //
            }
            if (widget.tapName == 'subscribe') {
              debugPrint("Tab Name: ${widget.tapName}");
              if (!bonusCon.isLoadingHistory.value) {
                Future.delayed(const Duration(seconds: 1), () async {
                  await onShowCustomCupertinoModalSheet(
                      isLeading: true,
                      context: context,
                      child: const SubscribeBonusScreen(),
                      title: 'UT Subscription',
                      icon: const Icon(Icons.close));
                });
              }
            }
            if (widget.tapName == 'cash-out') {
              Future.delayed(const Duration(seconds: 1), () async {
                await onShowCustomCupertinoModalSheet(
                  context: context,
                  child: const CashOutScreen(),
                  title: 'Cash Out',
                  icon: const Icon(Icons.close),
                  isLeading: true,
                );
              });
            }
          }

          return CupertinoPageScaffold(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Theme.of(context).primaryColor,
              appBar: CustomAppBar(
                context: context,
                elevation: 0,
                title: 'Bonus',
                leading: IconButton(
                  onPressed: () {
                    // Beamer.of(context).beamBack();

                    Navigator.pop(context);
                  },
                  icon: kIsWeb
                      ? const Icon(Icons.arrow_back)
                      : Platform.isAndroid
                          ? const Icon(Icons.arrow_back)
                          : const Icon(Icons.arrow_back_ios),
                ),
              ),
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      shadowColor: Colors.transparent,
                      floating: true,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      expandedHeight: 210,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available Balance',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 12,
                                            color: Colors.white70),
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FormatToK.digitNumber(bonusCon
                                                  .balanceModel.value.balance ??
                                              0),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 30,
                                                  color: Colors.white),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'USD',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 20,
                                                  color: Colors.white70,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "As of ${FormatDate.formatDateTime(datetime)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 12,
                                            color: Colors.white70),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomOptionBonus(
                                          isOptionStyle: true,
                                          title: 'Invest FIF',
                                          imageUrl:
                                              'assets/images/svgfile/investfif.svg',
                                          onTap: () async {
                                            await onShowBottomSheet(
                                                isNoAppBar: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                child:
                                                    const CustomPopupButtonSheet(
                                                  assetImage:
                                                      'assets/images/svgfile/underDevelopment.svg',
                                                  description:
                                                      'This feature is under development at the moment',
                                                  title:
                                                      'This feature not available yet',
                                                ));
                                            // await onShowCustomCupertinoModalSheet(
                                            //     context: context,
                                            //     child: InvestFIFScreen(),
                                            //     title: 'InvestFIF',
                                            //     icon: Icon(Icons.close));
                                          },
                                        ),
                                        CustomOptionBonus(
                                          isOptionStyle: true,
                                          title: 'Subscribe',
                                          imageUrl:
                                              'assets/images/svgfile/subscribe.svg',
                                          onTap: () async {
                                            FirebaseAnalyticsHelper
                                                .sendAnalyticsEvent(
                                                    'bonus subscribe');
                                            await onShowCustomCupertinoModalSheet(
                                                isLeading: true,
                                                context: context,
                                                child:
                                                    const SubscribeBonusScreen(),
                                                title: 'UT Subscription',
                                                icon: const Icon(Icons.close));
                                          },
                                        ),
                                        CustomOptionBonus(
                                          isOptionStyle: true,
                                          title: 'Cash Out',
                                          imageUrl:
                                              'assets/images/svgfile/cashout.svg',
                                          onTap: () async {
                                            FirebaseAnalyticsHelper
                                                .sendAnalyticsEvent(
                                                    'Bonus Cast out');
                                            await onShowCustomCupertinoModalSheet(
                                              context: context,
                                              child: const CashOutScreen(),
                                              title: 'Cash Out',
                                              icon: const Icon(Icons.close),
                                              isLeading: true,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ];
                },
                body: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          'All Transactions',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor, 
                        indicatorWeight: 2.0,
                        controller: bonusCon.tabController,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Theme.of(context).primaryColor,
                        labelPadding: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        tabs: const [
                          Text(
                            'All',
                            style:
                                TextStyle(fontFamily: 'DMSans', fontSize: 14),
                          ),
                          Text(
                            'Income',
                            style:
                                TextStyle(fontFamily: 'DMSans', fontSize: 14),
                          ),
                          Text(
                            'Expense',
                            style:
                                TextStyle(fontFamily: 'DMSans', fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                            controller: bonusCon.tabController,
                            children: const [
                              AllTransaction(),
                              IncomeTransaction(),
                              ExpenseTransaction(),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
