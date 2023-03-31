import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/privilege_program/controller/privilege_controller.dart';
import '../../../modules/privilege_program/model/gift_mvp_model/template_gift_mvp_model.dart';
import '../../../modules/privilege_program/screen/choose_gift_template.dart';
import '../../../modules/privilege_program/screen/privilege_gift_mvp/transaction_history_template.dart';
import 'custom_emptystate_transaction.dart';
import 'custom_header_transaction.dart';

containPopTransactionHistory(ScrollController scrollController,
    BuildContext context, MapEntry<int, TemplateGiftMVPModel> e) {
  final priCon = Get.put(PrivilegeController());
  debugPrint("priCon.listColors[e.key % 6]${priCon.listColors[e.key % 6]}");

  return Obx(
    () => priCon.isLoadingTransactionTemplate.value
        ? loadingTransactionTemplate(
            context,
            ChosenMVPModel(
              id: e.value.id,
              receiverName: e.value.name,
              receiverWallet: e.value.walletNumber,
            ))
        : priCon.listTransactionHistoryTemplate.isEmpty
            ? emtyStateTransactionTemplate(
                context,
                ChosenMVPModel(
                  id: e.value.id,
                  receiverName: e.value.name,
                  receiverWallet: e.value.walletNumber,
                ))
            : ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                child: Stack(
                  children: [
                    Container(
                        color: Colors.white,
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey[400],
                            height: 1,
                          ),
                          itemCount:
                              priCon.listTransactionHistoryTemplate.length,
                          itemBuilder: (_, index) => TransactionHistoryTemplate(
                            id: priCon.listTransactionHistoryTemplate[index].id,
                            title: priCon.listTransactionHistoryTemplate[index]
                                .walletName,
                            image: priCon
                                .listTransactionHistoryTemplate[index].image,
                            dated: priCon.listTransactionHistoryTemplate[index]
                                .paymentDate,
                            amount: priCon
                                .listTransactionHistoryTemplate[index].amount,
                            defaultImage: priCon
                                .listTransactionHistoryTemplate[index]
                                .defaultImage,
                            backgroundColor: priCon.listColors[e.key % 6],
                          ),
                        )),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300]),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //Header Card Gift Template
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: headerCardGiftTemplate(
                              context,
                              titleGiftTemplate: e.value.name,
                              acountNumGiftTemplate: e.value.walletNumber,
                              id: e.value.id,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Transaction History',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff848F92)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
  );
}
