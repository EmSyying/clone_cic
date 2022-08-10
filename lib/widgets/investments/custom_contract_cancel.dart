import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/investment_module/controller/investment_controller.dart';
import '../get_funding/custom_shimmer_contact_history.dart';
import 'custom_contract_transaction.dart';

class CustomContractCancel extends StatelessWidget {
  const CustomContractCancel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fifController = Get.put(PriceController());
    fifController.fectContractHistory(contractType: 'canceled');
    return Obx(
      () => fifController.isLoadingContractHistory.value
          ? const SizedBox(height: 200, child: ShimmerContactHistory())
          : fifController.contractHistoryList.isNotEmpty
              ? SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: fifController.contractHistoryList
                        .asMap()
                        .entries
                        .map((e) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: CustomContractTransaction(
                          color: Colors.black,
                          title: e.value.accountName ?? '...',
                          contractCode: e.value.code,
                          amount: e.value.investmentAmount,
                        ),
                      );
                    }).toList(),
                  ),
                )
              : const CustomEmptyState(
                  title: 'No Contract',
                  description: 'It seems you have no contract yet',
                ),
    );
  }
}
