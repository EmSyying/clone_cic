import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/bonus/screens/cash_out/cash_in_histories.dart';
import 'package:cicgreenloan/modules/bonus/screens/cash_out/cash_in_ount.dart';
import 'package:cicgreenloan/modules/bonus/screens/cash_out/cash_out_histories.dart';
import 'package:cicgreenloan/widgets/bonus/investFIF/custom_invest_balance_card.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHistoryCashOut extends StatelessWidget {
  CustomHistoryCashOut({Key? key}) : super(key: key);
  final historyCashOutCon = Get.put(BonusController());
  final userCon = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();

    List<Widget> pageView = [
      CashInOutTransaction(),
      CashInHistories(),
      CashoutHistories()
    ];

    List<CustomChips> pageName = [
      const CustomChips(title: 'All'),
      const CustomChips(title: 'Cash In'),
      const CustomChips(title: 'Cash Out'),
    ];

    return Obx(
      () => (SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              CustomInvestBalanceCard(
                isContainStack: true,
                titleBalance: 'Available Balance',
                currency: historyCashOutCon.balanceModel.value.balance,
                leftTitle: 'Investor ID',
                leftSubTitle: userCon.customer.value.code,
                rightTitle: 'Investor Name',
                rightSubTitle: userCon.customer.value.fullName,
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Text(
                        'Transaction',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: pageName.asMap().entries.map((e) {
                          return GestureDetector(
                            onTap: () {
                              historyCashOutCon.selectIndex.value = e.key;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: CustomChips(
                                title: e.value.title,
                                selectIndex:
                                    historyCashOutCon.selectIndex.value,
                                currentIndex: e.key,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        padding: const EdgeInsets.only(bottom: 20),
                        child: pageView
                            .elementAt(historyCashOutCon.selectIndex.value)),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
