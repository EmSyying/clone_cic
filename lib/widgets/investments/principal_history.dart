import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get_funding/custom_payment_schedule_box.dart';

class PeicipalHistory extends StatelessWidget {
  final num? id;
  const PeicipalHistory({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fifController = Get.put(PriceController());
    Future<void> onPullResfresh() async {
      fifController.fetchPrincipalHistory(id);
    }

    return RefreshIndicator(
      onRefresh: onPullResfresh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomPayment(
              contractStyle: true,
              id: id,
            ),
          ],
        ),
      ),
    );
  }
}
