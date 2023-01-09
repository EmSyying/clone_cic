import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:cicgreenloan/modules/bonus/screens/subscriptions/custom_new_subscription.dart';
import 'package:cicgreenloan/modules/bonus/screens/subscriptions/custom_subscribe_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/injection_helper/injection_helper.dart';

class SubscribeBonusScreen extends StatefulWidget {
  final String? tabName;
  final String? fromPage;
  const SubscribeBonusScreen({Key? key, this.tabName, this.fromPage})
      : super(key: key);

  @override
  State<SubscribeBonusScreen> createState() => _SubscribeBonusScreenState();
}

class _SubscribeBonusScreenState extends State<SubscribeBonusScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    InjectionHelper.bonusController.fetchUTScription();

    InjectionHelper.bonusController.fetchPaymentSummary();
    InjectionHelper.bonusController.fetchbonusSetting();
    debugPrint(
        " From Page:${InjectionHelper.investmentController.isFromWallet.value}::${widget.fromPage}");
    if (widget.fromPage != null) {
      debugPrint("is working from wallet ABC");
      InjectionHelper.walletController.fetchWalletAmount();
    }
    InjectionHelper.bonusController.tabControllerSubscribe = TabController(
      length: 2,
      vsync: this,
      initialIndex: InjectionHelper.bonusController.tapcurrentIndex.value,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final router = GoRouter.of(context);
      if (router.location.contains('new-subscription')) {
        InjectionHelper.bonusController.tabControllerSubscribe.index = 0;
      } else {
        InjectionHelper.bonusController.tabControllerSubscribe.index = 1;
      }
    });
    InjectionHelper.investmentController.isFromWallet.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          elevation: 0,
          isLeading: true,
          context: context,
          title: "UT Subscription",
          isCallonPressed: widget.fromPage == 'investment' ? true : false,
          onPressed: () {
            debugPrint('is pressed to invesment ABC');
            InjectionHelper.investmentController.onFetchPrice();
            context.go('/investment/cic-equity-fund');
            // Navigator.pop(context);
          }),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Obx(
              () => TabBar(
                onTap: (v) {
                  FocusScope.of(context).unfocus();
                },
                labelPadding: const EdgeInsets.only(top: 20, bottom: 20),
                indicatorColor:
                    InjectionHelper.walletController.fetchWalletLoading.value
                        ? Colors.transparent
                        : Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
                controller:
                    InjectionHelper.bonusController.tabControllerSubscribe,
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
          ),
          Expanded(
            child: TabBarView(
              controller:
                  InjectionHelper.bonusController.tabControllerSubscribe,
              children: [
                CustomNewSubscription(fromPage: widget.fromPage),
                CustomSubscribeHistory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
