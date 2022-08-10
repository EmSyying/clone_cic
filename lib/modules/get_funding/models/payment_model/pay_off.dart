import 'package:cicgreenloan/modules/get_funding/models/payment_model/rebate.dart';

class PayOff {
  int? customerId;
  int? duration;
  int? durationPaid;
  String? item;
  String? amount;
  String? amountPaid;
  String? totalPayment;
  String? principlePayoff;
  String? interestPayoff;
  String? penaltyPayoff;
  String? feePayoff;
  String? extraPayoff;
  Rebate? rebate;

  PayOff(
      {this.customerId,
      this.duration,
      this.durationPaid,
      this.item,
      this.amount,
      this.amountPaid,
      this.totalPayment,
      this.principlePayoff,
      this.interestPayoff,
      this.penaltyPayoff,
      this.feePayoff,
      this.extraPayoff,
      this.rebate});

  PayOff.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    duration = json['duration'];
    durationPaid = json['duration_paid'];
    item = json['item'];
    amount = json['amount'];
    amountPaid = json['amount_paid'];
    totalPayment = json['total_payment'];
    principlePayoff = json['principlePayoff'];
    interestPayoff = json['interestPayoff'];
    penaltyPayoff = json['penaltyPayoff'];
    feePayoff = json['feePayoff'];
    extraPayoff = json['extraPayoff'];
    rebate = json['rebate'] != null ? Rebate.fromJson(json['rebate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['duration'] = duration;
    data['duration_paid'] = durationPaid;
    data['item'] = item;
    data['amount'] = amount;
    data['amount_paid'] = amountPaid;
    data['total_payment'] = totalPayment;
    data['principlePayoff'] = principlePayoff;
    data['interestPayoff'] = interestPayoff;
    data['penaltyPayoff'] = penaltyPayoff;
    data['feePayoff'] = feePayoff;
    data['extraPayoff'] = extraPayoff;
    if (rebate != null) {
      data['rebate'] = rebate!.toJson();
    }
    return data;
  }
}
