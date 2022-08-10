import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/bonus/screens/cash_out/custom_history_cash_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/helper/color.dart';
import 'custom_new_cash_out.dart';

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({Key? key}) : super(key: key);

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen>
    with SingleTickerProviderStateMixin {
  final cashOutCon = Get.put(BonusController());
  @override
  void initState() {
    cashOutCon.tabControllerCashOut = TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TabBar(
            controller: cashOutCon.tabControllerCashOut,
            labelColor: AppColor.mainColor,
            indicatorColor: AppColor.mainColor,
            labelPadding: const EdgeInsets.only(top: 20, bottom: 15),
            indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
            tabs: const [
              Text('New Cash Out'),
              Text('History'),
            ],
          ),
          Expanded(
              child: TabBarView(
                  controller: cashOutCon.tabControllerCashOut,
                  children: [
                CustomNewCashOut(),
                CustomHistoryCashOut(),
              ]))
        ],
      ),
    );
  }
}
