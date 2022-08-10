import 'package:cicgreenloan/modules/get_funding/models/payment_model/rebate.dart';

class PayNow {
  String? principle;
  String? interest;
  String? penalty;
  String? fee;
  String? extra;
  String? amount;
  Rebate? rebate;

  PayNow(
      {this.principle,
      this.interest,
      this.penalty,
      this.fee,
      this.extra,
      this.amount,
      this.rebate});

  PayNow.fromJson(Map<String, dynamic> json) {
    principle = json['principle'];
    interest = json['interest'];
    penalty = json['penalty'];
    fee = json['fee'];
    extra = json['extra'];
    amount = json['amount'];
    rebate = json['rebate'] != null ? Rebate.fromJson(json['rebate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['principle'] = principle;
    data['interest'] = interest;
    data['penalty'] = penalty;
    data['fee'] = fee;
    data['extra'] = extra;
    data['amount'] = amount;
    if (rebate != null) {
      data['rebate'] = rebate!.toJson();
    }
    return data;
  }
}
