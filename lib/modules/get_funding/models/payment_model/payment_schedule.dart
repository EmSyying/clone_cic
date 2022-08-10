import 'package:cicgreenloan/modules/get_funding/models/payment_model/paidinfor.dart';

class PaymentSchedules {
  String? paymentDate;
  String? totalPayment;
  int? scheduleStatus;
  String? schedStatus;
  PaidInfo? paidInfo;

  PaymentSchedules(
      {this.paymentDate,
      this.totalPayment,
      this.scheduleStatus,
      this.schedStatus,
      this.paidInfo});

  PaymentSchedules.fromJson(Map<String, dynamic> json) {
    paymentDate = json['payment_date'] ?? '';
    totalPayment = json['total_payment'] ?? '';
    scheduleStatus = json['schedule_status'] ?? '';
    paidInfo =
        json['paid_info'] != null ? PaidInfo.fromJson(json['paid_info']) : null;
  }
  PaymentSchedules.fromjson(Map<String, dynamic> json) {
    paymentDate = json['payment_date'] ?? '';
    totalPayment = json['total_payment'] ?? '';
    schedStatus = json['schedule_status'] ?? '';
    paidInfo =
        json['paid_info'] != null ? PaidInfo.fromJson(json['paid_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_date'] = paymentDate;
    data['total_payment'] = totalPayment;
    data['schedule_status'] = scheduleStatus;
    if (paidInfo != null) {
      data['paid_info'] = paidInfo!.toJson();
    }
    return data;
  }
}
