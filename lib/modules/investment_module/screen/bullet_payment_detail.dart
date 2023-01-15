import 'dart:io';

import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/investment_module/model/fif_application/fif_application.dart';
import 'package:cicgreenloan/widgets/investments/custom_bullet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../utils/function/format_to_k.dart';
import '../../../widgets/investments/custom_product_type_detail.dart';
import '../../../widgets/investments/custom_shimmer_on_summary_detail.dart';
import '../../../widgets/investments/slide_button.dart';
import '../../setting_modules/screens/sub_setting_screen/contract_terms.dart';

class BulletPaymentDetail extends StatelessWidget {
  const BulletPaymentDetail({
    Key? key,
    this.isAnnullyRate = false,
    this.productName,
    this.isRenewal = false,
    this.renewBy,
    this.renewDate,
    this.renewPeriod,
    this.oldDate,
    this.newDate,
    this.investDate,
    this.investDuration,
    this.firstPayDate,
    this.maturityDate,
    this.investAmount,
    this.withdrawer,
    this.withdrawAmount,
    this.noticeDate,
    this.disbursementDate,
    this.contractStatus,
    this.isWithdraw = false,
    this.isStatusPending = false,
    this.id = 0,
    this.fiFApplicationDetailModel,
    this.isNoUSD,
    this.status = '',
    this.titles = '',
    this.oncallBack,
    this.annually,
    this.fromPage,
  }) : super(key: key);

  //Renewal

  final String? fromPage;
  final String? annually;
  final bool? isRenewal;
  final String? renewBy;
  final String? renewDate;
  final String? renewPeriod;
  final String? oldDate;
  final String? newDate;
  final String? investAmount;
//Detail Summery
  final String? investDate;
  final num? investDuration;
  final String? firstPayDate;
  final String? maturityDate;

//withdraw summery

  final bool? isWithdraw;
  final String? withdrawer;
  final String? withdrawAmount;
  final String? noticeDate;
  final String? disbursementDate;
  final String? contractStatus;
  final bool? isStatusPending;
  final String? status;
  final num? id;
  final bool? isNoUSD;
  final String? titles;
  final String? productName;
  final FiFApplicationDetailModel? fiFApplicationDetailModel;
  final GestureTapCallback? oncallBack;
  final bool isAnnullyRate;
  @override
  Widget build(BuildContext context) {
    final bulletCon = Get.put(PriceController());
    final settingCon = Get.put(SettingController());

    if (fromPage == null) {
      bulletCon.fetchFIFPendingDetail(id);
    } else {
      bulletCon.isLoadingPendingDetail.value = false;
    }

    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        title: titles,
        leading: id != null
            ? IconButton(
                icon: Platform.isIOS
                    ? const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.arrow_back,
                      ),
                onPressed: () {
                  Navigator.pop(context);
                  settingCon.isHideBottomNavigation.value = false;
                  settingCon.update();
                  settingCon.isHideBottomNavigation.refresh();
                },
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  settingCon.isHideBottomNavigation.value = false;
                  settingCon.update();
                  settingCon.isHideBottomNavigation.refresh();
                },
                icon: const Icon(Icons.close),
                color: Colors.black,
              ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 10),
                child: bulletCon.isLoadingPendingDetail.value
                    ? const Center(child: CustomShiSumDetail())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBulletPaymentCard(
                            isAnnullyRate: isAnnullyRate,
                            textUSD: bulletCon
                                .fiFApplicationDetailPending.value.currencyCode,
                            isFromCreate: investAmount != null &&
                                        fromPage == "from submit" ||
                                    fromPage == "from edit"
                                ? true
                                : false,
                            title: bulletCon.productNameType.value,
                            subTitle: fromPage == "widthdraw" ||
                                    fromPage == "from renewal"
                                ? annually ??
                                    bulletCon.fiFApplicationDetailPending.value
                                        .annuallyInterestRate
                                : "",
                            investAmount: investAmount ??
                                bulletCon.fiFApplicationDetailPending.value
                                    .investmentAmount,
                            isRenewal: isRenewal,
                            child: isRenewal == true && id != 0
                                ? Column(
                                    children: [
                                      ProductTypeDetailText(
                                        label: 'Re-new By',
                                        value: '$renewBy',
                                      ),
                                      const SizedBox(height: 15),
                                      ProductTypeDetailText(
                                        label: 'Re-new Date',
                                        value: '$renewDate',
                                      ),
                                      const SizedBox(height: 15),
                                      ProductTypeDetailText(
                                        label: 'Re-new Period',
                                        value: '$renewPeriod',
                                      ),
                                      const SizedBox(height: 15),
                                      ProductTypeDetailText(
                                        label: 'Old Maturity Date',
                                        value: '$oldDate',
                                      ),
                                      const SizedBox(height: 15),
                                      ProductTypeDetailText(
                                        label: 'New Maturity Date',
                                        value: '$newDate',
                                      ),
                                    ],
                                  )
                                : isWithdraw!
                                    ? Column(
                                        children: [
                                          ProductTypeDetailText(
                                            label: 'Withdrawer',
                                            value: withdrawer ?? '',
                                          ),
                                          const SizedBox(height: 15),
                                          ProductTypeDetailText(
                                            isAmount: true,
                                            label: 'Withdraw Amount',
                                            value: withdrawAmount ?? '',
                                          ),
                                          const SizedBox(height: 15),
                                          ProductTypeDetailText(
                                            label: 'Notice Date',
                                            value: noticeDate ?? '',
                                          ),
                                          const SizedBox(height: 15),
                                          ProductTypeDetailText(
                                            label: 'Disbursement Date',
                                            value: disbursementDate ?? '',
                                          ),
                                          const SizedBox(height: 15),
                                          ProductTypeDetailText(
                                            label: 'Contract Status',
                                            value: contractStatus ?? '',
                                            isPassive: '$contractStatus',
                                          ),
                                        ],
                                      )
                                    : bulletCon.productCode.value == 'MPD-0002'
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ProductTypeDetailText(
                                                label: 'Investment Date',
                                                value: fromPage == null
                                                    ? FormatDate
                                                        .investmentDateDisplay(
                                                            bulletCon
                                                                .fiFApplicationDetailPending
                                                                .value
                                                                .investmentDate!)
                                                    : FormatDate
                                                        .investmentDateDisplay(
                                                            '$investDate'),
                                              ),
                                              const SizedBox(height: 15),
                                              ProductTypeDetailText(
                                                label: 'Investment Duration',
                                                value: investDuration != null
                                                    ? "$investDuration Months"
                                                    : '${bulletCon.fiFApplicationDetailPending.value.duration}',
                                              ),
                                              const SizedBox(height: 15),
                                              ProductTypeDetailText(
                                                isAmount: true,
                                                label: "Deduction Amount",
                                                value: fromPage == null
                                                    ? "${FormatToK.digitNumber(num.parse(bulletCon.deductionAmount.value.toString()))} ${bulletCon.fiFApplicationDetailPending.value.currencyCode ?? ''}"
                                                    : "${FormatToK.digitNumber(num.parse(bulletCon.deductionAmount.value.toString()))} USD",
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              ProductTypeDetailText(
                                                label: 'Investment Date',
                                                value: fromPage == null
                                                    ? FormatDate
                                                        .investmentDateDisplay(
                                                            bulletCon
                                                                .fiFApplicationDetailPending
                                                                .value
                                                                .investmentDate!)
                                                    : FormatDate
                                                        .investmentDateDisplay(
                                                            '$investDate'),
                                              ),
                                              const SizedBox(height: 15),
                                              ProductTypeDetailText(
                                                label: 'Investment Duration',
                                                value: fromPage == null
                                                    ? bulletCon
                                                            .fiFApplicationDetailPending
                                                            .value
                                                            .duration ??
                                                        ''
                                                    : investDuration != null
                                                        ? "$investDuration Months"
                                                        : '${bulletCon.fiFApplicationDetailPending.value.duration}',
                                              ),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                          ),
                          if (status == 'reviewing')
                            Container(
                              padding: const EdgeInsets.all(20),
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.statusColor['pending']!
                                    .withOpacity(0.2),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/svgfile/warning.svg'),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      bulletCon.fiFApplicationDetailPending
                                              .value.description ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: AppColor
                                                  .statusColor['pending']),
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
              ),
            ),
            if (!isStatusPending!)
              Padding(
                padding: const EdgeInsets.all(20),
                child: SlideButton(
                  callback: oncallBack,
                  // () async {
                  //   await Future.delayed(const Duration(seconds: 0));
                  //   await bulletCon.onCreateFiF(context);
                  // },
                ),
              ),
            if (isStatusPending!)
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustomButton(
                  title: 'Close',
                  isDisable: false,
                  isOutline: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By submitting you agree to',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContractTerm(
                            fromPage: 'FiF',
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'CiC Service Agreement',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
