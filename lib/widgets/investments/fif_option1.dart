import 'dart:async';

import 'package:cicgreenloan/Utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';

import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/function/format_to_k.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Utils/chart/custom_circle_chart_1_3.dart';
import '../../Utils/helper/app_pin_code.dart' as apppincode;
import '../../Utils/helper/firebase_analytics.dart';
import '../../Utils/pop_up_alert/show_alert_dialog.dart';

import '../../modules/bonus/screens/cash_out/custom_change_account_bank.dart';
import '../../modules/investment_module/model/fif_contract_option/fif_contract_option.dart';
import '../../modules/investment_module/screen/bullet_payment_detail.dart';
import '../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../utils/form_builder/dropdow_item.dart';
import '../../utils/function/convert_to_double.dart';
import '../../utils/function/operator.dart';
import '../../utils/helper/container_partern.dart';
import '../../utils/helper/numerice_format.dart';
import '../defualt_size_web.dart';
import '../get_funding/custom_call_center.dart';

// ignore: must_be_immutable
class FIFOption1 extends StatefulWidget {
  const FIFOption1({Key? key, this.id, this.paymentDate, this.options})
      : super(key: key);
  final num? id;
  final PaymentDate? paymentDate;
  final List<FIFoptionModel>? options;

  @override
  State<FIFOption1> createState() => _FIFOption1State();
}

class _FIFOption1State extends State<FIFOption1> {
  final fifController = Get.put(PriceController());
  Timer? searchOnStoppedTyping;
  void _validateDeduc() {
    fifController.validateFIF().then((value) {
      if (fifController.deductionAmount.value != 0) {
        if (Opterator.isBetween(
            fifController.minDeductionAmount.value,
            fifController.deductionAmount.value,
            fifController.maxDeductionAmount.value)) {
          fifController.isValidateDeductionAmount(true);
        } else {
          fifController.isValidateDeductionAmount(false);
        }
      }
    });
  }

  void _onChangeHandler(String textChanged, bool isAmount) {
    debugPrint('TRUE HZ 111');
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(() {
      searchOnStoppedTyping = Timer(
        duration,
        () {
          if (textChanged.isNotEmpty) {
            if (isAmount) {
              if (Opterator.isBetween(
                fifController.minimum.value,
                fifController.textAmount.value,
                fifController.maximum.value,
              )) {
                _validateDeduc();
              }
            } else {
              if (Opterator.isBetween(
                fifController.durationMin.value,
                fifController.textDuration.value,
                fifController.durationMax.value,
              )) {
                _validateDeduc();
              }
            }
          }
        },
      );
    });
  }

  void onValidate(BuildContext? context) {
    if (fifController.fiFApplicationDetailPending.value.subproductName == "") {
      fifController.isvalidateMethod.value = false;
    }
    if (!Opterator.isBetween(fifController.minimum.value,
        fifController.textAmount.value, fifController.maximum.value)) {
      fifController.isValidateAmount.value = false;
      setState(() {
        validateTextAmoun = fifController.validateMessage.value;
      });
    } else {
      fifController.isValidateAmount.value = true;
    }

    if (!Opterator.isBetween(fifController.durationMin.value,
        fifController.textDuration.value, fifController.durationMax.value)) {
      fifController.isValidateDuration.value = false;
      setState(() {
        validateTextDuration = fifController.durationMessage.value;
      });
    } else {
      fifController.isValidateDuration.value = true;
    }

    //TODO: here
    debugPrint('Amount : ${fifController.deductionAmount.value}');
    debugPrint('maxAmount : ${fifController.maxDeductionAmount.value}');
    debugPrint(
        'maxAmount productNameType: ${fifController.productNameType.value}');
    if (fifController.fiFApplicationDetailPending.value.subproductCode ==
            "MPD-0002" &&
        (fifController.deductionAmount.value == 0 ||
            fifController.deductionAmount.value >
                fifController.maxDeductionAmount.value)) {
      debugPrint('Work on False');
      fifController.isValidateDeductionAmount.value = false;
    } else {
      fifController.isValidateDeductionAmount.value = true;
    }

    ///
    if (fifController.textInvestDate == null) {
      fifController.isValidateinvestDate.value = false;
    } else {
      fifController.isValidateinvestDate.value = true;
    }

    if (fifController.textReceivingAccount.value == '' &&
        fifController.textReceivingAccountTitle.value == '') {
      fifController.isValidateReceiveAcc.value = false;
    } else {
      fifController.isValidateReceiveAcc.value = true;
    }

    if (Opterator.isBetween(fifController.minimum.value,
            fifController.textAmount.value, fifController.maximum.value) &&
        Opterator.isBetween(
            fifController.durationMin.value,
            fifController.textDuration.value,
            fifController.durationMax.value) &&
        fifController.textInvestDate != null &&
        fifController.textReceivingAccount.value != '') {
      debugPrint('All Form Validation = true');

      if (widget.options!.isNotEmpty) {
        fifController.validateFIF().then((value) {
          if (fifController.fiFApplicationDetailPending.value.subproductName !=
              '') {
            if (fifController
                    .fiFApplicationDetailPending.value.subproductCode ==
                "MPD-0002") {
              if (fifController.deductionAmount.value != 0 &&
                  fifController.maxDeductionAmount.value != 0 &&
                  fifController.deductionAmount.value <=
                      fifController.maxDeductionAmount.value) {
                debugPrint(
                    'All Form Validation = true with : ${fifController.maxDeductionAmount.value}');
                Navigator.push(
                  context!,
                  MaterialPageRoute(
                    builder: (context) {
                      return BulletPaymentDetail(
                        isAnnullyRate: true,
                        oncallBack: () async {
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              'Submit create fif application');

                          apppincode
                              .showLockScreen(enableCancel: true)
                              .then((value) {
                            debugPrint('Success hx $value');
                            if (value) {
                              fifController.onCreateFiF(
                                  id: widget.id, buildcontext: context);
                            }
                          });
                        },
                        fromPage:
                            widget.id != null ? 'from edit' : 'from submit',
                        titles: 'Fixed Income Fund',
                        productName: fifController.productNameType.value,
                        // annually: fifController.annuallyInterestRate.value,
                        isNoUSD: true,
                        investAmount: fifController.textAmount.value.toString(),
                        investDate: fifController.textInvestDate.toString(),
                        investDuration: fifController.textDuration.value,
                        firstPayDate:
                            fifController.displayFirstPaymentDate.toString(),
                      );
                    },
                  ),
                );
              }
            } else {
              // fifController.onCreateFiF(buildcontext: context, id: widget.id);
              Navigator.push(
                context!,
                MaterialPageRoute(
                  builder: (context) {
                    return BulletPaymentDetail(
                      isAnnullyRate: true,
                      oncallBack: () async {
                        FirebaseAnalyticsHelper.sendAnalyticsEvent(
                            'Submit create fif application');

                        await apppincode
                            .showLockScreen(enableCancel: true)
                            .then((value) async {
                          if (value) {
                            debugPrint('Make Request');

                            await fifController.onCreateFiF(
                                id: widget.id, buildcontext: context);
                          }
                        });
                      },
                      fromPage: widget.id != null ? 'from edit' : 'from submit',
                      titles: 'Fixed Income Fund',
                      productName: fifController.productNameType.value,
                      // annually: fifController.annuallyInterestRate.value,
                      isNoUSD: true,
                      investAmount: fifController.textAmount.value.toString(),
                      investDate: fifController.textInvestDate.toString(),
                      investDuration: fifController.textDuration.value,
                      firstPayDate:
                          fifController.displayFirstPaymentDate.toString(),
                    );
                  },
                ),
              );
            }
          }
        });

        debugPrint('Deduction Amount = ${fifController.deductionAmount.value}');
      } else {
        // fifController.onCreateFiF(buildcontext: context, id: widget.id);
        debugPrint('All Form Validation = No Deduction Amount Can Route Here');
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) {
              return BulletPaymentDetail(
                isAnnullyRate: true,
                oncallBack: () async {
                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                      'Submit create fif application');

                  await apppincode
                      .showLockScreen(enableCancel: true)
                      .then((value) {
                    if (value) {
                      debugPrint('Make Request');
                      fifController.onCreateFiF(
                          id: widget.id, buildcontext: context);
                    }
                  });
                },
                fromPage: widget.id != null ? 'from edit' : 'from submit',
                titles: 'Fixed Income Fund',
                productName: fifController.productNameType.value,
                // annually: fifController.annuallyInterestRate.value,
                isNoUSD: true,
                investAmount: fifController.textAmount.value.toString(),
                investDate: fifController.textInvestDate.toString(),
                investDuration: fifController.textDuration.value,
                firstPayDate: fifController.displayFirstPaymentDate.toString(),
              );
            },
          ),
        );
        //TODO : Can Route here when Product not in MPD-0002

      }
    } else {
      debugPrint('All Form Validation = false');
    }

    debugPrint(
        'Product Name : ${fifController.initialMethodProductCode.value}');
    debugPrint('Product code : ${fifController.productCode.value}');
  }

  int? currentIndex;

  int? index;
  bool? shoulPop = false;
  @override
  void initState() {
    fifController.isNewBank.value = true;
    fifController.fetchFirstDate();
    fifController.fetchPayment().then((value) {
      debugPrint('=====>${fifController.productCode.value}');
    });

    super.initState();
  }

  dynamic investDateCheck = "";
  String validateTextAmoun = '';
  String validateTextDuration = '';

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: WillPopScope(
        onWillPop: () async {
          return shoulPop!;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.black26,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                // fifController.onClearFIF();
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'FIF Application',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 2,
            actions: const [
              CustomCallCenter(
                type: "FIF",
              ),
              CustomCircleChart(
                numberPage: 2,
                isFIF: true,
              ),
              SizedBox(width: 20.0)
            ],
          ),
          body: Obx(
            () => fifController.isLoadingPayment.value
                ? const LinearProgressIndicator()
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              if (widget.options!.isNotEmpty)
                                CICDropdown(
                                  label: 'Redemption Medthod',
                                  isValidate:
                                      fifController.isvalidateMethod.value,
                                  colors: Colors.white,
                                  isPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  isCompany: false,
                                  item:
                                      widget.options!.asMap().entries.map((e) {
                                    return DropDownItem(
                                      itemList: {
                                        "Name": e.value.subproductName,
                                        "Code": e.value.subid,
                                        "Product_code": e.value.subproductCode
                                      },
                                    );
                                  }).toList(),
                                  onChange: (v) {
                                    fifController
                                            .fiFApplicationDetailPending.value =
                                        fifController
                                            .fiFApplicationDetailPending.value
                                            .copyWith(productId: v['Code']);

                                    fifController
                                            .fiFApplicationDetailPending.value =
                                        fifController
                                            .fiFApplicationDetailPending.value
                                            .copyWith(
                                                subproductName: v['Name']);
                                    debugPrint(
                                        "Product Name:${fifController.initailMethodName}");
                                    fifController
                                            .fiFApplicationDetailPending.value =
                                        fifController
                                            .fiFApplicationDetailPending.value
                                            .copyWith(
                                                subproductCode:
                                                    v['Product_code']);
                                    fifController.productCode.value =
                                        v['Product_code'];
                                    fifController.productNameType.value =
                                        v['Name'];

                                    if (fifController
                                            .fiFApplicationDetailPending
                                            .value
                                            .productName ==
                                        "") {
                                      fifController.isvalidateMethod.value =
                                          false;
                                    } else {
                                      fifController.isvalidateMethod.value =
                                          true;
                                    }
                                  },
                                  defaultValue: fifController
                                              .fiFApplicationDetailPending
                                              .value
                                              .subproductName !=
                                          ""
                                      ? {
                                          "Code": fifController
                                              .fiFApplicationDetailPending
                                              .value
                                              .subid,
                                          "Name": fifController
                                              .fiFApplicationDetailPending
                                              .value
                                              .subproductName
                                        }
                                      : null,
                                ),
                              SizedBox(
                                  height:
                                      fifController.medthodproductCode.value ==
                                              "RBI-0007"
                                          ? 10
                                          : 0),
                              CustomTextFieldNew(
                                inputFormatterList: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  NumericTextFormatter(),
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'^0+')),
                                ],
                                controller: fifController.amountController,
                                keyboardType: TextInputType.number,
                                validateText:
                                    fifController.textAmount.value == 0.0
                                        ? "Please Enter Investment Amount"
                                        : fifController.validateMessage.value,
                                hintText: 'Investment Amount',
                                labelText: 'Investment Amount',
                                isRequired: true,
                                isValidate:
                                    fifController.isValidateAmount.value,
                                onChange: (valueChange) {
                                  _onChangeHandler(valueChange, true);

                                  if (valueChange.isEmpty) {
                                    fifController.isValidateAmount(false);
                                    fifController.textAmount.value = 0.0;
                                  } else {
                                    var amount =
                                        valueChange.replaceAll(',', '');
                                    fifController.textAmount.value =
                                        onConvertToDouble(amount);
                                    if (Opterator.isBetween(
                                        fifController.minimum.value,
                                        fifController.textAmount.value,
                                        fifController.maximum.value)) {
                                      fifController.isValidateAmount(true);
                                    } else {
                                      fifController.isValidateAmount(false);
                                    }
                                  }
                                },
                                initialValue: fifController.textAmount.value !=
                                        0
                                    ? fifController.textAmount.value.toString()
                                    : "",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    'USD',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.black38),
                                  ),
                                ),
                              ),
                              CustomTextFieldNew(
                                enable: fifController.isValidateAmount.value &&
                                        fifController.textAmount.value != 0
                                    ? true
                                    : false,
                                inputFormatterList: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  NumericTextFormatter(),
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r'^0+'),
                                  ),
                                ],
                                controller: fifController.durationController,
                                keyboardType: TextInputType.number,
                                hintText: 'Investment Duration',
                                labelText: 'Investment Duration',
                                isRequired: true,
                                isValidate:
                                    fifController.isValidateDuration.value,
                                validateText:
                                    fifController.textDuration.value == 0
                                        ? "Please Enter Invesment Duration"
                                        : fifController.durationMessage.value,
                                onChange: (valueChanged) {
                                  _onChangeHandler(valueChanged, false);
                                  if (valueChanged.isEmpty) {
                                    fifController.isValidateDuration(false);
                                    fifController.textDuration.value = 0;
                                  } else {
                                    var duration =
                                        valueChanged.replaceAll(',', '');
                                    fifController.textDuration.value =
                                        int.parse(duration);
                                    if (Opterator.isBetween(
                                        fifController.durationMin.value,
                                        fifController.textDuration.value,
                                        fifController.durationMax.value)) {
                                      fifController.isValidateDuration(true);
                                    } else {
                                      fifController.isValidateDuration(false);
                                    }
                                  }

                                  //
                                  if (fifController
                                          .initialMethodProductCode.value !=
                                      "MPD-0002") {
                                    validateTextDuration =
                                        fifController.durationMessage.value;
                                  }
                                },
                                initialValue:
                                    fifController.textDuration.value != 0
                                        ? fifController.textDuration.value
                                            .toString()
                                        : "",
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, right: 20),
                                  child: Text(
                                    'Month(s)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.black38),
                                  ),
                                ),
                              ),

                              if (widget.options!.isNotEmpty &&
                                  fifController.fiFApplicationDetailPending
                                          .value.subproductCode ==
                                      "MPD-0002")
                                Stack(
                                  children: [
                                    CustomTextFieldNew(
                                      controller: fifController
                                          .deductionAmountController,
                                      enable: fifController
                                                      .initialMethodProductCode
                                                      .value ==
                                                  "MPD-0002" &&
                                              fifController
                                                      .textDuration.value !=
                                                  0
                                          ? true
                                          : fifController
                                                      .initialMethodProductCode
                                                      .value !=
                                                  "MPD-0002"
                                              ? true
                                              : false,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          'USD',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.black38),
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatterList: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        NumericTextFormatter(),
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'^0+')),
                                      ],
                                      validateText: fifController
                                                  .deductionAmount.value ==
                                              0
                                          ? "Please Enter Principal Deduction Amount"
                                          : _deductionAmountValidateMSG,
                                      isValidate: fifController
                                          .isValidateDeductionAmount.value,
                                      initialValue: fifController
                                                  .deductionAmount.value ==
                                              0
                                          ? ""
                                          : fifController.deductionAmount.value
                                              .toString(),
                                      hintText: "Principal Deduction Amount",
                                      labelText: "Principal Deduction Amount",
                                      isRequired: true,
                                      onChange: (valueChanged) {
                                        var value =
                                            valueChanged.replaceAll(',', '');

                                        if (valueChanged.isEmpty) {
                                          fifController
                                              .isValidateDeductionAmount(false);
                                          fifController.deductionAmount.value =
                                              0.0;
                                        } else {
                                          fifController.deductionAmount.value =
                                              onConvertToDouble(value);
                                          fifController
                                              .isValidateDeductionAmount
                                              .value = true;
                                          if (Opterator.isBetween(
                                              fifController
                                                  .minDeductionAmount.value,
                                              fifController
                                                  .deductionAmount.value,
                                              fifController
                                                  .maxDeductionAmount.value)) {
                                            fifController
                                                .isValidateDeductionAmount(
                                                    true);
                                          } else {
                                            fifController
                                                .isValidateDeductionAmount(
                                                    false);
                                          }
                                        }
                                      },
                                    ),
                                    fifController.validateFIFLoading.value
                                        ? _loadingDeducAmount()
                                        : const SizedBox.shrink()
                                  ],
                                ),

                              // SizedBox(height: 20),

                              // Text(
                              //   fifController.deductionMessage.value,
                              //   style: const TextStyle(color: Colors.red),
                              // ),
                              CICDropdown(
                                  currentDate:
                                      fifController.textInvestDate != null &&
                                              FormatDate.isAfterDateTime(
                                                  fifController.textInvestDate)
                                          ? DateFormat("dd-MM-yyyy").parse(
                                              fifController.textInvestDate
                                                  .toString())
                                          : FormatDate.today(),
                                  isDateTimePicker: true,
                                  getDateTime: true,
                                  isCompany: true,
                                  isSelectBank: true,
                                  colors: Colors.white,
                                  isPadding: EdgeInsets.zero,
                                  isValidate:
                                      fifController.isValidateinvestDate.value,
                                  isPayment: true,
                                  isAppBar: true,
                                  onChange: (investDate) {
                                    if (investDate.isEmpty) {
                                      fifController.isValidateinvestDate.value =
                                          false;
                                      fifController.textInvestDate = null;

                                      fifController.update();
                                      fifController.isValidateinvestDate
                                          .refresh();
                                    } else {
                                      debugPrint(
                                          "onChange date:${investDate["Name"]}");
                                      fifController.isValidateinvestDate.value =
                                          true;
                                      fifController.textInvestDate =
                                          investDate["Name"];
                                      investDateCheck = investDate["Name"];

                                      fifController.firstPaymentDateIncrease =
                                          DateTime(
                                              investDate["Name"].year,
                                              investDate["Name"].month,
                                              investDate["Name"].day + 30);

                                      fifController.update();
                                      fifController.isValidateinvestDate
                                          .refresh();
                                    }
                                  },
                                  label: 'Investment Date',
                                  defaultValue: fifController.textInvestDate !=
                                          null
                                      ? {
                                          "Name": investDateCheck != ""
                                              ? FormatDate
                                                  .investmentDateDropDown(
                                                      fifController
                                                          .textInvestDate
                                                          .toString())
                                              : fifController.textInvestDate !=
                                                      null
                                                  ? FormatDate
                                                      .investmentDateDropDown(
                                                          fifController
                                                              .textInvestDate
                                                              .toString())
                                                  : "",
                                          "Code": 3
                                        }
                                      : null),

                              const SizedBox(height: 10),

                              CICDropdown(
                                isValidate:
                                    fifController.isValidateReceiveAcc.value,
                                colors: Colors.white,
                                imageUrl:
                                    fifController.paymentModel.value.image,
                                isPadding: const EdgeInsets.only(left: 5),
                                isUserAccount: true,
                                isProfile: true,
                                isSelectBank: true,
                                isCompany: true,
                                item: fifController.paymentDataList
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  return DropDownItem(
                                    isPadding: const EdgeInsets.all(10),
                                    itemList: {
                                      "Name": e.value.bankName,
                                      "Code": e.value.id,
                                      "accountName": e.value.accounName,
                                      "accountNumber": e.value.accountNumber,
                                      "picture": e.value.image,
                                      "type": e.value.type
                                    },
                                  );
                                }).toList(),
                                onChange: (v) {
                                  fifController.mmaAccountId.value = v["Code"];
                                  fifController.isValidateReceiveAcc.value =
                                      true;
                                  fifController.bankId.value = v["Code"];
                                  fifController.textReceivingAccount.value =
                                      v["type"];
                                  fifController.textReceivingAccountTitle
                                      .value = v["Name"];
                                  fifController.accounName.value =
                                      v["accountName"];
                                  fifController.accountNumber.value =
                                      v["accountNumber"];
                                  fifController.update();
                                  fifController.textReceivingAccount.refresh();
                                },
                                label: 'Interest Receiving Account',
                                defaultValue: fifController
                                            .textReceivingAccountTitle.value !=
                                        ""
                                    ? {
                                        "Code": fifController.bankId.value,
                                        "Name": fifController
                                            .textReceivingAccountTitle.value
                                      }
                                    : null,
                                onCreateCompany: () {
                                  bonusCon.onClearBank();
                                  fifController.isNewBank.value = false;
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            borderRaduis)),
                                    context: context,
                                    builder: (context) =>
                                        CustomChangeAccountBank(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildBotton(context)
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Positioned _loadingDeducAmount() {
    return Positioned.fill(
      child: Container(
        padding: EdgeInsets.only(
            bottom: fifController.isValidateDeductionAmount.value ? 0 : 35),
        decoration: const BoxDecoration(color: Colors.transparent),
        alignment: Alignment.center,
        child: const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildBotton(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            isDisable: false,
            isOutline: true,
            title: 'Cancel',
            onPressed: () {
              _showCancelDialog(context);
            },
          )),
          const SizedBox(width: 15),
          Expanded(
            child: CustomButton(
              isDisable: false,
              isOutline: false,
              title: 'Next',
              onPressed: () {
                onValidate(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  String get _deductionAmountValidateMSG =>
      "The amounts must be between ${FormatToK.convertNumber(fifController.minDeductionAmount.value)} USD and ${FormatToK.convertNumber(fifController.maxDeductionAmount.value)} USD";

  _showCancelDialog(BuildContext context) {
    showSaveDraftDialog(
      onDiscard: () {
        fifController.onClearFIF();
        Navigator.pop(context);
      },
      isDisableSaveDraft: true,
      context: context,
      title: 'Are you sure you want to leave this page?',
      content: 'Changes made to this page haven’t been saved yet.',
      isCancel: true,
    );
  }
}
