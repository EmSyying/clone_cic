import 'package:flutter/material.dart';

import '../../../modules/investment_module/model/fif_application/fif_application.dart';
import '../../../modules/investment_module/model/fif_application/schedule/schedule.dart';

class BulletPaymentDetailArg {
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
  final int? index;
  final bool? hide;
  final String? investAmonut;
  final String? code;
  final String? currentPrincipal;
  final EdgeInsets? paddings;
  final String? accountName;
  final String? interestEarned;
  final FiFApplicationDetailModel? fiFApplicationModel;
  final String? contractCode;
  final List<ScheduleModelList>? scheduleModelList;

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

  BulletPaymentDetailArg({
    this.fromPage,
    this.annually,
    this.isRenewal = false,
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
    this.isWithdraw = false,
    this.withdrawer,
    this.withdrawAmount,
    this.noticeDate,
    this.disbursementDate,
    this.contractStatus,
    this.isStatusPending = false,
    this.status,
    this.id,
    this.isNoUSD,
    this.titles,
    this.productName,
    this.fiFApplicationDetailModel,
    this.oncallBack,
    this.isAnnullyRate = false,
    this.index,
    this.hide,
    this.investAmonut,
    this.code,
    this.currentPrincipal,
    this.paddings,
    this.accountName,
    this.interestEarned,
    this.fiFApplicationModel,
    this.contractCode,
    this.scheduleModelList,
  });
}
