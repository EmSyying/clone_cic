import 'package:cicgreenloan/modules/get_funding/models/payment_model/pay_now.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/pay_off.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment_schedule.dart';

class Payment {
  String? code;
  int? disbursementId;
  String? currency;
  int? scheduleId;
  String? paymentDate;
  String? amount;
  String? status;
  PayNow? payNow;
  PayOff? payOff;
  List<PaymentSchedules>? paymentSchedules;

  Payment(
      {this.code,
      this.disbursementId,
      this.currency,
      this.scheduleId,
      this.paymentDate,
      this.amount,
      this.status,
      this.payNow,
      this.payOff,
      this.paymentSchedules});

  Payment.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    disbursementId = json['disbursement_id'];
    currency = json['currency'];
    scheduleId = json['schedule_id'];
    paymentDate = json['payment_date'];
    amount = json['amount'];
    status = json['status'];
    payNow = json['pay_now'] != null ? PayNow.fromJson(json['pay_now']) : null;
    payOff = json['pay_off'] != null ? PayOff.fromJson(json['pay_off']) : null;
    if (json['payment_schedules'] != null) {
      paymentSchedules = <PaymentSchedules>[];
      json['payment_schedules'].forEach((v) {
        paymentSchedules!.add(PaymentSchedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['disbursement_id'] = disbursementId;
    data['currency'] = currency;
    data['schedule_id'] = scheduleId;
    data['payment_date'] = paymentDate;
    data['amount'] = amount;
    data['status'] = status;
    if (payNow != null) {
      data['pay_now'] = payNow!.toJson();
    }
    if (payOff != null) {
      data['pay_off'] = payOff!.toJson();
    }
    if (paymentSchedules != null) {
      data['payment_schedules'] =
          paymentSchedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
