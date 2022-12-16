import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/bonus/subscribe/custom_subscription_card.dart';
import 'package:cicgreenloan/widgets/bonus/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bonus/custom_shimmer_card_bonus.dart';

class CustomSubscribeHistory extends StatelessWidget {
  CustomSubscribeHistory({Key? key}) : super(key: key);
  final subscribeCon = Get.put(BonusController());
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    subscribeCon.fetchUTScription();
    subscribeCon.fetchTransationHistory(type: "subscription");
    subscribeCon.fetchBankMember(cicBank: "cic");

    return Obx(
      () => Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            color: Colors.grey[100],
            child: Column(
              children: [
                const CustomSubscriptionCard(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Transaction',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      subscribeCon.isLoadingHistory.value
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.50,
                              width: double.infinity,
                              child: const ShimmerCardBonus())
                          : subscribeCon.subscriptionList.isEmpty
                              ? const CustomEmptyState()
                              : CustomTransactionCard(
                                  isPendingtransaction: true,
                                  hisStoryList: subscribeCon.subscriptionList,
                                  color: Colors.grey,
                                  isStatus: true,
                                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
