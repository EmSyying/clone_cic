import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';

import 'package:cicgreenloan/widgets/bonus/investFIF/optionInvest/option_invest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';

class InvestFIFScreen extends StatefulWidget {
  const InvestFIFScreen({Key? key}) : super(key: key);

  @override
  State<InvestFIFScreen> createState() => _InvestFIFScreenState();
}

class _InvestFIFScreenState extends State<InvestFIFScreen>
    with SingleTickerProviderStateMixin {
  final investCon = Get.put(BonusController());
  @override
  void initState() {
    investCon.tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TabBar(
            controller: investCon.tabController,
            labelColor: AppColor.mainColor,
            unselectedLabelColor: Colors.black87,
            indicatorColor: AppColor.mainColor,
            labelPadding: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            tabs: const [
              Text(
                'Invest',
                style: TextStyle(fontFamily: 'DMSans', fontSize: 14),
              ),
              Text(
                'WithDraw',
                style: TextStyle(fontFamily: 'DMSans', fontSize: 14),
              ),
              Text(
                'History',
                style: TextStyle(fontFamily: 'DMSans', fontSize: 14),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: investCon.tabController,
            children: const [OptionInvest(), Text('hello2'), Text('hello3')],
          ))
        ],
      ),
    );
  }
}
