import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/widgets/bonus/service_agreement.dart';

import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_bank_transfter_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/color.dart';
import '../../investments/slide_button.dart';

class CustomDeductBonus extends StatelessWidget {
  final String? subscriptionStatus;
  final String? paymentStatus;
  final num? subscriptionUT;
  final num? subscriptionCost;
  final num? accPayment;
  final num? remainingPayment;
  final bool? istransfertoCiCBank;
  final num? payable;

  const CustomDeductBonus(
      {Key? key,
      this.subscriptionStatus,
      this.paymentStatus,
      this.subscriptionCost,
      this.subscriptionUT,
      this.accPayment,
      this.remainingPayment,
      this.payable,
      this.istransfertoCiCBank = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subDetailCon = Get.put(BonusController());
    subDetailCon.fetchBankMember(cicBank: "cic");
    return CupertinoScaffold(body: Builder(builder: (context) {
      return CupertinoScaffold(
        body: Obx(
          () => Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subscription Status',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '$subscriptionStatus'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              subscriptionStatus == 'confirmed'
                                                  ? Colors.green
                                                  : Colors.red),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  'UT to Subscribe',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Total Subscription Cost',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                                // SizedBox(height: 10),
                                // Text(
                                //   'Accumulated Payment',
                                //   style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                //       fontSize: 13, fontWeight: FontWeight.w500),
                                // ),
                                const SizedBox(height: 10),
                                Text(
                                  'Remaining Payment',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Status',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '$paymentStatus'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: paymentStatus == 'paid'
                                              ? Colors.green
                                              : paymentStatus ==
                                                      'partially paid'
                                                  ? AppColor
                                                      .statusColor['pending']
                                                  : Colors.red),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  '$subscriptionUT UT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${FormatToK.digitNumber(subscriptionCost)} USD',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                                // SizedBox(height: 10),
                                // Text(
                                //   '$accPayment',
                                //   style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                //       fontSize: 13, fontWeight: FontWeight.w500),
                                // ),
                                const SizedBox(height: 10),
                                Text(
                                  '${FormatToK.digitNumber(remainingPayment)} USD',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.grey[300],
                    ),
                    istransfertoCiCBank == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 15.0),
                                child: Text('Available payment account',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontWeight: FontWeight.w700)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    subDetailCon.bankMemberDataList.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: CustomBankTransferCard(
                                      bankDetail: e,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 20.0,
                                  right: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Confirm your payment information',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    GetBuilder<SettingController>(
                                      init: SettingController(),
                                      builder: (controller) {
                                        return InkWell(
                                          onTap: () {
                                            onShowBottomSheet(
                                                icondata: Icons.close,
                                                isLoading: controller.isloading,
                                                title: controller
                                                    .uiSettingData
                                                    .confirmPaymentInformation!
                                                    .label,
                                                context: context,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                      child: HtmlWidget(
                                                        "${controller.uiSettingData.confirmPaymentInformation!.description}",
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge!,
                                                      ),
                                                    )
                                                  ],
                                                ));
                                          },
                                          child: SvgPicture.asset(
                                              'assets/images/svgfile/questicon.svg'),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const CustomTextFieldNew(
                                isRequired: true,
                                isReadOnly: true,
                                enable: false,
                                hintText: "Pay from",
                                labelText: "Pay from",
                                initialValue: "CiC Bonus",
                              ),
                              CustomTextFieldNew(
                                enable: false,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                // isValidate: subDetailCon.isValidateCashoutAmount.value,
                                labelText: 'Amount',
                                hintText: 'Amount',
                                isRequired: true,
                                onChange: (value) {
                                  if (value == "") {
                                    subDetailCon.payable.value = 0.0;
                                    // subDetailCon.isValidateCashoutAmount.value = false;
                                  } else {
                                    subDetailCon.payable.value =
                                        double.parse(value);
                                    // subDetailCon.isValidateCashoutAmount.value = true;
                                  }
                                },
                                initialValue: subDetailCon.payable.value != 0.0
                                    ? '${subDetailCon.payable.value}'
                                    : '',
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              istransfertoCiCBank == true
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                          subDetailCon.currentIndexPage.value = 0;
                        },
                        title: 'Close',
                        isDisable: false,
                        isOutline: true,
                      ),
                    )
                  : Column(
                      children: [
                        InkWell(
                          onTap: () {
                            subDetailCon.isConfirm.value =
                                !subDetailCon.isConfirm.value;
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                subDetailCon.isConfirm.value == false
                                    ? SvgPicture.asset(
                                        'assets/images/svgfile/cicle_check.svg',
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        'assets/images/svgfile/circle_check-selected.svg'),
                                const SizedBox(width: 20),
                                Text(
                                  'I have read  and agree to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    onShowCustomCupertinoModalSheet(
                                        context: context,
                                        child: ServiceAgreement(
                                          serviceAgreement: subDetailCon
                                              .bonusSetting
                                              .value
                                              .serviceAgreement,
                                        ),
                                        title: 'Service Agreement',
                                        icon: const Icon(Icons.arrow_back_ios));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'CiC serivce agreement',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          thickness: 1.2,
                          color: Colors.grey[200],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: SlideButton(
                            callback: subDetailCon.isConfirm.value == true
                                ? () async {
                                    // await priController.onRedeemToSubmitMVP(context);
                                    subDetailCon.onRequestPayment(context);
                                  }
                                : null,
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      );
    }));
  }
}
