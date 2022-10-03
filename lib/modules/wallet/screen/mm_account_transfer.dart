import 'package:cicgreenloan/modules/bonus/screens/cash_out/cash_out_screen.dart';
import 'package:flutter/material.dart';

import '../../../Utils/helper/custom_appbar.dart';

class MmAccountTransfer extends StatelessWidget {
  const MmAccountTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLeading: true,
        context: context,
        title: "MM Account Transfer",
      ),
      body: const CashOutScreen(),
    );
  }
}
