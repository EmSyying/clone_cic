import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';

class MarketCloseScreen extends StatefulWidget {
  const MarketCloseScreen({Key? key}) : super(key: key);

  @override
  State<MarketCloseScreen> createState() => _MarketCloseScreenState();
}

class _MarketCloseScreenState extends State<MarketCloseScreen> {
  final inquiryController = Get.put(InquiryController());
  @override
  void initState() {
    // inquiryController.getTradingSetting();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          isLeading: true,
          context: context,
          elevation: 1.0,
          title: 'Create Share Request'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/empty state.svg',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Market is closed',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consece',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
