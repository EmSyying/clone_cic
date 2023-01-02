import 'package:cicgreenloan/Utils/helper/injection_helper/injection_helper.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/bonus/screens/cash_out/custom_history_cash_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../Utils/helper/custom_appbar.dart';
import 'custom_new_cash_out.dart';

class CashOutScreen extends StatefulWidget {
  final String? tabName;

  const CashOutScreen({Key? key, this.tabName}) : super(key: key);

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen>
    with SingleTickerProviderStateMixin {
  final cashOutCon = Get.put(BonusController());
  @override
  void initState() {
    cashOutCon.tabControllerCashOut = TabController(
      length: 2,
      vsync: this,
      // initialIndex: cashOutCon.tapcurrentIndex.value,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final router = GoRouter.of(context);
      if (router.location.contains('new-cash-oute')) {
        cashOutCon.tabControllerCashOut.index = 0;
      } else {
        cashOutCon.tabControllerCashOut.index = 1;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    InjectionHelper.bonusController.onClear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLeading: true,
        context: context,
        title: "Cash Out",
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              // onTap: (v) {
              //   FocusScope.of(context).unfocus();
              // },
              controller: cashOutCon.tabControllerCashOut,
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              labelPadding: const EdgeInsets.only(top: 20, bottom: 15),
              indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
              tabs: const [
                Text('New Cash Out'),
                Text('History'),
              ],
            ),
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
