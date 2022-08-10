import 'package:cicgreenloan/Utils/function/convert_fromhex_color.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/investment_module/model/contract_history/contract_history.dart';
import 'package:cicgreenloan/modules/investment_module/model/principal_history/principal_history.dart';
import 'package:cicgreenloan/widgets/investments/custom_contract_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_circle_line.dart';

class CustomPayment extends StatefulWidget {
  final int? index;
  final bool contractStyle;
  final num? id;
  final List<PrincipalHistory>? principalHistory;
  final List<ContractHistory>? contractHistory;
  final Color? colorCard;

  const CustomPayment(
      {Key? key,
      this.colorCard,
      this.index,
      this.principalHistory,
      this.contractHistory,
      this.contractStyle = false,
      this.id})
      : super(key: key);

  @override
  State<CustomPayment> createState() => _CustomPaymentState();
}

class _CustomPaymentState extends State<CustomPayment> {
  final fifController = Get.put(PriceController());

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      fifController.fetchPrincipalHistory(widget.id);
    }

    return Obx(() => Column(
          children: [
            CircleLine(
              contractStyle: widget.contractStyle,
              heightContainer: Get.height / 10,
              direction: Axis.vertical,
              size: 7.5,
              path: const {'color': Color(0xffDADADA), 'width': 2.0},
              steps:
                  fifController.principalHistoryList.asMap().entries.map((e) {
                // int indexe = fifController.principalHistoryList.indexOf(e);
                return {
                  'color': Colors.red,
                  'background': fromHex(e.value.colorCode!),
                  // widget.contractStyle
                  //     ? e.value.type == 'initial' || e.value.type == 'current'
                  //         ? fromHex(e.value.colorCode!)
                  //         : fromHex(e.value.colorCode!)
                  // : widget.index == 0
                  //     ? indexe == 0
                  //         ? const Color(0xff0685CF)
                  //         : const Color(0xff6D7174)
                  //     : widget.index == 1
                  //         ? const Color(0xffED1E26)
                  //         : const Color(0xff6D7174),
                  'label': '1',
                  'content': Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: () {
                      return widget.contractStyle
                          ? CustomContractTransaction(
                              title: e.value.label,
                              date: e.value.date,
                              amount: e.value.investmentAmount ?? '0',
                              type: e.value.type,
                              color: fromHex(e.value.colorCode!),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Total amount',
                                        style: TextStyle(
                                            color: Color(0xff6D7174),
                                            fontSize: 16),
                                      ),
                                      Text(
                                        e.value.date!,
                                        style: TextStyle(
                                            color: widget.index == 2
                                                ? const Color(0xff6D7174)
                                                : const Color(0xff0A0B09),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Container(),
                                  Text('\$${e.value.investmentAmount}',
                                      style: TextStyle(
                                          color: widget.index == 0
                                              ? const Color(0xff0685CF)
                                              : widget.index == 1
                                                  ? const Color(0xffED1E26)
                                                  : const Color(0xff6D7174),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            );
                    }(),
                  ),
                };
              }).toList(),
            ),
          ],
        ));
  }
}
