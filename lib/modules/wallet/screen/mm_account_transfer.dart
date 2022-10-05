import 'package:cicgreenloan/modules/bonus/screens/cash_out/cash_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../bonus/controllers/bonus_controller.dart';

class MmAccountTransfer extends StatelessWidget {
  const MmAccountTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(BonusController());
    return Scaffold(
      appBar: CustomAppBar(
          elevation: 0,
          isLeading: true,
          context: context,
          title: "MM Account Transfer",
          isCallonPressed: true,
          onPressed: () async {
            Navigator.pop(context);
            debugPrint('cashout======');
            await cont.onClear();
          }),
      body: const CashOutScreen(),
    );
  }
}
