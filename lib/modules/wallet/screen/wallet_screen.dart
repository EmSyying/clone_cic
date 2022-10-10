import 'package:cicgreenloan/modules/wallet/screen/mma_deposit_card.dart';
import 'package:cicgreenloan/modules/wallet/screen/mma_invest_fif_screen.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/function/format_date_time.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/underdevelopment_bottom_sheet.dart';
import '../../bonus/controllers/bonus_controller.dart';
import '../../bonus/screens/all_transaction.dart';
import '../../bonus/screens/expense_transaction.dart';
import '../../bonus/screens/income_transaction.dart';

import '../../investment_module/controller/investment_controller.dart';
import '../controller/wallet_controller.dart';

import 'dart:ui' as ui;

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final _walletController = Get.put(WalletController());
  final newCashOutCon = Get.put(BonusController());
  final priceController = Get.put(PriceController());

  final String datetime = DateTime.now().toString();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _walletController.fetchWalletAmount();
    newCashOutCon.fetchbonusSetting();
    newCashOutCon.fectchBalance();
    priceController.onFetchPrice();
    newCashOutCon.fetchUTScription();
    newCashOutCon.fetchPaymentSummary();

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

    return Stack(
      children: [
        //Background Style
        Scaffold(
          backgroundColor: AppColor.mainColor,
          extendBodyBehindAppBar: true,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: PathPainter(),
            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            isLogo: false,
            isLeading: true,
            context: context,
            title: "MM Account",
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
                  expandedHeight: 250,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        // Positioned.fill(
                        //   child: CustomPaint(
                        //     painter: PathPainter(),
                        //   ),
                        // ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Obx(
                                  () => RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      // text: FormatToK.digitNumber(),
                                      text: _walletController
                                          .walletAmount.value.balanceFormat,
                                      style: textStyle.copyWith(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "As of ${FormatDate.formatDateTime(datetime)}",
                                style: textStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                const MMADepositCard(
                                              fromModule: 'Deposit',
                                            ),
                                          ),
                                        );
                                      },
                                      text: 'Deposit',
                                      img: 'assets/images/mma_wallet.svg',
                                    ),
                                    _operationButton(
                                      context,
                                      ontap: () {
                                        // FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                        //     'MMA subscribe');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MMADepositCard(
                                              fromModule: 'Transfer',
                                            ),
                                          ),
                                        );
                                      },
                                      text: 'Transfer',
                                      img: 'assets/images/transfer.svg',
                                    ),
                                    _operationButton(
                                      context,
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MMAInvestFIFScreen(),
                                          ),
                                        );
                                        // show(context);
                                      },
                                      text: 'Invest',
                                      img:
                                          'assets/images/svgfile/investfif.svg',
                                    ),
                                    _operationButton(
                                      context,
                                      ontap: () {
                                        show(context);
                                      },
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          'All Transactions',
                          style: Theme.of(context).textTheme.headline2,
                        ),
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
        ),
      ],
    );
  }

  show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const CustomPopupButtonSheet(
        assetImage: 'assets/images/svgfile/underDevelopment.svg',
        description: 'This feature is under development at the moment',
        title: 'This feature not available yet',
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

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      // ..color = Colors.red
      ..shader = ui.Gradient.linear(
        Offset(w * 1.4, h * 0.45),
        Offset(0, h * 0.55),
        [
          const Color(0xff133B6F),
          const Color(0xff0B3C7C).withOpacity(0),
        ],
      );

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h * 0.30);

    path.quadraticBezierTo(w * 0.56, h * 0.29, w * 0.85, 0);
    path.close();
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}
