import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/bonus/screens/subscriptions/custom_new_subscription.dart';
import 'package:cicgreenloan/modules/bonus/screens/subscriptions/custom_subscribe_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';

class SubscribeBonusScreen extends StatefulWidget {
  const SubscribeBonusScreen({Key? key}) : super(key: key);

  @override
  State<SubscribeBonusScreen> createState() => _SubscribeBonusScreenState();
}

class _SubscribeBonusScreenState extends State<SubscribeBonusScreen>
    with SingleTickerProviderStateMixin {
  final subscribeCon = Get.put(BonusController());

  @override
  void initState() {
    subscribeCon.tabControllerSubscribe = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: TabBar(
            onTap: (v) {
              FocusScope.of(context).unfocus();
            },
            labelPadding: const EdgeInsets.only(top: 20, bottom: 20),
            indicatorColor: AppColor.mainColor,
            labelColor: AppColor.mainColor,
            unselectedLabelColor: Colors.grey,
            controller: subscribeCon.tabControllerSubscribe,
            indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
            tabs: const [
              Text(
                'New Subscription',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Subscription History',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
              controller: subscribeCon.tabControllerSubscribe,
              children: [
                const CustomNewSubscription(),
                CustomSubscribeHistory(),
              ]),
        )
      ],
    );
  }
}
