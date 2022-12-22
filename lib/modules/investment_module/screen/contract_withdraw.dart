import 'dart:io';

import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/utils/form_builder/custom_date_time_picker.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/form_builder/custom_button.dart';
import '../../../utils/form_builder/custom_drop_down.dart';
import '../../../utils/form_builder/custom_textformfield.dart';
import '../../../utils/helper/custom_loading_button.dart';
import '../../../utils/helper/numerice_format.dart';
import '../../../widgets/get_funding/custom_call_center.dart';
import '../../../widgets/investments/family_saving.dart';
import '../../../widgets/investments/withdraw_notice_card.dart';

class ContractWithdrawScreen extends StatefulWidget {
  const ContractWithdrawScreen({
    Key? key,
    this.investAmount,
    this.interestEarned,
    this.id,
    this.productName,
    this.contractCode,
    this.accountName,
  }) : super(key: key);
  final String? investAmount;
  final String? interestEarned;
  final String? productName;
  final num? id;
  final String? contractCode;
  final String? accountName;

  @override
  State<ContractWithdrawScreen> createState() => _ContractWithdrawScreenState();
}

class _ContractWithdrawScreenState extends State<ContractWithdrawScreen> {
  final contractCon = Get.put(PriceController());
  Map? copyDate = {};

  bool onValidate(BuildContext context) {
    if (contractCon.textWithdrawAmount.value == 0 ||
        contractCon.textWithdrawAmount.value >
            contractCon.fifAccountDetailModel.value.originalAmount! ||
        contractCon.textWithdrawAmount.value <
            contractCon.fifAccountDetailModel.value.minimumWithdrawal!) {
      contractCon.iswithdrawAmount.value = false;
    } else {
      contractCon.iswithdrawAmount.value = true;
    }
    if (contractCon.textdisbursementDate == null) {
      contractCon.isdisbursementDate.value = false;
    } else {
      contractCon.isdisbursementDate.value = true;
    }
    if (contractCon.textWithdrawAmount.value != 0 &&
        contractCon.textWithdrawAmount.value <=
            contractCon.fifAccountDetailModel.value.originalAmount! &&
        contractCon.textWithdrawAmount.value >=
            contractCon.fifAccountDetailModel.value.minimumWithdrawal!) {
      // Funtion Here
      contractCon.onPreviewWidthdrawSubmit(context);
    }

    return false;
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: isDark == false
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: kIsWeb
                ? const Icon(Icons.arrow_back)
                : Platform.isAndroid
                    ? const Icon(Icons.arrow_back)
                    : const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              setState(() {
                isDark = true;
              });
              Navigator.pop(context);
            }),
        title: Text(
          'Redemption',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CustomCallCenter(type: "FIF"),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      FamilySaving(
                        interestEarned: widget.interestEarned,
                        investmentAmount: widget.investAmount,
                        image: 'assets/images/svgfile/investfif.svg',
                        title: widget.accountName,
                        subTitle: widget.contractCode,
                        isHideEarned: false,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFieldNew(
                        inputFormatterList: [
                          FilteringTextInputFormatter.digitsOnly,
                          NumericTextFormatter(),
                          FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                        ],
                        keyboardType: TextInputType.number,
                        labelText: 'Redemption Amount',
                        hintText: 'Redemption Amount',
                        onChange: (valueChaned) {
                          var amount = valueChaned.replaceAll(',', '');
                          if (amount.isEmpty) {
                            contractCon.textWithdrawAmount.value = 0;
                            contractCon.iswithdrawAmount.value = false;
                            contractCon.textWithdrawAmount.refresh();
                            contractCon.update();
                          } else if (onConvertToDouble(amount) >
                                  contractCon.fifAccountDetailModel.value
                                      .originalAmount!
                                      .toInt() ||
                              onConvertToDouble(amount) <
                                  contractCon.fifAccountDetailModel.value
                                      .minimumWithdrawal!) {
                            contractCon.textWithdrawAmount.value =
                                onConvertToDouble(amount);
                            contractCon.iswithdrawAmount.value = false;
                            contractCon.validateTextAmount.value =
                                'Redemption amount is bigger than investment amount.';
                            contractCon.textminimumWithdraw.value = contractCon
                                .fifAccountDetailModel.value.withdrawalMessage!;
                            contractCon.onValidatedWidthdrawSubmit();
                          }
                          // else if (Opterator.isBetween(
                          //     contractCon.fifAccountDetailModel.value
                          //         .minimumWithdrawal,
                          //     contractCon
                          //         .fifAccountDetailModel.value.originalAmount,
                          //     contractCon.textWithdrawAmount.value)) {
                          //   contractCon.validateTextAmount.value = contractCon
                          //       .fifAccountDetailModel.value.withdrawalMessage!;
                          // }
                          else {
                            contractCon.textWithdrawAmount.value =
                                onConvertToDouble(amount);
                            contractCon.iswithdrawAmount.value = true;

                            contractCon.textWithdrawAmount.refresh();
                            contractCon.update();
                            contractCon.onValidatedWidthdrawSubmit();
                          }
                        },
                        isValidate: contractCon.iswithdrawAmount.value,
                        initialValue: contractCon.textWithdrawAmount.value != 0
                            ? contractCon.textWithdrawAmount.value.toString()
                            : '',
                        validateText: contractCon.textWithdrawAmount.value <
                                contractCon.fifAccountDetailModel.value
                                    .minimumWithdrawal!
                            ? contractCon.textminimumWithdraw.value
                            : contractCon.textWithdrawAmount.value >
                                    contractCon.fifAccountDetailModel.value
                                        .originalAmount!
                                        .toInt()

                                // Opterator.isBetween(
                                //     contractCon.fifAccountDetailModel.value
                                //         .minimumWithdrawal,
                                //     contractCon.fifAccountDetailModel.value
                                //         .originalAmount,
                                //     contractCon.textWithdrawAmount.value)
                                ? contractCon.validateTextAmount.value
                                : null,
                      ),
                      CICDropdown(
                          isFIF: true,
                          isSelectBank: true,
                          isDateTimePicker: true,
                          isEnable: true,
                          colors: Colors.white,
                          isPadding: EdgeInsets.zero,
                          isPayment: true,
                          isAppBar: true,
                          label: 'Disbursement Date',
                          defaultValue: contractCon.textdisbursementDate != null
                              ? {
                                  "Name": FormatDate.investmentDateDropDown(
                                      contractCon.textdisbursementDate
                                          .toString())
                                }
                              : null,
                          onTap: contractCon.textWithdrawAmount.value != 0
                              ? () {
                                  // Navigator.pop(context);
                                  openDateTimePicker(
                                    currentDate:
                                        contractCon.validatedwithdrawDateTime,
                                    getDateTimeFormat: true,
                                    context: context,
                                    onSelectDone: (DateTime value) {
                                      copyDate = {
                                        'Name': contractCon
                                                    .textWithdrawAmount.value !=
                                                0
                                            ? contractCon
                                                .validatedwithdrawDateTime
                                            : value,
                                      };

                                      if (copyDate!.isEmpty) {
                                        contractCon.textdisbursementDate = null;
                                        contractCon.isdisbursementDate.value =
                                            false;

                                        contractCon.isdisbursementDate
                                            .refresh();
                                        contractCon.update();
                                      } else {
                                        setState(() {
                                          contractCon.textdisbursementDate =
                                              copyDate!["Name"];
                                          contractCon.textdisbursementDateSubmit
                                                  .value =
                                              copyDate!["Name"].toString();
                                        });
                                        contractCon.isdisbursementDate.value =
                                            true;

                                        contractCon.isdisbursementDate
                                            .refresh();
                                        contractCon.update();
                                      }
                                    },
                                    onChange: (value) {
                                      copyDate = {
                                        'Name': contractCon
                                                    .textWithdrawAmount.value !=
                                                0
                                            ? contractCon
                                                .validatedwithdrawDateTime
                                            : value,
                                      };

                                      if (copyDate!.isEmpty) {
                                        contractCon.textdisbursementDate = null;
                                        contractCon.isdisbursementDate.value =
                                            false;

                                        contractCon.isdisbursementDate
                                            .refresh();
                                        contractCon.update();
                                      } else {
                                        setState(() {
                                          contractCon.textdisbursementDate =
                                              copyDate!["Name"];
                                          contractCon.textdisbursementDateSubmit
                                                  .value =
                                              copyDate!["Name"].toString();
                                        });
                                        contractCon.isdisbursementDate.value =
                                            true;

                                        contractCon.isdisbursementDate
                                            .refresh();
                                        contractCon.update();
                                      }
                                    },
                                    selectedDate:
                                        contractCon.validatedwithdrawDateTime,
                                  );
                                }
                              : null),
                      const WithdrawNoticeCard(),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                Container(
                  color: Colors.white,
                  // margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: 'Cancel',
                            isDisable: false,
                            isOutline: true,
                            onPressed: () {
                              Navigator.pop(context);
                              contractCon.onclearWithdraw();
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: contractCon.isPreviewWidthdrawLoading.value
                              ? const CustomLoadingButton()
                              : CustomButton(
                                  title: 'Next',
                                  isDisable: contractCon
                                              .isPreviewWidthdrawLoading
                                              .value ==
                                          false
                                      ? false
                                      : true,
                                  isOutline: false,
                                  onPressed: contractCon.textdisbursementDate !=
                                              null &&
                                          contractCon
                                                  .textWithdrawAmount.value !=
                                              0
                                      ? () {
                                          onValidate(context);
                                        }
                                      : null,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
