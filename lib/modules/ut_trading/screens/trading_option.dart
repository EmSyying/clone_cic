import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_botton_selected.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_select_member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/firebase_analytics.dart';

class Trading extends StatefulWidget {
  const Trading({Key? key}) : super(key: key);

  @override
  State<Trading> createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  final memberController = Get.put(MemberController());
  final inquiryController = Get.put(InquiryController());
  final cusController = Get.put(CustomerController());

  bool? isValidateMember;

  @override
  void initState() {
    // inquiryController.getTradingSetting();
    inquiryController.tradingSettingData.data!.market!.open!
        ? inquiryController.selectTrade.value = 1
        : inquiryController.selectTrade.value = 2;

    super.initState();
  }

  ///clear searchfield in trading
  @override
  void dispose() {
    memberController.textFieldSearch('');
    memberController.searchTextFieldController.value.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trading = ModalRoute.of(context)!.settings.arguments as InquiryModel;

    return DefaultSizeWeb(
      child: CupertinoScaffold(
        body: Builder(
          builder: (context) => CupertinoPageScaffold(
            child: Scaffold(
              appBar: CustomAppBar(
                  isLogo: false,
                  isLeading: true,
                  context: context,
                  elevation: 1.0,
                  title: 'Trading Option'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: Text(
                            'Please Choose Trade Option',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomButtonSelected(
                            isDasable: !inquiryController
                                .tradingSettingData.data!.market!.open!,
                            isOutline: true,
                            iconUrl:
                                'assets/images/svgfile/menu/tradeCICplatform.svg',
                            isSelect: inquiryController.selectTrade.value == 1,
                            onPressed: () {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  "Trade with CiC Platform");
                              setState(() {
                                inquiryController.selectTrade.value = 1;
                                // inquiryController.specificMember.value = Member();
                                memberController.selectedMember.value =
                                    Member();
                                isValidateMember = true;
                              });
                            },
                            title: 'Trade with CiC Platform ',
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomButtonSelected(
                            isOutline: true,
                            iconUrl:
                                'assets/images/svgfile/specificplatform.svg',
                            isSelect: inquiryController.selectTrade.value == 2,
                            onPressed: () {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  "Trade with specific member(s)");
                              setState(() {
                                inquiryController.selectTrade.value = 2;
                              });
                            },
                            title: 'Trade with specific member(s)',
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        if (inquiryController.selectTrade.value == 2)
                          CustomSelectMember(
                            label: 'Select Member',
                            isValidate: isValidateMember,
                            onTap: (Member value) {
                              // FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              //     "Select Member");
                              if (value.id != null) {
                                memberController.selectedMember.value = value;
                                inquiryController.specificMember.value = value;

                                setState(() {
                                  isValidateMember = true;
                                });
                              }
                            },
                          ),
                        const SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SvgPicture.asset(
                        "assets/images/svgfile/menu/tradeMemberPic.svg"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      inquiryController.selectTrade.value == 2
                          ? 'Trade with specific member(s)'
                          : 'Trade with CiC platform',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        inquiryController.selectTrade.value == 2
                            ? 'You agree to buy or sell your shares with one CiC Member. After both parties submit the requests, the transaction will take place.'
                            : 'Once the market is closed, your request will be matched automatically based on the agreed Single Price Auction method. ',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                height: 100,
                width: double.infinity,
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(
                    isOutline: false,
                    isDisable: inquiryController.selectTrade.value == 1 &&
                                inquiryController
                                    .tradingSettingData.data!.market!.open! &&
                                inquiryController.tradingSettingData.data!
                                        .allowBuyRequest! !=
                                    false &&
                                trading.operation == 'buy' ||
                            inquiryController.selectTrade.value == 1 &&
                                inquiryController
                                    .tradingSettingData.data!.market!.open! &&
                                inquiryController.tradingSettingData.data!
                                        .allowSellRequest! !=
                                    false &&
                                trading.operation == 'sell'
                        ? false
                        : inquiryController.selectTrade.value == 2
                            ? false
                            : true,
                    onPressed: inquiryController.selectTrade.value == 1 &&
                                inquiryController
                                    .tradingSettingData.data!.market!.open! &&
                                inquiryController.tradingSettingData.data!
                                        .allowBuyRequest! !=
                                    false &&
                                trading.operation == 'buy' ||
                            inquiryController.selectTrade.value == 1 &&
                                inquiryController
                                    .tradingSettingData.data!.market!.open! &&
                                inquiryController.tradingSettingData.data!
                                        .allowSellRequest! !=
                                    false &&
                                trading.operation == 'sell'
                        ? () => Navigator.pushNamed(
                              context,
                              RouteName.ADDINQUIRY,
                              arguments:
                                  InquiryModel(operation: trading.operation),
                            )
                        : inquiryController.selectTrade.value == 2
                            ? () {
                                if (memberController.selectedMember.value.id !=
                                    null) {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.ADDINQUIRY,
                                    arguments: InquiryModel(
                                        operation: trading.operation),
                                  );
                                } else {
                                  setState(() {
                                    isValidateMember = false;
                                  });
                                }
                              }
                            : null,
                    title: "Next",
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
