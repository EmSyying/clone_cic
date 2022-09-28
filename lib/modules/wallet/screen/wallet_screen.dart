import 'package:cicgreenloan/modules/wallet/screen/mma_deposit_card.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/function/format_to_k.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/firebase_analytics.dart';
import '../../bonus/screens/all_transaction.dart';
import '../../bonus/screens/expense_transaction.dart';
import '../../bonus/screens/income_transaction.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: CustomAppBar(
        context: context,
        elevation: 0,
        title: 'MM Account',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              floating: true,
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 250,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/mma_bg.svg',
                      // colorBlendMode: BlendMode.srcOver,

                      color: AppColor.mainColor.withOpacity(0.1),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Available Balance'.toUpperCase(),
                            style: textStyle.copyWith(
                              fontSize: 14,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: FormatToK.digitNumber(10000 * 100000),
                                  style: textStyle.copyWith(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' USD',
                                      style: textStyle.copyWith(
                                        fontSize: 22,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Text(
                            "As of 05 May 2022",
                            style: textStyle.copyWith(
                              fontSize: 12,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _operationButton(
                                  context,
                                  ontap: () {
                                    // FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                    //     'MMA Deposit');
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const DepositScreen(),
                                    //   ),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MMADepositCard(),
                                      ),
                                    );
                                  },
                                  text: 'Deposit',
                                  img: 'assets/images/mma_wallet.svg',
                                ),
                                _operationButton(
                                  context,
                                  ontap: () {
                                    FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                        'MMA subscribe');
                                  },
                                  text: 'Transfer',
                                  img: 'assets/images/transfer.svg',
                                ),
                                _operationButton(
                                  context,
                                  ontap: () {},
                                  text: 'Invest',
                                  img: 'assets/images/svgfile/investfif.svg',
                                ),
                                _operationButton(
                                  context,
                                  ontap: () {},
                                  text: 'Pay',
                                  img: 'assets/images/svgfile/cashout.svg',
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
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      'All Transactions',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/images/searchicon.svg')
                  ],
                ),
              ),
              TabBar(
                indicatorColor: Colors.blue[900], //Color(0xff0F50A4),
                indicatorWeight: 2.0,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                labelColor: AppColor.mainColor,
                labelPadding: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                tabs: const [
                  Text(
                    'All',
                    style: TextStyle(fontFamily: 'DMSans', fontSize: 14),
                  ),
                  Text(
                    'Income',
                    style: TextStyle(fontFamily: 'DMSans', fontSize: 14),
                  ),
                  Text(
                    'Expense',
                    style: TextStyle(fontFamily: 'DMSans', fontSize: 14),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: const Color(0xfffafafa),
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      AllTransaction(),
                      IncomeTransaction(),
                      ExpenseTransaction(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _operationButton(
    BuildContext context, {
    String? text,
    String? img,
    GestureTapCallback? ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(img ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              text ?? '',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
