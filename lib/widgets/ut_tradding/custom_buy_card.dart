import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/ut_tradding/notification_detail_popup.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_show_pop_up.dart';
import 'package:flutter/material.dart';

import 'trading_card.dart';

import 'package:get/get.dart';

class CustomBuyCard extends StatefulWidget {
  const CustomBuyCard({Key? key, this.title, this.listData}) : super(key: key);
  final String? title;

  final List<InquiryModel>? listData;

  @override
  State<CustomBuyCard> createState() => _CustomBuyCardState();
}

class _CustomBuyCardState extends State<CustomBuyCard> {
  final priceController = Get.put(PriceController());
  final inquiryController = Get.put(InquiryController());
  num transactionFee = 0;
  num totalPayment = 0;
  num fee = 0;
  num atLessFeeamount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.listData!.isEmpty ? 0 : 10.0,
          bottom: 10,
          left: 1.0,
          right: 1.0),
      child: Column(
        children: widget.listData!
            .asMap()
            .entries
            .map((e) => GestureDetector(
                  onTap: e.value.type != 'Unmatched'
                      ? () async {
                          await onShowCustomCupertinoModalSheet(
                            context: context,
                            icon: const Icon(Icons.close),
                            // title: e.value.operation == 'buy'
                            //     ? 'Successful Buy Request'
                            //     : 'Successful Sell Request',
                            title: e.value.type == 'Submitted' &&
                                    e.value.operation!.toLowerCase() == 'buy'
                                ? 'Submitted Buy Request'
                                : e.value.type == 'Submitted' &&
                                        e.value.operation!.toLowerCase() ==
                                            'sell'
                                    ? 'Submitted Sell Request'
                                    : e.value.type == 'Matched' &&
                                            e.value.operation!.toLowerCase() ==
                                                'buy'
                                        ? "Successful Buy Request"
                                        : e.value.type == 'Matched' &&
                                                e.value.operation!
                                                        .toLowerCase() ==
                                                    'sell'
                                            ? "Successful Buy Request"
                                            : "",
                            child: NotificationDetailPopup(
                              inquriyModel: e.value,
                            ),
                          );
                        }
                      : () async {
                          await showPopUpBuyRequest(
                              context: context,
                              utPrice: e.value.price!.toDouble(),
                              utValume: e.value.numberOfShare!.toInt(),
                              description: e.value.description,
                              operation: e.value.operation);
                        },
                  child: InquiryCard(
                    status: widget.title,
                    inquiryModel: widget.listData![e.key],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
