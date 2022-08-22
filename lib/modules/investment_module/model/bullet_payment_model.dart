import 'package:flutter/material.dart';

import 'fif_application/fif_application.dart';

class BulletPaymentModel {
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
  final bool? isAnnullyRate;

  BulletPaymentModel(
      {this.fromPage,
      this.annually,
      this.isRenewal,
      this.renewBy,
      this.renewDate,
      this.renewPeriod,
      this.oldDate,
      this.newDate,
      this.investAmount,
      this.investDate,
      this.investDuration,
      this.firstPayDate,
      this.maturityDate,
      this.isWithdraw,
      this.withdrawer,
      this.withdrawAmount,
      this.noticeDate,
      this.disbursementDate,
      this.contractStatus,
      this.isStatusPending,
      this.status,
      this.id,
      this.isNoUSD,
      this.titles,
      this.productName,
      this.fiFApplicationDetailModel,
      this.oncallBack,
      this.isAnnullyRate});
}
