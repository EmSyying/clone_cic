import 'dart:io';

import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/notify_share_pop_up.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:go_router/go_router.dart';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/firebase_analytics.dart';
import '../models/detail_model.dart';

class AddInquiry extends StatefulWidget {
  final int? id;
  final int? memberId;
  final int? marketId;
  final num? numberOfShare;
  final num? price;
  final String? operation;
  final String? type;
  final String? date;
  final String? description;
  final String? tradingWith;
  final num? targetMember;
  final String? time;
  final bool? payment;
  final Details? details;
  const AddInquiry(
      {Key? key,
      this.id,
      this.memberId,
      this.marketId,
      this.numberOfShare,
      this.price,
      this.operation,
      this.type,
      this.date,
      this.description,
      this.tradingWith,
      this.targetMember,
      this.time,
      this.payment,
      this.details})
      : super(key: key);
  @override
  State<AddInquiry> createState() => _AddInquiryState();
}

class _AddInquiryState extends State<AddInquiry> {
  final cusController = Get.put(CustomerController());
  final inquirycontroller = Get.put(InquiryController());
  String operationType = 'Buy';

  bool isAvailableShare = false;
  final _formKey = GlobalKey<FormState>();

  final numberShareKey = GlobalKey();
  final priceShareKey = GlobalKey();

  bool isValidate() {
    if (inquirycontroller.qtyShare.value == 0.0) {
      inquirycontroller.isValidateNumberShare.value = false;
      Scrollable.ensureVisible(numberShareKey.currentContext!);
      return false;
    } else if (inquirycontroller.priceShare.value == 0.0) {
      inquirycontroller.isValidatedPriceShare.value = false;

      Scrollable.ensureVisible(priceShareKey.currentContext!);
      return false;
    }
    if (inquirycontroller.qtyShare.value == 0.0) {
      inquirycontroller.isValidateNumberShare.value = false;
      return false;
    }
    if (inquirycontroller.priceShare.value == 0.0) {
      inquirycontroller.isValidatedPriceShare.value = false;
      return false;
    }

    return true;
  }

  Future<void> onRefresh() async {
    inquirycontroller.getTradingSetting();
  }

  @override
  void initState() {
    inquirycontroller.demandInfo.value =
        widget.description != null ? widget.description! : "";
    inquirycontroller.qtyShare.value =
        widget.numberOfShare != null ? widget.numberOfShare!.toDouble() : 0.0;
    inquirycontroller.priceShare.value =
        widget.price != null ? widget.price!.toDouble() : 0.0;

    inquirycontroller.getTradingSetting();
    if (widget.operation == 'sell') {
      setState(() {
        operationType = 'Sell';
      });
    } else {
      setState(() {
        operationType = 'Buy';
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
            isLeading: true,
            isLogo: false,
            context: context,
            elevation: 1.0,
            leading: GestureDetector(
              onTap: () async {
                await onRefresh();
                Future.delayed(Duration.zero).then((_) {
                  context.pop();
                });
              },
              child: Icon(kIsWeb
                  ? Icons.arrow_back
                  : Platform.isAndroid
                      ? Icons.arrow_back
                      : Icons.arrow_back_ios),
            ),
            title: widget.price == null && widget.numberOfShare == null
                ? 'Create $operationType Request'
                : 'Update ${widget.operation!.capitalize} Request'),
        body: ConnectivityWidgetWrapper(
          stacked: false,
          alignment: Alignment.bottomCenter,
          offlineWidget: const OfflineWidget(),
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Theme.of(context).cardColor,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0, top: 20.0, bottom: 10.0),
                                      child: Text(
                                        'Volume',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: Color(0XFF252552),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    CustomTextFieldNew(
                                      keyboardType: TextInputType.number,
                                      key: numberShareKey,
                                      isValidate: inquirycontroller
                                          .isValidateNumberShare.value,
                                      isRequired: true,
                                      initialValue:
                                          inquirycontroller.qtyShare.value !=
                                                  0.0
                                              ? inquirycontroller.qtyShare.value
                                                  .toString()
                                              : "",
                                      hintText: 'UT Volume',
                                      labelText: 'UT Volume',
                                      onChange: (value) {
                                        if (value == "") {
                                          inquirycontroller.qtyShare.value =
                                              0.0;
                                          inquirycontroller
                                              .isValidateNumberShare
                                              .value = false;
                                        } else {
                                          inquirycontroller.qtyShare.value =
                                              value == ''
                                                  ? 0
                                                  : onConvertToDouble(value);

                                          inquirycontroller
                                              .isValidateNumberShare
                                              .value = true;
                                        }
                                      },
                                      onSave: (value) {
                                        inquirycontroller.qtyShare.value =
                                            value == ''
                                                ? 0
                                                : onConvertToDouble(value!);
                                      },
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0, top: 20.0, bottom: 10.0),
                                      child: Text(
                                        'Price',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: Color(0XFF252552),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    CustomTextFieldNew(
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      key: priceShareKey,
                                      isValidate: inquirycontroller
                                          .isValidatedPriceShare.value,
                                      isRequired: true,
                                      initialValue: inquirycontroller
                                                  .priceShare.value !=
                                              0.0
                                          ? inquirycontroller.priceShare.value
                                              .toString()
                                          : "",
                                      hintText: 'UT Price',
                                      labelText: 'UT Price',
                                      onChange: (value) {
                                        if (value == "") {
                                          inquirycontroller
                                              .isValidatedPriceShare
                                              .value = false;
                                          inquirycontroller.priceShare.value =
                                              0.0;
                                        } else {
                                          inquirycontroller.priceShare.value =
                                              value == ''
                                                  ? 0
                                                  : onConvertToDouble(value);
                                          inquirycontroller
                                              .isValidatedPriceShare
                                              .value = true;
                                        }
                                      },
                                      onSave: (value) {
                                        inquirycontroller.priceShare.value =
                                            value == ''
                                                ? 0
                                                : onConvertToDouble(value!);
                                      },
                                    ),
                                    const SizedBox(height: 10.0)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Theme.of(context).cardColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20.0),
                                    child: Text(
                                      'Demand Information',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFieldNew(
                                    maxLine: 7,
                                    labelText: 'Type something...',
                                    hintText: 'Type something...',
                                    onChange: (value) {
                                      if (value.isEmpty) {
                                        inquirycontroller.demandInfo.value = '';
                                      } else {
                                        inquirycontroller.demandInfo.value =
                                            value;
                                      }
                                    },
                                    initialValue:
                                        inquirycontroller.demandInfo.value,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 300,
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => inquirycontroller.isSubmitting.value
                            ? Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(1.0, 0.0),
                                            color: Colors.black12,
                                            blurRadius: 6),
                                      ]),
                                  padding: const EdgeInsets.all(30),
                                  height: 100,
                                  width: 100,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Theme.of(context).cardColor,
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      isOutline: false,
                      isDisable: false,
                      onPressed: widget.price == null &&
                              widget.numberOfShare == null
                          ? () async {
                              _formKey.currentState!.save();
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  "Submit Trade $operationType Request");

                              if (isValidate()) {
                                if (widget.operation == 'sell' &&
                                    inquirycontroller.qtyShare.value >
                                        inquirycontroller.tradingSettingData
                                            .data!.availableUt!) {
                                  setState(() {
                                    showNotifyPopUp(
                                        context: context,
                                        imgUrl:
                                            'assets/images/svgfile/marketIsnotAvalable.svg',
                                        description:
                                            'Your share is not sufficient to sell !');
                                  });
                                } else if (inquirycontroller.selectTrade.value == 1 &&
                                        inquirycontroller.priceShare.value <
                                            inquirycontroller.tradingSettingData
                                                .data!.market!.minBasePrice! ||
                                    inquirycontroller.selectTrade.value == 1 &&
                                        inquirycontroller.priceShare.value >
                                            inquirycontroller.tradingSettingData
                                                .data!.market!.maxBasePrice!) {
                                  setState(() {
                                    showNotifyPopUp(
                                        context: context,
                                        imgUrl:
                                            'assets/images/svgfile/marketIsnotAvalable.svg',
                                        description:
                                            'You can input the price between ${inquirycontroller.tradingSettingData.data!.market!.minBasePrice!} to ${inquirycontroller.tradingSettingData.data!.market!.maxBasePrice!} !');
                                  });
                                } else if (widget.operation == 'sell' && inquirycontroller.qtyShare.value < inquirycontroller.tradingSettingData.data!.minNumberOfShareForSelling! ||
                                    widget.operation == 'buy' &&
                                        inquirycontroller.qtyShare.value <
                                            inquirycontroller
                                                .tradingSettingData
                                                .data!
                                                .minNumberOfShareForBuying!) {
                                  setState(() {
                                    showNotifyPopUp(
                                        context: context,
                                        imgUrl:
                                            'assets/images/svgfile/marketIsnotAvalable.svg',
                                        description: widget.operation == 'sell'
                                            ? 'You have to input number of share greater then or equal to ${inquirycontroller.tradingSettingData.data!.minNumberOfShareForSelling!} !'
                                            : 'You have to input number of share greater then or equal to ${inquirycontroller.tradingSettingData.data!.minNumberOfShareForBuying!} !');
                                  });
                                } else if (inquirycontroller.selectTrade.value == 1 &&
                                    widget.operation == 'sell' &&
                                    inquirycontroller.qtyShare.value >
                                        inquirycontroller
                                            .tradingSettingData
                                            .data!
                                            .maxNumberOfShareForSelling!) {
                                  setState(() {
                                    showNotifyPopUp(
                                        context: context,
                                        imgUrl:
                                            'assets/images/svgfile/marketIsnotAvalable.svg',
                                        description: widget.operation == 'sell'
                                            ? 'You Can Sell The UT Between ${inquirycontroller.tradingSettingData.data!.minNumberOfShareForSelling!}  to ${inquirycontroller.tradingSettingData.data!.maxNumberOfShareForSelling!}'
                                            : 'You Can Buy The UT Between ${inquirycontroller.tradingSettingData.data!.minNumberOfShareForBuying!} ! to ${inquirycontroller.tradingSettingData.data!.maxNumberOfShareForBuying!}');
                                  });
                                } else {
                                  //  Submit function
                                  // *: hello
                                  debugPrint(
                                      "Submit Function${cusController.customer.value.id}");

                                  await inquirycontroller.onSubmitInquiry(
                                      context,
                                      widget.operation!,
                                      inquirycontroller.qtyShare.value,
                                      inquirycontroller.priceShare.value,
                                      inquirycontroller.demandInfo.value,
                                      cusController.customer.value.customerId!,
                                      inquirycontroller
                                          .tradingSettingData.data!.market!.id
                                          .toString());
                                }
                              }
                            }
                          : () async {
                              _formKey.currentState!.save();
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  "Submit Trade $operationType Request");
                              if (isValidate()) {
                                if (widget.tradingWith == 'cic-platform' &&
                                    inquirycontroller.priceShare.value <
                                        inquirycontroller.tradingSettingData
                                            .data!.market!.minBasePrice! &&
                                    inquirycontroller.priceShare.value >
                                        inquirycontroller.tradingSettingData
                                            .data!.market!.maxBasePrice!) {
                                  showNotifyPopUp(
                                      context: context,
                                      imgUrl:
                                          'assets/images/svgfile/marketIsnotAvalable.svg',
                                      description:
                                          'You can input the price between ${inquirycontroller.tradingSettingData.data!.market!.minBasePrice!} to ${inquirycontroller.tradingSettingData.data!.market!.maxBasePrice!} !');
                                } else if (widget.operation == 'sell' &&
                                        inquirycontroller.qtyShare.value >
                                            inquirycontroller
                                                .tradingSettingData
                                                .data!
                                                .maxNumberOfShareForSelling! ||
                                    inquirycontroller.qtyShare.value < inquirycontroller.tradingSettingData.data!.minNumberOfShareForSelling! &&
                                        widget.operation == 'buy' &&
                                        inquirycontroller.qtyShare.value >
                                            inquirycontroller
                                                .tradingSettingData
                                                .data!
                                                .maxNumberOfShareForBuying! ||
                                    inquirycontroller.qtyShare.value <
                                        inquirycontroller.tradingSettingData
                                            .data!.minNumberOfShareForBuying!) {
                                  setState(() {
                                    showNotifyPopUp(
                                        context: context,
                                        imgUrl:
                                            'assets/images/svgfile/marketIsnotAvalable.svg',
                                        description: widget.operation == 'sell'
                                            ? 'You Can Sell The UT Between ${inquirycontroller.tradingSettingData.data!.minNumberOfShareForSelling!}  to ${inquirycontroller.tradingSettingData.data!.maxNumberOfShareForSelling!}'
                                            : 'You Can Buy The UT Between ${inquirycontroller.tradingSettingData.data!.minNumberOfShareForBuying!} ! to ${inquirycontroller.tradingSettingData.data!.maxNumberOfShareForBuying!}');
                                  });
                                } else if (widget.operation == 'sell' &&
                                    inquirycontroller.qtyShare.value >
                                        inquirycontroller.tradingSettingData.data!.availableUt!) {
                                  setState(() {
                                    showNotifyPopUp(
                                        context: context,
                                        imgUrl:
                                            'assets/images/svgfile/marketIsnotAvalable.svg',
                                        description:
                                            'Your share is not sufficient to sell !');
                                  });
                                } else {
                                  widget.tradingWith == 'specific-platform'
                                      ? inquirycontroller.specificMember.value =
                                          inquirycontroller.specificMember.value
                                              .copyWith(
                                                  id: widget.targetMember!
                                                      .toInt())
                                      : widget.tradingWith!;

                                  await inquirycontroller.onUpdate(
                                      context,
                                      widget.operation!,
                                      inquirycontroller.qtyShare.value,
                                      inquirycontroller.priceShare.value,
                                      inquirycontroller.demandInfo.value,
                                      cusController.customer.value.customerId!,
                                      widget.id!,
                                      inquirycontroller
                                          .tradingSettingData.data!.market!.id
                                          .toString(),
                                      widget.tradingWith!,
                                      widget.targetMember);
                                }
                              }
                            },
                      title:
                          widget.price == null && widget.numberOfShare == null
                              ? widget.operation! == 'sell'
                                  ? "Submit Sell Request"
                                  : "Submit Buy Request"
                              : "Update",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
