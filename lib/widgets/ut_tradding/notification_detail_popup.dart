// ignore_for_file: must_be_immutable

import 'package:cicgreenloan/Utils/chart/share_price_break_down_ut.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/ut_tradding/customer_trading_transferby.dart';
import 'package:cicgreenloan/widgets/ut_tradding/pay_off_slip_pop_up.dart';
import 'package:cicgreenloan/widgets/ut_tradding/share_requrested_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../Utils/helper/format_number.dart';

class NotificationDetailPopup extends StatefulWidget {
  InquiryModel? inquriyModel;
  final int? transitionId;
  final int? marketId;
  final String? operation;
  NotificationDetailPopup(
      {Key? key,
      this.inquriyModel,
      this.transitionId,
      this.marketId,
      this.operation})
      : super(key: key);

  @override
  State<NotificationDetailPopup> createState() =>
      _NotificationDetailPopupState();
}

class _NotificationDetailPopupState extends State<NotificationDetailPopup> {
  final inquiryController = Get.put(InquiryController());
  final notificationController = Get.put(
    NotificationController(),
  );
  @override
  void initState() {
    if (widget.inquriyModel == null) {
      fetchData();
    }
    super.initState();
  }

  fetchData() async {
    notificationController.isFetchingDetail(true);
    await notificationController.fetchNotificationDetail(
        transitionId: widget.transitionId,
        marketId: widget.marketId,
        operation: widget.operation);
    setState(() {
      widget.inquriyModel = notificationController.inquiryModel.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Obx(
            () => notificationController.isFetchingDetail.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(children: [
                            if (widget.inquriyModel!.type == "Matched")
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 20.0),
                                        child: widget.inquriyModel!.payment!
                                            ? const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                            : SvgPicture.asset(
                                                "assets/images/circle_outline_done.svg",
                                              ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        widget.inquriyModel!.payment!
                                            ? 'Payment: Done'
                                            : 'Payment: Not yet process',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: widget.inquriyModel!.payment!
                                              ? Colors.green
                                              : Colors.red,
                                          fontFamily: 'DMSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget.inquriyModel!.type == 'Submitted')
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Payment: ',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Text('N/A'),
                                  ],
                                ),
                              ), // =============updated===========
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20.0),
                                    child: widget.inquriyModel!.tradingWith ==
                                            'specific-platform'
                                        ? SvgPicture.asset(
                                            "assets/images/svgfile/withSpecificMember.svg",
                                          )
                                        : SvgPicture.asset(
                                            "assets/images/svgfile/withcicplatform.svg",
                                          ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      widget.inquriyModel!.tradingWith ==
                                              'specific-platform'
                                          ? 'Trade with specific member'
                                          : 'Trade with CiC platform',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ShareRequestedCard(
                                type: widget.inquriyModel!.type,
                                utPrice: widget.inquriyModel!.price,
                                shareRequestTitle: 'UT Requested',
                                shareRequestValue: widget
                                    .inquriyModel!.details!.shareRequested
                                    .toString(),
                                shareTradedTitle: 'UT Traded',
                                shareTradedValue: widget
                                    .inquriyModel!.details!.shareTraded
                                    .toString(),
                                tradingDate: FormatNumber.formDateTime(
                                    widget.inquriyModel!.details!.tradingDate!),
                                avgSharePrice: widget
                                    .inquriyModel!.details!.avgSharePrice),
                            if (widget.inquriyModel!.type == "Matched")
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.80),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 3,
                                        color: Colors.black12)
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: const Text('UT Price Breakdown'),
                                    ),
                                    // if (e.value.details!.sharePriceBreakdown!
                                    //         .length !=
                                    //     0)
                                    CiCBarChartSharePriceBreakdown(
                                      barColor: const Color(0xff0685CF),
                                      dataList: widget.inquriyModel!.details!
                                          .sharePriceBreakdown!,
                                    ),
                                  ],
                                ),
                              ),
                          ]),
                        ),
                        const SizedBox(height: 25.0),
                        if (widget.inquriyModel!.type == "Matched")
                          Container(
                            decoration: const BoxDecoration(
                                border: BorderDirectional(
                                  top: BorderSide(
                                      color: Colors.grey,
                                      width: 0.2,
                                      style: BorderStyle.solid),
                                ),
                                color: Colors.white),
                            child: Container(
                              padding: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 10.0),
                              child: CustomButton(
                                isDisable: false,
                                isOutline: false,
                                title: widget.inquriyModel!.operation == 'sell'
                                    ? 'View Transaction Detail'
                                    : widget.inquriyModel!.payment == false
                                        ? 'View Payment Info'
                                        : 'View Transaction Detail',
                                onPressed: widget.inquriyModel!.payment! ||
                                        widget.inquriyModel!.operation == 'sell'
                                    ? () async {
                                        await showCustomDialog(
                                            operation:
                                                widget.inquriyModel!.operation,
                                            atLessFeeamount: inquiryController
                                                .tradingSettingData
                                                .data!
                                                .atLessFeeamount!,
                                            feepercentage: inquiryController
                                                .tradingSettingData
                                                .data!
                                                .feeInPercentage!,
                                            context: context,
                                            status:
                                                widget.inquriyModel!.payment!,
                                            id: widget.inquriyModel!.details!
                                                .receiptNumber,
                                            transactionDetailList: widget
                                                .inquriyModel!
                                                .details!
                                                .payOffSlip!,
                                            paymentDetailList: widget
                                                .inquriyModel!.details!.bank!,
                                            transactionFeeList: widget
                                                .inquriyModel!
                                                .details!
                                                .payOffSlip!,
                                            totalPaymentList: widget
                                                .inquriyModel!
                                                .details!
                                                .payOffSlip!);
                                      }
                                    : () async {
                                        await onShowCustomCupertinoModalSheet(
                                          context: context,
                                          icon: const Icon(Icons.close),
                                          title: 'Payment Information',
                                          child: SafeArea(
                                            child: CustomTradingTransferBy(
                                              transactionDetailList: widget
                                                  .inquriyModel!
                                                  .details!
                                                  .payOffSlip!,
                                              feepercentage: inquiryController
                                                  .tradingSettingData
                                                  .data!
                                                  .feeInPercentage!,
                                              atLessFeeamount: inquiryController
                                                  .tradingSettingData
                                                  .data!
                                                  .atLessFeeamount!,
                                              id: widget.inquriyModel!.id
                                                  .toString(),
                                              paymentDetailList: widget
                                                  .inquriyModel!.details!.bank!,
                                            ),
                                          ),
                                        );
                                      },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
