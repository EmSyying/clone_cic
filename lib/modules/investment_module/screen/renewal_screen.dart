import 'dart:io';

import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_textformfield.dart';
import '../../../utils/form_builder/custom_button.dart';
import '../../../utils/form_builder/custom_drop_down.dart';

import '../../../utils/form_builder/dropdow_item.dart';
import '../../../utils/function/format_to_k.dart';
import '../../../utils/helper/custom_loading_button.dart';
import '../../../widgets/get_funding/custom_call_center.dart';
import '../../../widgets/investments/family_saving.dart';
import '../model/fif_application/fif_application.dart';

class RenewalScreen extends StatefulWidget {
  const RenewalScreen({
    Key? key,
    this.investAmount,
    this.fiFApplicationModel,
    this.id,
    this.interestEarned,
    this.annually,
    this.accountName,
    this.contractCode,
  }) : super(key: key);

  final String? annually;
  final num? id;
  final String? investAmount;
  final String? interestEarned;
  final FiFApplicationDetailModel? fiFApplicationModel;
  final String? accountName;
  final String? contractCode;

  @override
  State<RenewalScreen> createState() => _RenewalScreenState();
}

class _RenewalScreenState extends State<RenewalScreen> {
  final renewCon = Get.put(PriceController());

  void onValidate(BuildContext context) async {
    // if (renewCon.textRenewAmount.value == '') {
    //   renewCon.isRenewAmount.value = false;
    // } else {
    //   renewCon.isRenewAmount.value = true;
    // }
    if (renewCon.textRenewPeriod.value == '') {
      renewCon.isRenewPeriod.value = false;
    } else {
      renewCon.isRenewAmount.value = true;
    }
    if (renewCon.textRenewPeriod.value != '') {
      await renewCon.onPreviewRenewSubmit(context: context, id: widget.id);
    }
  }

  bool isDark = false;

  @override
  void initState() {
    renewCon.fetchRenewPeriodMoth();
    super.initState();
  }

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
                renewCon.onClearRenew();
                isDark = true;
              });
              Navigator.pop(context);
            }),
        title: Text(
          'Re-New',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
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
        () => Container(
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
              const SizedBox(
                height: 20,
              ),
              CustomTextFieldNew(
                enable: false,
                isRequired: true,
                isReadOnly: true,
                keyboardType: TextInputType.number,
                labelText: 'Investment Amount',
                hintText: 'Investment Amount',
                isValidate: renewCon.isRenewAmount.value,
                initialValue: FormatToK.digitNumber(
                  num.parse(
                    renewCon.fifAccountDetailModel.value.originalAmount
                        .toString(),
                  ),
                ),
              ),
              CICDropdown(
                // isDateTimePicker: true,
                isValidate: renewCon.isRenewPeriod.value,
                colors: Colors.white,
                isPadding: const EdgeInsets.only(left: 35, top: 5, bottom: 15),
                label: 'Renew Period',
                onChange: (date) {
                  if (date.isEmpty) {
                    renewCon.textRenewPeriod.value = '';
                    renewCon.isRenewPeriod.value = false;
                    renewCon.textRenewPeriod.refresh();
                    renewCon.isRenewPeriod.refresh();
                    renewCon.update();
                  } else {
                    renewCon.textRenewPeriod.value = date["Name"];

                    renewCon.isRenewPeriod.value = true;
                    renewCon.textRenewPeriod.refresh();
                    renewCon.isRenewPeriod.refresh();
                    renewCon.update();
                  }
                },
                defaultValue: renewCon.textRenewPeriod.value != ''
                    ? {"Name": renewCon.textRenewPeriod.value}
                    : null,
                item: renewCon.renewPeroidMonthList.asMap().entries.map((e) {
                  return DropDownItem(
                    paddingSuffixIcon: const EdgeInsets.only(top: 20),
                    itemList: {
                      "Name": e.value,
                      "Code": "1",
                      // "datePayment": e.value.firstPaymentDate,
                    },
                  );
                }).toList(),
              ),
              const Spacer(),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              Container(
                color: Colors.white,
                child: SafeArea(
                  top: false,
                  minimum: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: 'Cancel',
                          isDisable: false,
                          isOutline: true,
                          onPressed: () {
                            renewCon.onClearRenew();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: renewCon.isPreviewLoading.value
                            ? const CustomLoadingButton()
                            : CustomButton(
                                title: 'Next',
                                isDisable:
                                    renewCon.isPreviewLoading.value == false
                                        ? false
                                        : true,
                                isOutline: false,
                                onPressed: renewCon.textRenewPeriod.value != ''
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
        ),
      ),
    );
  }
}
