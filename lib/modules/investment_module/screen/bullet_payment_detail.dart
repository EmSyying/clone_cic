import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:cicgreenloan/configs/auto_route/auto_route.gr.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/investment_module/model/fif_application/fif_application.dart';
import 'package:cicgreenloan/widgets/investments/custom_bullet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/function/format_to_k.dart';
import '../../../widgets/investments/custom_product_type_detail.dart';
import '../../../widgets/investments/custom_shimmer_on_summary_detail.dart';
import '../../../widgets/investments/slide_button.dart';

class BulletPaymentDetail extends StatelessWidget {
  const BulletPaymentDetail({
    Key? key,
    @queryParam this.isAnnullyRate = false,
    @queryParam this.productName,
    @queryParam this.isRenewal = false,
    @queryParam this.renewBy,
    @queryParam this.renewDate,
    @queryParam this.renewPeriod,
    @queryParam this.oldDate,
    @queryParam this.newDate,
    @queryParam this.investDate,
    @queryParam this.investDuration,
    @queryParam this.firstPayDate,
    @queryParam this.maturityDate,
    @queryParam this.investAmount,
    @queryParam this.withdrawer,
    @queryParam this.withdrawAmount,
    @queryParam this.noticeDate,
    @queryParam this.disbursementDate,
    @queryParam this.contractStatus,
    @queryParam this.isWithdraw = false,
    @queryParam this.isStatusPending = false,
    @queryParam this.id,
    @queryParam this.fiFApplicationDetailModel,
    @queryParam this.isNoUSD = false,
    @queryParam this.status,
    @queryParam this.titles,
    @queryParam this.oncallBack,
    @queryParam this.annually,
    @queryParam this.fromPage,
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
  final bool isNoUSD;
  final String? titles;
  final String? productName;
  final FiFApplicationDetailModel? fiFApplicationDetailModel;
  final GestureTapCallback? oncallBack;
  final bool? isAnnullyRate;
  @override
  Widget build(BuildContext context) {
    debugPrint("is Renew:$isRenewal");
    final bulletCon = Get.put(PriceController());

    debugPrint("Hello id:$id hello from page:$fromPage");

    if (id != null && fromPage == null) {
      debugPrint("id:$id");
      bulletCon.fetchFIFPendingDetail(id);
    }
    if (fromPage == "widthdraw" ||
        fromPage == "from submit" ||
        fromPage == "from renewal") {
      bulletCon.isLoadingPendingDetail.value = false;
    }
    debugPrint(
        'helooooo currentcy:${bulletCon.fifAccountDetailModel.value.currencyCode}');
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
                },
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                                                value: id != null &&
                                                        fromPage == null
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
                                                value: id != null &&
                                                        fromPage == null
                                                    ? "${FormatToK.digitNumber(num.parse(bulletCon.deductionAmount.value.toString()))} ${bulletCon.fiFApplicationDetailPending.value.currencyCode ?? ''}"
                                                    : "${FormatToK.digitNumber(num.parse(bulletCon.deductionAmount.value.toString()))} USD",
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              ProductTypeDetailText(
                                                label: 'Investment Date',
                                                value: id != null &&
                                                        fromPage == null
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
                                                value: id != null &&
                                                        fromPage == null
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
                      context.router.push(ServiceAgreementRouter(
                        fromPage: 'FIF',
                      ));
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
