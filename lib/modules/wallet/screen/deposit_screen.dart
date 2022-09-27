import 'package:flutter/material.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/bonus/investFIF/custom_invest_balance_card.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: const [
          CustomInvestBalanceCard(
            titleBalance: 'Available Balance',
            currency: 100000,
            leftTitle: 'Investor ID',
            leftSubTitle: 'Virak 2002',
            rightTitle: 'Investor Name',
            rightSubTitle: 'The Best',
          ),
        ],
      ),
    );
  }
}
